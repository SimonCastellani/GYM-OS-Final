const { sequelize } = require("./db");
const { QueryTypes } = require("sequelize");
const modelos = require("../models");

function identificador(nombre) {
  if (!/^[a-z_][a-z0-9_]*$/.test(nombre))
    throw new Error("Identificador de datos no válido");
  return "`" + nombre + "`";
}

// MySQL calcula el DVH sobre los valores que realmente guarda. Así también
// se actualiza cuando un dato cambia por una acción de una clave foránea.
async function instalarIntegridad() {
  const tablas = [];
  for (const modelo of Object.values(modelos)) {
    const nombre = modelo.getTableName();
    if (nombre === "recuperaciones") continue;
    const tabla = identificador(nombre);
    const columnas = await sequelize.query("SHOW COLUMNS FROM " + tabla, {
      type: QueryTypes.SELECT,
    });
    const campos = columnas
      .filter((columna) => columna.Field !== "dvh")
      .map((columna) => identificador(columna.Field)).sort();
    const dvh = columnas.find((columna) => columna.Field === "dvh");
    if (!dvh || !dvh.Extra.includes("VIRTUAL GENERATED")) {
      await sequelize.query(
        "ALTER TABLE " + tabla + (dvh ? " DROP COLUMN dvh," : "") + " ADD COLUMN" +
        " dvh CHAR(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(" +
        campos.join(", ") + ") AS CHAR), 256)) VIRTUAL",
      );
    }
    tablas.push({ nombre, tabla });
  }
  // La vista consulta los valores vigentes, incluso después de una baja en cascada.
  await sequelize.query("CREATE OR REPLACE VIEW digitos_verificadores AS " +
    tablas.map(({ nombre, tabla }) =>
      "SELECT '" + nombre + "' AS nombre_tabla, COUNT(*) AS filas, " +
      "SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM " +
      tabla,
    ).join(" UNION ALL "));
}

module.exports = { instalarIntegridad };
