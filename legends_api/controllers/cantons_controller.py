from fastapi import APIRouter, Depends, status, Response
from typing import List
from sqlalchemy.orm import Session
from legends_config.database.db_config import get_connection_db
from legends_entities.responses import ApiResponse
from legends_bl import CantonBL
from legends_entities import CantonEntity
from legends_api.middlewares.jwt_middleware import BearerJWT

cantons_router = APIRouter(
    prefix="/cantons",
    tags=["Cantons"],
    dependencies=[Depends(BearerJWT())]
)


def get_canton_bl(db: Session = Depends(get_connection_db)):
    """
    Dependencia para inicializar CantonBL con una sesión de la base de datos.

    **Parámetros**:
    - `db` (Session): Sesión activa de SQLAlchemy obtenida desde `get_connection_db`.

    **Retorna**:
    - `CantonBL`: Instancia de la capa de lógica de negocio con la sesión de base de datos.
    """
    return CantonBL(db)


@cantons_router.get(
    "/{province_id}",
    response_model=ApiResponse[List[CantonEntity]],
    responses={
        status.HTTP_200_OK: {"model": ApiResponse[List[CantonEntity]]},
        status.HTTP_500_INTERNAL_SERVER_ERROR: {"model": ApiResponse[None]},
    }
)
def get_by_province_id(response: Response, province_id: int, canton_bl: CantonBL = Depends(get_canton_bl)) -> ApiResponse[List[CantonEntity]]:
    """
    Obtiene todos los cantones por el identificador único de una provincia

    **Parámetros**:
    - `province_id (int)`: Identificador único de la provincia a la que pertenecen los cantones.
    
    **Posibles respuestas**:
    - ✅ `200 OK`: Lista de cantones obtenida correctamente.
    - ⚠️ `404 Not Found`: No hay cantones registrados en la base de datos.
    - ⚠️ `500 Internal Server Error`: Ocurrió un error inesperado en el servidor.

    **Retorna**:
    - `ApiResponse[List[CantonEntity]]`: Estructura de respuesta con el estado, mensaje y lista de cantones.
    """
    result = canton_bl.get_by_province_id(province_id)

    if "error" in result:
        response.status_code = result["status"]
        return ApiResponse[List[CantonEntity]](
            statusCode=response.status_code,
            success=False,
            message=result["error"],
            data=None
        )

    return ApiResponse[List[CantonEntity]](
        statusCode=status.HTTP_200_OK,
        success=True,
        message="Lista de cantones obtenida correctamente.",
        data=result
    )
