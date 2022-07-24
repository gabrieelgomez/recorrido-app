# README
## Pre-requisitos

- Ruby 2.7.6
- Rails 7.0.3
- turbo-rails 1.1.1
- stimulus-rails 1.1.0
- Talwindcss v2

## Instalación
- Instalar ruby `2.7.6`
- `bundle install`
- `rails db:create db:migrate rails db:seed`
- correr el servidor de rails con `bin/dev`

### Descripción
* Backend desarrollado en Ruby on Rails, por metodología MVC y usando services para centralizar procesos de crear turnos.
* Unit test con Rspec
* El frontend se desarrolló con el MVC de RoR, con la inclusión de usar Turbo Rails y Stimulus.js (turbo_frame y turbo_stream)
* Se utilizó turbo_stream_from en service_hour, para tener un broadcast o streaming en tiempo real de cada vez que muta este modelo para una instancia, gracias al método de broadcasts_to dentro de su modelo.
* Se utilizó turbo_frame_tag en el listado de services y services_days, para tener un live reload de los filtros por los selects

### Descripción ERD
> Company Table
* Tabla que almacena nombre de la empresa, tabla de orden superior

> Employee Table
* Tabla que almacena datos del trabajador/empleado/ingeniero y se relaciona con Company

> Service Table
* Tabla que guarda los datos de los contratos de la empresa, tiene una fecha inicio y una fecha fin, y las semanas son calculadas con un método privado #weeks las cuales luegos son renderizadas en un select para filtrar por semanas. Se agregó un campo json para guardar las configuraciones por dia que tendrá este contrato/servicio. Se relaciona directo con Company

> Service Day Table
* Tabla que almacena datos de un dia de monitoreo, los cuales son creados de acuerdo a cuantos dias existen en el rango de fechas de su tabla padre Service. Tiene una hora inicio y hora fin, ejemplo 8am - 4pm.

> Service Day Table
* Tabla que almacena una hora, relacionado con un dia y un servicio. Tiene asociación directa con employee para saber quien tendrá este turno asignado.
