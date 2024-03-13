# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(
  email: "administrador@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true
)

User.create!(
  email: "administrador1@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true
)


# Crear productos de ejemplo con imágenes
productos = [
  { nombre: "Parlante activo JBL PRO IRX112BT", precio: 95000, disponibilidad: true, descripcion: "Altavoz para fiestas portátil con un potente sonido de 100 W, espectáculo de luces dinámico incorporado y diseño resistente a salpicaduras.", foto_path: Rails.root.join("app", "assets", "images", "parlante1.jpeg") },
  { nombre: "Parlante Bluetooth Sony SRS-XB33", precio: 129000, disponibilidad: true, descripcion: "Parlante portátil con tecnología Extra Bass y luces LED que crean un ambiente festivo. Resistente al agua y con hasta 24 horas de duración de la batería.", foto_path: Rails.root.join("app", "assets", "images", "parlante2.jpeg") },
  { nombre: "Parlante inalámbrico Bose SoundLink Revolve+", precio: 189000, disponibilidad: true, descripcion: "Parlante de 360 grados con sonido potente y envolvente. Resistente al agua y con hasta 16 horas de reproducción continua.", foto_path: Rails.root.join("app", "assets", "images", "parlante3.jpeg") },
  { nombre: "Parlante y Equipo 4 dimensiones Charge", precio: 150000, disponibilidad: true, descripcion: "Parlante con batería recargable de alta capacidad. Ofrece un sonido potente y una reproducción con alta potencia.", foto_path: Rails.root.join("app", "assets", "images", "parlante4.jpeg") },
  { nombre: "Parlante fiddler bluetooh", precio: 85000, disponibilidad: true, descripcion: "Parlante ultracompacto y resistente con un sonido sorprendentemente potente. Incluye micrófono.", foto_path: Rails.root.join("app", "assets", "images", "parlante5.jpeg") },
  { nombre: "Equipo Ultimate Ears WONDERBOOM 2", precio: 60000, disponibilidad: true, descripcion: "Parlantes con sonido claro y potente. Resistentes e ideales para conectar en casa.", foto_path: Rails.root.join("app", "assets", "images", "parlante6.jpeg") },
  { nombre: "Guitarra Eléctrica Fender Stratocaster", precio: 950000, disponibilidad: true, descripcion: "Guitarra eléctrica icónica con cuerpo de aliso, tres pastillas y tremolo. Incluye estuche rígido. Muy buena potencia y cómoda al momento de usar.", foto_path: Rails.root.join("app", "assets", "images", "parlante7.jpeg") },
  { nombre: "Batería Acústica Yamaha Stage Custom", precio: 2800000, disponibilidad: true, descripcion: "Batería acústica de alta calidad con cascos de abedul y herrajes cromados. Incluye bombo, toms, caja, platos y soportes.", foto_path: Rails.root.join("app", "assets", "images", "parlante8.jpeg") },
  { nombre: "Teclado Digital Roland RD-2000", precio: 4500000, disponibilidad: true, descripcion: "Teclado digital profesional con teclas contrapesadas, sonidos de piano auténticos y amplias capacidades de control.", foto_path: Rails.root.join("app", "assets", "images", "parlante9.jpeg") },
  { nombre: "Bajo Eléctrico Fender Jazz Bass", precio: 1150000, disponibilidad: true, descripcion: "Bajo eléctrico versátil con cuerpo de aliso, dos pastillas y sonido característico. Incluye funda acolchada y placa protectora. Excelente potencia con gran sonido", foto_path: Rails.root.join("app", "assets", "images", "parlante10.jpeg") },
  { nombre: "Saxofón Alto Yamaha YAS-62", precio: 3300000, disponibilidad: true, descripcion: "Saxofón alto profesional con cuerpo de latón, llaves de nácar y sonido equilibrado. Incluye estuche rígido.", foto_path: Rails.root.join("app", "assets", "images", "parlante11.jpeg") },
  { nombre: "Acordeón Hohner Corona II", precio: 1950000, disponibilidad: true, descripcion: "Acordeón de dos hileras y botones para música tradicional. Fabricado en Alemania con excelente calidad de sonido.", foto_path: Rails.root.join("app", "assets", "images", "parlante12.jpeg") }
]


# Crear los productos en la base de datos
productos.each do |producto_params|
  producto = Producto.new(producto_params.except(:foto_path))
  
  # Leer el archivo de imagen y adjuntarlo al producto
  imagen_file = File.open(producto_params[:foto_path], "rb")
  producto.foto.attach(io: imagen_file, filename: "producto.#{producto.id}.jpeg", content_type: "image/jpeg")
  
  producto.save
end


