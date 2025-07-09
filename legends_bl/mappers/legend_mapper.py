from legends_models import LegendModel
from legends_entities import LegendEntity, LegendCreateEntity, LegendDetailEntity, LegendIndexEntity
from legends_bl.helper import relative_date
import uuid


class LegendMapper:
    """"Clase para la conversión entre modelos de base de datos (`LegendModel`) y DTOs """

    @staticmethod
    def convert_to_entity(legend_model: LegendModel) -> LegendEntity:
        """
        Convierte una instancia de `LegendModel` (modelo de base de datos) en `LegendEntity` (DTO).

        **Parámetros**:
        - `legend_model` (LegendModel): Instancia del modelo de base de datos que se convertirá en una entidad.

        **Retorna**:
        - `LegendEntity`: Instancia de entidad con los mismos valores que el modelo de base de datos.
        """
        return LegendEntity(
            id=legend_model.id,
            categoryId=legend_model.categoryId,
            districtId=legend_model.districtId,
            name=legend_model.name.strip() if legend_model.name else None,
            description=legend_model.description.strip() if legend_model.description else None,
            imageUrl=legend_model.imageUrl.strip() if legend_model.imageUrl else None,
            date=legend_model.date,
            isActive=legend_model.isActive
        )

    @staticmethod
    def convert_to_detail_entity(legend_model: LegendModel) -> LegendDetailEntity:
        """
        Convierte una instancia de `LegendModel` (modelo de base de datos) en `LegendEntity` (DTO).

        **Parámetros**:
        - `legend_model` (LegendModel): Instancia del modelo de base de datos que se convertirá en una entidad.

        **Retorna**:
        - `LegendEntity`: Instancia de entidad con los mismos valores que el modelo de base de datos.
        """
        return LegendDetailEntity(
            id=legend_model.id,
            categoryId=legend_model.categoryId,
            category=legend_model.category.name if legend_model.category.name else None,
            provinceId=legend_model.district.canton.provinceId if legend_model.district.canton.provinceId else None,
            province=legend_model.district.canton.province.name if legend_model.district.canton.province.name else None,
            cantonId=legend_model.district.cantonId if legend_model.district.cantonId else None,
            canton=legend_model.district.canton.name if legend_model.district.canton.name else None,
            districtId=legend_model.districtId,
            district=legend_model.district.name if legend_model.district.name else None,
            name=legend_model.name.strip() if legend_model.name else None,
            description=legend_model.description.strip() if legend_model.description else None,
            imageUrl=legend_model.imageUrl.strip() if legend_model.imageUrl else None,
            date=relative_date.get_relative_date(legend_model.date) if legend_model.date else None,
            isActive=legend_model.isActive
        )

    @staticmethod
    def convert_index_to_entity(legend_model: LegendModel) -> LegendIndexEntity:
        """
        Convierte una instancia de `LegendModel` (modelo de base de datos) en `LegendIndexEntity` (DTO).

        **Parámetros**:
        - `legend_model` (LegendModel): Instancia del modelo de base de datos que se convertirá en una entidad.

        **Retorna**:
        - `LegendEntity`: Instancia de entidad con los mismos valores que el modelo de base de datos.
        """
        return LegendIndexEntity(
            id=legend_model.id,
            categoryId=legend_model.categoryId,
            districtId=legend_model.districtId,
            name=legend_model.name.strip() if legend_model.name else None,
            description=legend_model.description.strip() if legend_model.description else None,
            imageUrl=legend_model.imageUrl.strip() if legend_model.imageUrl else None,
            normalDate=legend_model.date,
            date=relative_date.get_relative_date(legend_model.date) if legend_model.date else None,
            category=legend_model.category.name.strip() if legend_model.category.name else None,
            district=legend_model.district.name.strip() if legend_model.district.name else None,

            canton=legend_model.district.canton.name.strip(
            ) if legend_model.district.canton.name else None,

            province=legend_model.district.canton.province.name.strip(
            ) if legend_model.district.canton.province.name else None,

            isActive=legend_model.isActive
        )

    @staticmethod
    def convert_entity_to_model(entity: LegendEntity) -> LegendModel:
        """
        Convierte una instancia de `LegendEntity` (DTO) en `LegendModel` (modelo de base de datos).

        **Parámetros**:
        - `entity` (LegendEntity): Entidad que representa una leyenda existente en el sistema.

        **Retorna**:
        - `LegendModel`: Instancia del modelo con los valores listos para ser almacenados en la base de datos.
        """
        return LegendModel(
            id=str(entity.id),
            categoryId=str(entity.categoryId),
            districtId=entity.districtId,
            name=entity.name.strip() if entity.name else None,
            description=entity.description.strip() if entity.description else None,
            imageUrl=entity.imageUrl.strip() if entity.imageUrl else None,
            date=entity.date,
            isActive=entity.isActive
        )

    @staticmethod
    def convert_create_to_model(create_entity: LegendCreateEntity) -> LegendModel:
        """
        Convierte una instancia de `LegendCreateEntity` (DTO) en `LegendModel` (modelo de base de datos).

        **Parámetros**:
        - `create_entity` (LegendCreateEntity): Entidad que representa los datos ingresados por el usuario para crear una leyenda.

        **Retorna**:
        - `LegendModel`: Instancia del modelo con los valores listos para ser almacenados en la base de datos.
        """
        return LegendModel(
            id=str(uuid.uuid4()),
            categoryId=create_entity.categoryId,
            districtId=create_entity.districtId,
            name=create_entity.name.strip(),
            description=create_entity.description.strip(),
            imageUrl=create_entity.imageUrl.strip(),
            date=create_entity.date,
            isActive=True
        )
