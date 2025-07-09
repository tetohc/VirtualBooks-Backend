from legends_models import UserModel
from legends_entities import UserCreateEntity, UserEntity
import uuid


class UserMapper:
    """"Clase para la conversión entre modelos de base de datos (`UserModel`) y DTOs """

    @staticmethod
    def convert_create_to_model(create_entity: UserCreateEntity) -> UserModel:
        """
        Convierte una instancia de `UserCreateEntity` (DTO) en `UserModel` (modelo de base de datos).

        **Parámetros**:
        - `create_entity` (UserCreateEntity): Entidad que representa los datos ingresados por el usuario para registrar un usuario.

        **Retorna**:
        - `UserModel`: Instancia del modelo con los valores listos para ser almacenados en la base de datos.
        """
        return UserModel(
            id=str(uuid.uuid4()),
            email=create_entity.email.strip(),
            password=create_entity.password.strip(),
        )
