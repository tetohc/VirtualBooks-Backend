from legends_config.database.db_config import Base
from sqlalchemy import Column, String


class UserModel(Base):
    """
    Modelo que representa un usuario en la base de datos.

    Atributos:
    - id (str): Identificador único del usuario (UUID en formato string).
    - email (str): Correo electrónico.
    - password (str): Contraseña.
    """
    __tablename__ = "user"

    id = Column(String(36), primary_key=True)
    email = Column(String(50), nullable=False)
    password = Column(String(100), nullable=False)
