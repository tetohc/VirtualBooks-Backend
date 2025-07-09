from datetime import datetime, timezone, timedelta
import jwt
from jwt import ExpiredSignatureError, InvalidTokenError, DecodeError
from legends_config.settings import settings


def createToken(data: dict):
    payload = {
        **data,
        "exp": datetime.now(timezone.utc) + timedelta(hours=1) 
    }
    token = jwt.encode(payload, key=settings.jwt_key, algorithm="HS256")
    return token


def validateToken(token: str) -> dict | None:
    try:
        return jwt.decode(token, key=settings.jwt_key, algorithms=["HS256"])
    except (ExpiredSignatureError, InvalidTokenError, DecodeError):
        return None
