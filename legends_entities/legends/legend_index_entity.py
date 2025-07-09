from uuid import UUID
from pydantic import BaseModel
from datetime import date as DateType


class LegendIndexEntity(BaseModel):
    """
    **DTO (Data Transfer Object) que representa una leyenda con sus datos visibles en la vista index.**

    **Atributos:**
    - id (str): Identificador único de la leyenda (UUID en formato string).
    - categoryId (str): Clave foránea que referencia la categoría de la leyenda (UUID en formato string).
    - districtId (int): Clave foránea que referencia el distrito al que pertenece la leyenda.
    - name (str): Nombre de la leyenda.
    - description (str): Descripción detallada de la leyenda.
    - imageUrl (str): URL de la imagen representativa de la leyenda.
    - normalDate (str): Fecha normal (tipo date).
    - date (str): Fecha relativa.
    - category (string): Nombre de categoría de leyenda.
    - district (string): Nombre de distrito.
    - canton (string): Nombre de canton.
    - province (string): Nombre de provincia.
    - isActive (bool): Estado de la leyenda (activo/inactivo).
    """
    id: UUID
    categoryId: str
    districtId: int
    name: str
    description: str
    imageUrl: str
    normalDate: DateType
    date: str
    category: str
    district: str
    canton: str
    province: str
    isActive: bool
