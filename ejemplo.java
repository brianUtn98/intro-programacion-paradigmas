interface MedioPago{
    double precioAPagar(double precioBase);
}

class Efectivo implements MedioPago{
    double precioAPagar(double precioBase){
        return precioBase > 10000? precioBase*0.95 : precioBase;
    }
}

class Tarjeta implements MedioPago{
    private int cuotas;

    public double precioAPagar(double precioBase){
        return this.coefieicenteCuotas() * precioBase;
    }

    public double coefieicenteCuotas(){
        return cuotas <= 6? 1.10 : 1.25;
    }
}

class Producto{
    private String descripcion;
    private double precioBase;
    private MedioPago medioPago;

    public double precioAPagar(){
        return this.medioPago.precioAPagar(this.precioBase);
    }
}

class Main{
    public int main(){
        MedioPago medioPago = new Tarjeta(6);
        Producto televisor = new Producto("Televisor",15000,medioPago);

        
        System.out.println(televisor.precioAPagar());

    }
}