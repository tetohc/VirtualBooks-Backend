from fastapi import APIRouter, Depends, status, Response
from typing import List
from sqlalchemy.orm import Session
from legends_config.database.db_config import get_connection_db
from legends_entities.responses import ApiResponse
from legends_bl import ProvinceBL
from legends_entities import ProvinceEntity
from legends_api.middlewares.jwt_middleware import BearerJWT

provinces_router = APIRouter(
    prefix="/provinces",  
    tags=["Provinces"],
    dependencies=[Depends(BearerJWT())]
)


def get_province_bl(db: Session = Depends(get_connection_db)):
    """
    Dependencia para inicializar ProvinceBL con una sesión de la base de datos.

    **Parámetros**:
    - `db` (Session): Sesión activa de SQLAlchemy obtenida desde `get_connection_db`.

    **Retorna**:
    - `ProvinceBL`: Instancia de la capa de lógica de negocio con la sesión de base de datos.
    """
    return ProvinceBL(db)


@provinces_router.get(
    "/",
    response_model=ApiResponse[List[ProvinceEntity]],
    responses={
        status.HTTP_200_OK: {"model": ApiResponse},
        status.HTTP_500_INTERNAL_SERVER_ERROR: {"model": ApiResponse},
    }
)
def get_all(response: Response, province_bl: ProvinceBL = Depends(get_province_bl)) -> ApiResponse[List[ProvinceEntity]]:
    """
    Obtiene todas las provincia registradas en la base de datos.

    **Posibles respuestas**:
    - ✅ `200 OK`: Lista de provincias obtenida correctamente.
    - ⚠️ `500 Internal Server Error`: Ocurrió un error inesperado en el servidor.

    **Retorna**:
    - `ApiResponse[List[ProvinceEntity]]`: Estructura de respuesta con el estado, mensaje y lista de provincias.
    """
    try:
        cantons = province_bl.get_all()

        response.status_code = status.HTTP_200_OK
        return ApiResponse[List[ProvinceEntity]](
            statusCode=response.status_code,
            success=True,
            message="Lista de provincias obtenida correctamente",
            data=cantons
        )

    except Exception as e:
        response.status_code = status.HTTP_500_INTERNAL_SERVER_ERROR
        return ApiResponse(
            statusCode=status.HTTP_500_INTERNAL_SERVER_ERROR,
            success=False,
            message=f"Error inesperado: {str(e)}",
            data=None
        )