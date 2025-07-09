from sqlalchemy.orm import Session
from legends_dal import CantonDAL
from legends_bl.mappers import CantonMapper


class CantonBL:
    """Capa de lógica de negocio para canton"""

    def __init__(self, db: Session):
        self.db = db
        self.canton_dal = CantonDAL(self.db)

    def get_by_province_id(self, province_id: int):
        """
        OObtiene cantones por identificador único de provincia desde la capa DAL y los transforma en DTOs.

        **Retorna**:
        - Lista de objetos DTO de cantones si existen.
        - Diccionario con mensaje de error si no.
        """
        result = self.canton_dal.get_by_province_id(province_id)

        if "error" in result:
            return result

        return [CantonMapper.convert_to_entity(canton) for canton in result]
