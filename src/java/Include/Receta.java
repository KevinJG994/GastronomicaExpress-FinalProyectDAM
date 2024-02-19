package Include;

public class Receta {

    private int id;
    private String nombre;
    private String nombre_chef;
    private String ingredientes;
    private String descripcion;
    private float precio;
    private String imagen;

    public Receta() {
    }

    public Receta(int id, String nombre, String nombre_chef, String ingredientes, String descripcion, float precio, String imagen) {
        this.id = id;
        this.nombre = nombre;
        this.nombre_chef = nombre_chef;
        this.ingredientes = ingredientes;
        this.descripcion = descripcion;
        this.precio = precio;
        this.imagen = imagen;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre_chef() {
        return nombre_chef;
    }

    public void setNombre_chef(String nombre_chef) {
        this.nombre_chef = nombre_chef;
    }

    public String getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(String ingredientes) {
        this.ingredientes = ingredientes;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

}
