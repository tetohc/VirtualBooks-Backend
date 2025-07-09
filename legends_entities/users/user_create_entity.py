from pydantic import BaseModel

class UserCreateEntity(BaseModel):
    """
    **DTO para la creación de un usuario**

    **Atributos:**
    - email (str): Correo electrónico.
    - password (str): Contraseña.
    """
    email: str
    password: str