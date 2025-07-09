from fastapi import APIRouter,Depends, UploadFile, File, status
from cloudinary.uploader import upload
from legends_config.cloudinary.cloudinary_config import cloudinary
from legends_entities.responses import ApiResponse
from legends_api.middlewares.jwt_middleware import BearerJWT

image_router = APIRouter(
    prefix="/images",
    tags=["images"],
    dependencies=[Depends(BearerJWT())]
)


@image_router.post("/upload")
async def upload_file(file: UploadFile = File(...)):
    try:
        result = upload(file.file, folder="books")

        image_url = result.get("secure_url")
        return ApiResponse(
            statusCode=status.HTTP_200_OK,
            success=True,
            message="Imagen subida correctamente.",
            data=image_url
        )

    except Exception as e:
        return ApiResponse(
            statusCode=status.HTTP_500_INTERNAL_SERVER_ERROR,
            success=False,
            message=f"Error al subir imagen: {str(e)}",
            data=None
        )
