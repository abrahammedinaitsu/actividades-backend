# Contrato de autenticación — Request API v5

Documenta ANTES de implementar. Para cada endpoint: método, ruta, ¿público o
protegido?, body permitido, respuesta de éxito (código + forma) y CADA error
(código HTTP + `error.code`).

## POST /auth/register 
publico. body permitido: 'email', password' (nada mas.)
 exito: '201 created' -> '{"id", "emial", "role": "requester", "createdAT"}'.
errores:
-'400 VALIDATION_ERROR' - falta email/password o password fuera de 15-128
-'400 SERVER_CONTROLLED_FIELD' - el body trae 'role', 'id', 'passwordhash', 'createdAT'...
-'409 ACCOUNT_CANNOT_BE_CREATED' - email ya registrado (generico, no confirma ecitencia)

## POST /auth/login

## GET /auth/me

## Semántica de errores

¿Cuándo responde tu API `401`? ¿Cuándo `403`? ¿Cuándo `404` aunque el recurso
exista? ¿Cuándo `409`? Escribe el criterio, no solo ejemplos.
