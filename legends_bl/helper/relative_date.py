from datetime import date
from dateutil.relativedelta import relativedelta

def get_relative_date(date: date) -> str:
    """
    Convierte una fecha a una fecha relativa.
    """
    now = date.today()
    delta = relativedelta(now, date)

    if delta.years > 0:
        return f"hace {delta.years} año{'s' if delta.years > 1 else ''}"
    elif delta.months > 0:
        return f"hace {delta.months} mes{'es' if delta.months > 1 else ''}"
    elif delta.days > 0:
        return f"hace {delta.days} día{'s' if delta.days > 1 else ''}"
    elif delta.hours > 0:
        return f"hace {delta.hours} hora{'s' if delta.hours > 1 else ''}"
    elif delta.minutes > 0:
        return f"hace {delta.minutes} minuto{'s' if delta.minutes > 1 else ''}"
    else:
        return "hace unos segundos"
