from sqlalchemy.orm import Session
from legends_models import CategoryModel


class CategoryDAL:
    """Capa de acceso a datos de category"""

    def __init__(self, db: Session):
        self.db = db  # Recibe una sesión activa de SQLAlchemy

    def get_all(self):
        """
        Obtiene todas las categorías disponibles en la base de datos.

        **Retorna**:
        - Listado de categorías.
        """
        categories = self.db.query(CategoryModel).all()
        return categories
