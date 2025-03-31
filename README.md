# Watchdog::Dashboard

Watchdog Dashboard es un engine de Rails que proporciona una interfaz visual para monitorear el rendimiento y la fiabilidad de tus pruebas RSpec. Este dashboard forma parte del ecosistema [RspecWatchdog](https://github.com/tu-usuario/rspec_watchdog), pero está diseñado específicamente para integrarse con aplicaciones Rails.

## Características

- **Visualización de métricas**: Gráficos y tablas para analizar los tiempos de ejecución de tus pruebas
- **Detección de pruebas inestables**: Identifica pruebas que fallan intermitentemente
- **Seguimiento de tendencias**: Monitorea la salud de tu suite de pruebas a lo largo del tiempo
- **Estadísticas completas**: Visualiza datos como ejecuciones totales, fallos y tiempos medios de prueba
- **Integración sencilla**: Fácil de configurar en cualquier aplicación Rails existente

## Capturas de pantalla

[Aquí puedes incluir algunas capturas de pantalla del dashboard]

## Instalación

### Paso 1: Agregar la gema a tu Gemfile

```ruby
gem 'watchdog-dashboard'
```

Luego ejecuta:

```bash
bundle install
```

### Paso 2: Instalar y ejecutar las migraciones

```bash
bin/rails watchdog_dashboard:install:migrations
bin/rails db:migrate
```

### Paso 3: Montar el engine en tus rutas

En `config/routes.rb`, agrega:

```ruby
mount Watchdog::Dashboard::Engine => "/watchdog"
```

Esto hará que el dashboard esté disponible en `/watchdog` en tu aplicación Rails.

### Paso 4: Configuración

Crea un archivo de configuración en `config/initializers/watchdog_dashboard.rb`:

```ruby
Watchdog::Dashboard.configure do |config|
  config.watchdog_api_token = "tu_token_secreto" # Cámbialo por un valor seguro
end
```

## Usando con RspecWatchdog

Para obtener el máximo beneficio, debes usar Watchdog Dashboard junto con la gema [RspecWatchdog](https://github.com/tu-usuario/rspec_watchdog), que se encarga de recopilar los datos durante la ejecución de tus pruebas.

Configura RspecWatchdog en tu `spec/rails_helper.rb`:

```ruby
require "rspec_watchdog"

RspecWatchdog.configure do |config|
  config.show_logs = true
  config.watchdog_api_url = "http://localhost:3000/watchdog/analytics"
  config.watchdog_api_token = "tu_token_secreto" # Debe coincidir con el token del dashboard
end

RSpec.configure do |config|
  config.add_formatter(:progress) # Formateador predeterminado de RSpec
  config.add_formatter(SlowSpecFormatter)
end
```

**Importante**: Asegúrate de que el `watchdog_api_token` coincida entre RspecWatchdog y Watchdog::Dashboard.

## Opciones de configuración

### `watchdog_api_token`

Este token se utiliza para validar que las solicitudes enviadas a la API del dashboard son legítimas.

- Si estás ejecutando pruebas en un entorno de CI/CD (por ejemplo, GitHub Actions o CircleCI), puedes establecer este valor como una variable de entorno.
- Para entornos de desarrollo, puedes usar un valor constante, pero asegúrate de no incluirlo en el control de versiones.

## Navegando por el Dashboard

Una vez configurado, el dashboard estará disponible en `/watchdog` y mostrará:

- **Panel principal**: Resumen de métricas clave y tendencias generales
- **Pruebas lentas**: Lista de pruebas que tardan más en ejecutarse
- **Pruebas inestables**: Identificación de pruebas que fallan intermitentemente
- **Historial de ejecuciones**: Seguimiento de todas las ejecuciones de pruebas
- **Configuración**: Ajustes para personalizar el dashboard

## Integración con CI/CD

Para aprovechar al máximo Watchdog Dashboard en un entorno CI/CD:

1. Configura el token como una variable de entorno segura en tu plataforma de CI/CD
2. Asegúrate de que tus pruebas envíen datos al endpoint correcto
3. Usa el dashboard para analizar tendencias después de cada ejecución de CI

## Contribuir

Las contribuciones son bienvenidas. Si tienes ideas, sugerencias o encuentras un error, por favor abre un issue o envía un pull request en GitHub.

## Licencia

Este engine está disponible como código abierto bajo los términos de la [Licencia MIT](https://opensource.org/licenses/MIT).
