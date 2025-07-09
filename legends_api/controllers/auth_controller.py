from fastapi import APIRouter, Depends, status, Response
from sqlalchemy.orm import Session
from legends_config.database.db_config import get_connection_db
from legends_entities.responses import ApiResponse
from legends_bl.user_bl import UserBL
from legends_entities import UserCreateEntity

auth_router = APIRouter(
    prefix="/auth",
    tags=["auth"]
)

def get_user_bl(db: Session = Depends(get_connection_db)):
    return UserBL(db)

@auth_router.post(
    "/create",
    response_model=ApiResponse,
    responses={
        status.HTTP_201_CREATED: {"model": ApiResponse},
        status.HTTP_400_BAD_REQUEST: {"model": ApiResponse},
        status.HTTP_500_INTERNAL_SERVER_ERROR: {"model": ApiResponse}
    }
)
def create(response: Response, create_entity: UserCreateEntity, user_bl: UserBL = Depends(get_user_bl)):
    """
    Endpoint para crear un usuario en la base de datos.

    **Parámetros**:
    - `create_entity` (UserCreateEntity): DTO que representa los datos ingresados por el usuario para registrar un nuevo usuario.

    **Retorna**:
    - `ApiResponse`: Estructura de respuesta con el estado, mensaje y datos procesados.

    **Posibles respuestas**:
    - ✅ `201 Created`: La leyenda se ha creado correctamente. 
    - ❌ `400 Bad Request`: Datos inválidos. La solicitud no cumple con los requisitos esperados.
    - ⚠️ `500 Internal Server Error`: Ocurrió un error inesperado en el servidor.
    """
    result = user_bl.create(create_entity)

    if "error" in result:
        response.status_code = result["status"]
        return ApiResponse(
            statusCode=response.status_code,
            success=False,
            message=result["error"],
            data=None
        )

    response.status_code = status.HTTP_201_CREATED
    return ApiResponse(
        statusCode=response.status_code,
        success=True,
        message=result["message"],
        data=create_entity
    )

@auth_router.post(
    "/login",
    response_model=ApiResponse,
    responses={
        status.HTTP_200_OK: {"model": ApiResponse},
        status.HTTP_401_UNAUTHORIZED: {"model": ApiResponse},
        status.HTTP_404_NOT_FOUND: {"model": ApiResponse},
        status.HTTP_500_INTERNAL_SERVER_ERROR: {"model": ApiResponse}
    }
)
def login(response: Response, login_entity: UserCreateEntity, user_bl: UserBL = Depends(get_user_bl)):
    """
    Endpoint para autenticar al usuario con sus credenciales.

    **Parámetros**:
    - `login_entity` (UserCreateEntity): DTO con email y password del usuario.

    **Retorna**:
    - `ApiResponse`: Contiene el token de autenticación si la validación es exitosa.

    **Posibles respuestas**:
    - ✅ `200 OK`: Login exitoso y token generado.
    - ❌ `401 Unauthorized`: Credenciales inválidas.
    - ⚠️ `404 Not Found`: Usuario no encontrado.
    - ⚠️ `500 Internal Server Error`: Error inesperado.
    """
    result = user_bl.login(login_entity)

    if "error" in result:
        response.status_code = result["status"]
        return ApiResponse(
            statusCode=response.status_code,
            success=False,
            message=result["error"],
            data=None
        )

    response.status_code = status.HTTP_200_OK
    return ApiResponse(
        statusCode=response.status_code,
        success=True,
        message="Inicio de sesión exitoso",
        data={"token": result["token"]}
    )
