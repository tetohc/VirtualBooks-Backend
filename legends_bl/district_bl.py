from sqlalchemy.orm import Session
from legends_dal import DistrictDAL
from legends_bl.mappers import DistrictMapper


class DistrictBL:
    """Capa de lógica de negocio para district"""

    def __init__(self, db: Session):
        self.db = db
        self.district_dal = DistrictDAL(self.db)

    def get_by_canton_id(self, canton_id: int):
        """
        Obtiene distritos por ID de cantón desde la capa DAL y los transforma en DTOs.

        **Retorna**:
        - Lista de objetos DTO de distritos si consulta es exitosa.
        - Diccionario con mensaje de error si falla.
        """
        result = self.district_dal.get_by_canton_id(canton_id)

        if "error" in result:
            return result

        return [DistrictMapper.convert_to_entity(district) for district in result]
