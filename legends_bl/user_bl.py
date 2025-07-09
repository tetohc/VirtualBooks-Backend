from sqlalchemy.orm import Session
from legends_dal import UserDAL
from legends_bl.mappers import UserMapper
from legends_entities import UserCreateEntity
from legends_bl.helper import jwt_helper
import bcrypt


class UserBL:
    def __init__(self, db: Session):
        self.db = db
        self.user_dal = UserDAL(self.db)

    def create(self, create_entity: UserCreateEntity):
        """
        Crea un nuevo usuario en la base de datos a través de la capa DAL.

        **Parámetros**:
        - `create_entity` (UserCreateEntity): DTO que representa los datos ingresados por el usuario.

        **Retorna**:
        - Diccionario con mensaje de éxito y código de estado `201` si la operación es exitosa.
        - Diccionario con mensaje de error y código de estado `500` si ocurre un fallo en la capa BL.
        """
        try:
            existing = self.user_dal.get_by_email(create_entity.email.strip())
            if existing:
                return {"error": "El email ya está registrado.", "status": 400}

            model = UserMapper.convert_create_to_model(create_entity)
            model.password = self.hash_password(model.password.strip())

            return self.user_dal.create(model)
        except Exception as e:
            return {"error": f"Error en la capa BL al crear usuario: {str(e)}", "status": 500}

    def login(self, model: UserCreateEntity):
        try:
            user = self.user_dal.get_by_email(model.email.strip())
            if not user:
                return {"error": "Usuario no encontrado", "status": 404}

            # Comparar la contraseña ingresada con el hash almacenado
            if bcrypt.checkpw(model.password.strip().encode('utf-8'), user.password.encode('utf-8')):
                token = jwt_helper.createToken({ "id": user.id, "email": user.email })
                return {"token": token, "status": 200}
            else:
                return {"error": "Contraseña incorrecta", "status": 401}
        except Exception as e:
            return {"error": f"Error en BL al intentar login: {str(e)}", "status": 500}

    @staticmethod
    def hash_password(password: str) -> str:
        """
        Crea un hash para el password
        """
        salt = bcrypt.gensalt()
        hashed = bcrypt.hashpw(password.encode('utf-8'), salt)
        return hashed.decode('utf-8')
