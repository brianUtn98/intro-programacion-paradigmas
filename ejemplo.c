typedef struct{
    char nombre[20];
    int cuotas;
} MedioPago;

typedef struct{
    char descripcion[20];
    int precioBase;
    MedioPago* medioDePago;
} Producto;

double calcularTotalAPagar(Producto* producto){
    MedioPago* medioPago = producto->medioDePago;

    if(strcmp(medioPago->nombre,"Efectivo") == 0){
        return producto->precioBase > 10000 ? producto->precioBase * 0.95 : producto->precioBase;
    } else{
        return producto->medioDePago->cuotas <= 6? producto->precioBase * 1.10 : producto->precioBase * 1.25;
    }
}

int main(char *argv[],int argc){
    MedioPago* medioPago = malloc(sizeof(MedioPago));
    Producto* producto = malloc(sizeof(Producto));

    strcpy(medioPago->nombre,"Tarjeta");

    medioPago->cuotas = 12;

    strcpy(producto->descripcion,"Televisor 24 Pulgadas");

    producto->medioDePago = medioPago;
    producto->precioBase = 20000;

    printf("El precio a pagar por %s es %f",producto->descripcion,calcularTotalAPagar(producto));

    return 0;
}