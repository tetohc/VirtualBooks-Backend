from sqlalchemy.orm import Session
from sqlalchemy.exc import SQLAlchemyError

from legends_models import UserModel


class UserDAL:
    """Capa de acceso a datos de usuarios"""

    def __init__(self, db: Session):
        self.db = db

    def create(self, model: UserModel):
        """
        Inserta un nuevo usuario en la base de datos.

        **Parámetros**:
        - `model` (UserModel): Instancia del modelo de usuario con los datos a registrar.

        **Retorna**:
        - Diccionario con la clave `"status"` y el mensaje correspondiente.
        """
        try:
            self.db.add(model)
            self.db.commit()
            self.db.refresh(model)

            return {"message": "Usuario registrado exitosamente.", "status": 201}

        except SQLAlchemyError as e:
            self.db.rollback()
            return {"error": f"Error al crear usuario: {str(e)}", "status": 500}

    def get_by_email(self, email: str):
        try:
            return self.db.query(UserModel).filter(UserModel.email == email).first()
        except SQLAlchemyError as e:
            return {"error": f"Error al consultar la base de datos: {str(e)}", "status": 500}
