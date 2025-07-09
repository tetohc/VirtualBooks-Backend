from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import uvicorn

from legends_api.controllers import cantons_router
from legends_api.controllers import categories_router
from legends_api.controllers import district_router
from legends_api.controllers import legends_router
from legends_api.controllers import provinces_router
from legends_api.controllers import image_router
from legends_api.controllers import auth_router

app = FastAPI(
    title="Libro virtual API",
    description="API de libro virtual de leyendas costarricenses.",
    version="1.0.0",
    contact={
        "name": "Jerry HC",
        "url": "https://github.com/tetohc/4thewords_backend_jerry__hurtado.git",
        "email": "",
    },
    license_info={
        "name": "MIT",
        "url": "https://opensource.org/licenses/MIT"
    }
)

origins = ["http://localhost:3000",]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(auth_router)
app.include_router(cantons_router)
app.include_router(categories_router)
app.include_router(district_router)
app.include_router(legends_router)
app.include_router(provinces_router)
app.include_router(image_router)

if __name__ == "__main__":
    uvicorn.run("main:app", port=8080, reload=True)
