from fastapi import APIRouter, Depends, status, Response
from typing import List
from sqlalchemy.orm import Session
from legends_config.database.db_config import get_connection_db
from legends_entities.responses import ApiResponse
from legends_bl import DistrictBL
from legends_entities.districts import DistrictEntity
from legends_api.middlewares.jwt_middleware import BearerJWT

district_router = APIRouter(
    prefix="/districts",
    tags=["Districts"],
    dependencies=[Depends(BearerJWT())]
)


def get_district_bl(db: Session = Depends(get_connection_db)):
    """
    Dependencia para inicializar DistrictBL con una sesión de la base de datos.

    **Parámetros**:
    - `db` (Session): Sesión activa de SQLAlchemy obtenida desde `get_connection_db`.

    **Retorna**:
    - `DistrictBL`: Instancia de la capa de lógica de negocio con la sesión de base de datos.
    """
    return DistrictBL(db)


@district_router.get(
    "/{canton_id}",
    response_model=ApiResponse[List[DistrictEntity]],
    responses={
        status.HTTP_200_OK: {"model": ApiResponse},
        status.HTTP_500_INTERNAL_SERVER_ERROR: {"model": ApiResponse},
    }
)
def get_by_canton_id(response: Response, canton_id: int, district_bl: DistrictBL = Depends(get_district_bl)) -> ApiResponse[List[DistrictEntity]]:
    """
    Obtiene los distritos por el identificador único de un cantón.

    **Parámetros**:
    - `canton_id (int)`: Identificador único del cantón al que pertenecen los distritos.

    **Posibles respuestas**:
    - ✅ `200 OK`: Lista de distritos obtenida correctamente.
    - ⚠️ `404 Not Found`: No hay distritos registrados en la base de datos.
    - ⚠️ `500 Internal Server Error`: Ocurrió un error inesperado en el servidor.

    **Retorna**:
    - `ApiResponse[List[DistrictEntity]]`: Estructura de respuesta con el estado, mensaje y lista de distritos.
    """
    result = district_bl.get_by_canton_id(canton_id)

    if "error" in result:
        response.status_code = result["status"]
        return ApiResponse[List[DistrictEntity]](
            statusCode=response.status_code,
            success=False,
            message=result["error"],
            data=None
        )

    return ApiResponse[List[DistrictEntity]](
        statusCode=status.HTTP_200_OK,
        success=True,
        message="Lista de distritos obtenida correctamente.",
        data=result
    )
