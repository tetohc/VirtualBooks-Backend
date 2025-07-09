from fastapi import Request, HTTPException, status
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from legends_bl.helper import jwt_helper  

class BearerJWT(HTTPBearer):
    """"
    Middleware de autenticación JWT para proteger rutas privadas de la API.
    """
    def __init__(self, auto_error: bool = True):
        super(BearerJWT, self).__init__(auto_error=auto_error)

    async def __call__(self, request: Request) -> dict:
        credentials: HTTPAuthorizationCredentials = await super(BearerJWT, self).__call__(request)
        if not credentials or credentials.scheme.lower() != "bearer":
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Token de acceso no proporcionado o con esquema incorrecto"
            )

        payload = jwt_helper.validateToken(credentials.credentials)
        if payload is None:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail="Token inválido o expirado"
            )

        return payload 
