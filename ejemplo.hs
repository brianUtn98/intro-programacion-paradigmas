data Producto = Producto {
    descripcion :: String,
    precioBase :: Float,
    medioPago :: MedioPago
}

data MedioPago = Efectivo | Tarjeta {
    cuotas: Integer
}

totalAPagar :: Producto -> Float
totalAPagar producto = totalPorMedioDePago.medioPago $ producto (precioBase producto)

totalPorMedioDePago :: MedioPago -> Float -> Float
totalPorMedioDePago Efectivo precio
    | precio > 10000 = precio * 0.9
    | otherwise = precio
totalPorMedioDePago Tarjeta{cuotas} precio
    | cuotas <= 6 = precio * 1.10
    | otherwise = precio * 1.25