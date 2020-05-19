class Insert < ActiveRecord::Migration[5.2]
  def change
    #inserción inmediata
    Speciality.create :name => "Alergologia", :description => "La Alergología es la especialidad médica que comprende el conocimiento, diagnóstico y tratamiento de la patología producida por mecanismos inmunológicos, con las técnicas que le son propias; con especial atención a la alergia."
    Speciality.create :name => "Cardiología", :description => "La cardiología es la especialidad médica que se ocupa de las afecciones del corazón y del aparato circulatorio."
    Speciality.create :name => "Dermatología", :description => "La dermatología es la especialidad médica encargada del estudio de la piel, su estructura, función y enfermedades."
    Speciality.create :name => "Gastroenterología", :description => "La gastroenterología es la rama del Aparato Digestivo que comprende el diagnóstico y tratamiento de pacientes con afecciones del esófago, estómago, intestino delgado, colon, recto y páncreas."
    Speciality.create :name => "Genética", :description => "La genética es el campo de las ciencias biológicas que trata de comprender cómo la herencia biológica es transmitida de una generación a la siguiente, y cómo se efectúa el desarrollo de las características que controlan estos procesos."
    Speciality.create :name => "Geriatría", :description => "La Geriatría es la especialidad médica que se ocupa de los aspectos preventivos, curativos y de la rehabilitación de las enfermedades del adulto en senectud."
    Speciality.create :name => "Ginecología", :description => "Ginecología es la especialidad médica y quirúrgica que trata las enfermedades del sistema reproductor femenino (útero, vagina y ovarios) y de la reproducción."
    Speciality.create :name => "Neurología", :description => "La neurología es la especialidad médica que trata los trastornos del sistema nervioso."
    Speciality.create :name => "Pediatría", :description => "La pediatría es la especialidad médica que estudia al niño y sus enfermedades."

  end
end
