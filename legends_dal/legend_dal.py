from sqlalchemy.orm import Session, joinedload
from sqlalchemy.exc import SQLAlchemyError
from typing import List
from legends_models import LegendModel, DistrictModel, CantonModel


class LegendDAL:
    """Capa de acceso a datos de libro virtual de leyenda costarricense"""

    def __init__(self, db: Session):
        self.db = db  # Recibe una sesión activa de SQLAlchemy

    def create(self, model: LegendModel):
        """
        Inserta una nueva leyenda en la base de datos.

        **Parámetros**:
        - `model` (LegendModel): Instancia del modelo de leyenda con los datos a registrar.

        **Retorna**:
        - Diccionario con la clave `"status"` y el mensaje correspondiente.
        """
        try:
            self.db.add(model)
            self.db.commit()
            self.db.refresh(model)

            return {"message": "Leyenda creada exitosamente.", "status": 201}

        except SQLAlchemyError as e:
            self.db.rollback()
            return {"error": f"Error al crear la leyenda: {str(e)}", "status": 500}

    def update(self, model: LegendModel):
        """
        Actualiza una leyenda existente en la base de datos.

        **Parámetros**:
        - `model` (LegendModel): Instancia del modelo de leyenda con los datos actualizados.

        **Retorna**:
        - Diccionario con la clave `"status"` y el mensaje correspondiente.
        """
        try:
            self.db.commit()
            self.db.refresh(model)

            return {"message": "Leyenda actualizada exitosamente.", "status": 200}
        except SQLAlchemyError as e:
            self.db.rollback()
            return {"error": f"Error al actualizar la leyenda: {str(e)}", "status": 500}

    def get_by_id(self, legend_id: str):
        """
        Obtiene una leyenda específica según su ID.

        **Parámetros**:
        - `legend_id` (str): Identificador único de la leyenda a buscar.

        **Retorna**:
        - Instancia de `LegendModel` si la leyenda existe en la base de datos.
        - Diccionario con mensaje de error y código de estado si ocurre un problema.
        """
        try:
            legend = self.db.query(LegendModel).filter(
                LegendModel.id == legend_id, LegendModel.isActive == True).first()
            return legend
        except SQLAlchemyError as e:
            return {"error": f"Error al consultar la base de datos: {str(e)}", "status": 500}

    def get_detail_by_id(self, legend_id: str):
        """
        Obtiene detalles de una leyenda específica según su ID.

        **Parámetros**:
        - `legend_id` (str): Identificador único de la leyenda a buscar.

        **Retorna**:
        - Instancia de `LegendModel` si la leyenda existe en la base de datos.
        - Diccionario con mensaje de error y código de estado si ocurre un problema.
        """
        try:
            legend = self.db.query(LegendModel).options(
                joinedload(LegendModel.category),
                joinedload(LegendModel.district).joinedload(
                    DistrictModel.canton).joinedload(CantonModel.province)
            ).filter(
                LegendModel.id == legend_id, LegendModel.isActive == True).first()
            return legend
        except SQLAlchemyError as e:
            return {"error": f"Error al consultar la base de datos: {str(e)}", "status": 500}

    def get_all(self):
        """
        Obtiene todas las leyendas registradas en la base de datos con soporte para paginación.

        **Parámetros**:
        - `skip` (int): Cantidad de registros a omitir (para paginación).
        - `limit` (int): Cantidad máxima de registros a devolver.

        **Returns**:
        - Lista de leyendas si la consulta es exitosa.
        - Diccionario con `"error"` y `"status"` en caso de fallo.
        """
        try:
            legends: List[LegendModel] = self.db.query(
                LegendModel).options(
                    joinedload(LegendModel.category),
                    joinedload(LegendModel.district).joinedload(
                        DistrictModel.canton).joinedload(CantonModel.province)
            ).filter(LegendModel.isActive == True).all()

            return legends

        except SQLAlchemyError as e:
            return {"error": f"Error al obtener las leyendas: {str(e)}", "status": 500}
