compra(producto(televisor,15000),medioPago(efectivo)).
compra(producto(televisor,15000),medioPago(tarjeta,6)).
compra(producto(heladera,25000),medioPago(tarjeta,24)).

totalAPagar((producto(Nombre,PrecioBase),MedioPago),Total):-precioPorMedioDePago(MedioPago,PrecioBase,Total).

precioPorMedioDePago(medioPago(efectivo),PrecioBase,Total):- PrecioBase > 10000, Total is PrecioBase * 0.95.
precioPorMedioDePago(medioPago(tarjeta,Cuotas),Total):- Cuotas <=6, Total is PrecioBase * 1.10.
precioPorMedioDePago(medioPago(tarjeta,Cuotas),Total):- Cuotas > 6, Total is PrecioBase * 1.25.