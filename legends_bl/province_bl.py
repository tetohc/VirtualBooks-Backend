from sqlalchemy.orm import Session
from legends_dal import ProvinceDAL
from legends_bl.mappers import ProvinceMapper


class ProvinceBL:
    """Capa de lógica de negocio para province"""

    def __init__(self, db: Session):
        self.db = db
        self.province_dal = ProvinceDAL(self.db)

    def get_all(self):
        """
        Obtiene todas las provincias desde la capa DAL y los transforma en DTOs.

        **Retorna**:
        - Lista de objetos DTO de provincias.
        """
        provinces = self.province_dal.get_all()
        return [ProvinceMapper.convert_to_entity(x) for x in provinces]
