from sqlalchemy.orm import Session
from legends_models import ProvinceModel


class ProvinceDAL:
    """Capa de acceso a datos de province"""

    def __init__(self, db: Session):
        self.db = db  # Recibe una sesión activa de SQLAlchemy

    def get_all(self):
        """
        Obtiene todas las provincias disponibles en la base de datos.

        **Retorna:**
        - Lista de instancias de provincias.
        """
        provinces = self.db.query(ProvinceModel).all()
        return provinces
