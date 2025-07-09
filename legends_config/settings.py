from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    # Clase de configuración que hereda de BaseSettings.
    database_url: str
    jwt_key: str

    # Cloudinary
    cloudinary_cloud_name: str
    cloudinary_api_key: str
    cloudinary_api_secret: str

    model_config = SettingsConfigDict(
        env_file=".env",
    )


# Cargará las variables definidas en .env.
settings = Settings()