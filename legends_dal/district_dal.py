from sqlalchemy.orm import Session
from legends_models import DistrictModel
from legends_models import CantonModel


class DistrictDAL:
    """Capa de acceso a datos para district"""

    def __init__(self, db: Session):
        self.db = db  # Recibe una sesión activa de SQLAlchemy

    def get_by_canton_id(self, canton_id: int):
        """
        Busca distritos por el identificador del cantón.

        **Retorna**:
        - Listado de distritos si la operación sale bien.
        - Diccionario con mensaje de error si falla.
        """
        try:
            # Verificar si el cantón existe antes de buscar distritos
            canton = self.db.query(CantonModel).filter(
                CantonModel.id == canton_id).first()
            if not canton:
                return {"error": "El cantón no existe en la base de datos", "status": 404}

            # Obtener distritos asociados al cantón
            districts_list = self.db.query(DistrictModel).filter(
                DistrictModel.cantonId == canton.id).all()

            return districts_list
        except Exception as e:
            return {"error": f"Error en la consulta: {str(e)}", "status": 500}
