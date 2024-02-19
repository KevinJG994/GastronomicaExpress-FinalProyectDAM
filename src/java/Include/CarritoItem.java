package Include;

public class CarritoItem {
    private int id; // ID del ítem en el carrito
    private String tipo; // Tipo de ítem, puede ser 'producto' o 'receta'
    private int itemId; // ID del producto o receta
    private int usuarioId; // ID del usuario al que pertenece el carrito
    private String nombre; // Nombre del producto o receta
    private int cantidad; // Cantidad del ítem
    private double precio; // Precio unitario del ítem

    // Constructor vacío
    public CarritoItem() {
    }

    // Constructor con todos los campos
    public CarritoItem(int id, String tipo, int itemId, int usuarioId, String nombre, int cantidad, double precio) {
        this.id = id;
        this.tipo = tipo;
        this.itemId = itemId;
        this.usuarioId = usuarioId;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
}
