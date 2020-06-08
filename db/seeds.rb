# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Speciality.create :name => "Alergologia", :description => "La Alergología es la especialidad médica que comprende el conocimiento, diagnóstico y tratamiento de la patología producida por mecanismos inmunológicos, con las técnicas que le son propias; con especial atención a la alergia."
Speciality.create :name => "Cardiología", :description => "La cardiología es la especialidad médica que se ocupa de las afecciones del corazón y del aparato circulatorio."
Speciality.create :name => "Dermatología", :description => "La dermatología es la especialidad médica encargada del estudio de la piel, su estructura, función y enfermedades."
Speciality.create :name => "Gastroenterología", :description => "La gastroenterología es la rama del Aparato Digestivo que comprende el diagnóstico y tratamiento de pacientes con afecciones del esófago, estómago, intestino delgado, colon, recto y páncreas."
Speciality.create :name => "Genética", :description => "La genética es el campo de las ciencias biológicas que trata de comprender cómo la herencia biológica es transmitida de una generación a la siguiente, y cómo se efectúa el desarrollo de las características que controlan estos procesos."
Speciality.create :name => "Geriatría", :description => "La Geriatría es la especialidad médica que se ocupa de los aspectos preventivos, curativos y de la rehabilitación de las enfermedades del adulto en senectud."
Speciality.create :name => "Ginecología", :description => "Ginecología es la especialidad médica y quirúrgica que trata las enfermedades del sistema reproductor femenino (útero, vagina y ovarios) y de la reproducción."
Speciality.create :name => "Neurología", :description => "La neurología es la especialidad médica que trata los trastornos del sistema nervioso."
Speciality.create :name => "Pediatría", :description => "La pediatría es la especialidad médica que estudia al niño y sus enfermedades."

Service.create :name => "Medicina preventiva", :description =>"La aplicación de vacunas de los laboratorios más reconocidos y con los distribuidores  del ramo que se han destacado por el mantenimiento de la cadena fría para que los biológicos al ser aplicados se encuentren en perfectas condiciones."
Service.create :name => "Cirugía", :description =>"Quirófano equipado con anestesia inhalada y monitores trans quirúrgicos en donde al anestesista se le permite visualizar permanentemente las constantes del paciente como son el electrocardiograma, frecuencia respiratoria, cantidad de oxigeno y bióxido de carbono circulante en el organismo."
Service.create :name => "Imagenología", :description =>"Radiología de alta frecuencia que es un equipo de rayos X gentil con el medio ambiente y con mucho menor riesgo para el personal que labora en el área."
Service.create :name => "Laboratorio de análisis clínico", :description =>"Permite correr pruebas como química sanguínea en húmeda y seca, lo que facilita la obtención de datos a cualquier hora y en cuestión de minutos."

Doctor.create!({:username => "none",:name => "none", :speciality_id => 1, :email => "14030641@itcelaya.edu.mx", :password => "111111", :password_confirmation => "111111" })

ConsultType.create :name => "Ninguno"
ConsultType.create :name => "Mensaje"
ConsultType.create :name => "Video"

Condition.create :name => "Indeterminado"
Condition.create :name => "Sospechoso"
Condition.create :name => "Confirmado"