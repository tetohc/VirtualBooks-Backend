from uuid import UUID
from pydantic import BaseModel
from datetime import date as DateType

class LegendDetailEntity(BaseModel):
    """
    **DTO (Data Transfer Object) que representa una leyenda.**

    **Atributos:**
    - id (str): Identificador único de la leyenda (UUID en formato string).
    - categoryId (str): Clave foránea que referencia la categoría de la leyenda (UUID en formato string).
    - category (str): Nombre de la categoría de la leyenda.
    - provinceId (int): Clave foránea que referencia a la provincia al que pertenece la leyenda.
    - province (str): Nombre la provincia al que pertenece la leyenda.
    - cantonId (int): Clave foránea que referencia al cantón al que pertenece la leyenda.
    - canton (str): Nombre del cantón al que pertenece la leyenda.
    - districtId (int): Clave foránea que referencia el distrito al que pertenece la leyenda.
    - district (str): Nombre del distrito al que pertenece la leyenda.
    - name (str): Nombre de la leyenda.
    - description (str): Descripción detallada de la leyenda.
    - imageUrl (str): URL de la imagen representativa de la leyenda.
    - date (str): Fecha relativa.
    -isActive (bool): Estado de la leyenda (activo/inactivo).
    """
    id: UUID
    categoryId: str
    category: str
    provinceId: int
    province: str
    cantonId: int
    canton: str
    districtId: int
    district: str
    name: str
    description: str
    imageUrl: str
    date: str
    isActive: bool