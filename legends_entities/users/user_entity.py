from uuid import UUID
from pydantic import BaseModel

class UserEntity(BaseModel):
    """
    **DTO (Data Transfer Object) que representa una leyenda.**

    **Atributos:**
    - id (str): Identificador único de la leyenda (UUID en formato string).
    - email (str): Correo electrónico.
    - token: token jwt.
    """
    id: UUID
    email: str
    token: str