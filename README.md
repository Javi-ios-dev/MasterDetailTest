# Práctica

Este es un proyecto de demostración utilizando la arquitectura **Clean Swift** en una aplicación iOS. La app obtiene y muestra una lista de usuarios desde la API de [JSONPlaceholder](https://jsonplaceholder.typicode.com/users) y permite ver detalles de cada usuario.

## ¿Qué es Clean Swift?

Clean Swift es una implementación de la arquitectura VIP (View-Interactor-Presenter) basada en Clean Architecture de Robert C. Martin (Uncle Bob). Su objetivo es separar la lógica de negocio de la lógica de presentación para hacer el código más modular y mantenible.

## Estructura del Proyecto

El proyecto está organizado en módulos según Clean Swift:

- **Models**: Define los modelos de datos utilizados en la aplicación.
- **Worker**: Se encarga de obtener los datos, generalmente llamando a un servicio o base de datos.
- **Interactor**: Contiene la lógica de negocio y solicita datos al Worker.
- **Presenter**: Formatea los datos para que sean presentables en la vista.
- **Router**: Maneja la navegación entre pantallas.
- **ViewController**: Muestra la interfaz gráfica y recibe eventos del usuario.
