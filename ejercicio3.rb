alumnos = [
	{nombre: "mi_nombre", edad: 22, comuna: "la_comuna", genero: "masc"},
	{nombre: "mi_n2", edad: 1, comuna: "la_a", genero: "fem"},
	{nombre: "oso", edad: 24, comuna: "La_a", genero: "fem"},
	{nombre: "Perro del mar", edad: 25, comuna: "Las Condes", genero: "fem"}
]

opciones = ['Opcion 1: ingresar datos de la persona',
            'Opcion 2: editar datos',
            'Opcion 3: eliminar',
            'Opcion 4: muestras cantidad de personas ingresadas',
            'Opcion 5: muestras todas las comunas',
            'Opcion 6: muestra personas que tengan entre 20 y 25 años',
            'Opcion 7: muestra suma de todas las personas',
            'Opcion 8: muestra la edad promedio de las personas',
            'Opcion 9: muestra las personas por genero',
            'Opcion 10: salir'
           ]

opcion2 = ['Opcion 1: editar el nombre',
           'Opcion 2: editar la edad',
           'Opcion 3: editar la comuna',
           'Opcion 4: editar el genero',
           'Opcion 5: salir sin editar']


seleccion = nil
bienvenida = "\nElija alguna de estas opciones\n\n"


def mensaje(text)
	puts text
end


def agregar(datos)
	temp = {}
	nom = gets.chomp
	temp[:name] = nom
	puts "Ingrese la edad"
	edad = gets.chomp.to_i
	temp[:edad] = edad
	puts "Ingrese la comuna"
	comuna = gets.chomp
	temp[:comuna] = comuna
	puts "Ingrese el genero"
	genero = gets.chomp
	temp[:genero] = genero
	datos << temp
end

def eliminar(datos)
	datos.each do |e|
		puts e[:nombre]
	end
	elim = gets.chomp
	datos.each_index do |i|
		if datos[i][:nombre] == elim
			datos.delete_at(i)
		end
	end
end

def comunas(datos)
	comtodas = []
	datos.each_index do |i|
		comtodas.push(datos[i][:comuna].downcase)
	end
	puts comtodas.uniq
end

def edad(datos,min,max)
	edadtodas = []
	datos.each_index do |i|
		if datos[i][:edad] >=min and datos[i][:edad] <=max
			puts datos[i][:nombre]
		end
	end
end

def sumaedad(datos)
	sumedad = 0
	datos.each_index do |i|
		sumedad += datos[i][:edad]
	end
	puts sumedad
end

def promedioedad(datos)
	sumedad = 0
	datos.each_index do |i|
		sumedad += datos[i][:edad]
	end
	puts sumedad/datos.length
end

def porgen(datos)
	fem =[]
	masc = []
	datos.each_index do |i|
		if datos[i][:genero] == "fem"
			fem.push(datos[i])
		elsif datos[i][:genero] == "masc"
			masc.push(datos[i])
		end
	end
puts "Lista género masculino:\n#{masc}\n"
puts "Lista género femenino:\n#{fem}"

end

def editar(datos,opc)
	datos.each do |e|
		puts e[:nombre]
	end
	al_editar = gets.chomp
	indiv = nil.to_i
	datos.each_index do |i|
		if datos[i][:nombre] == al_editar
			indiv = i
			puts datos[i]	
		end
	end
	puts "\n¿Qué quiere editar?\n"
	puts opc.join("\n")
	editar = gets.chomp.to_i
	case editar
	when 1
		puts "indique el nombre nuevo"
		nombre_nuevo = gets.chomp
		datos[indiv][:nombre] = nombre_nuevo
	when 2
		puts "indique la nueva edad"
		edad_nueva = gets.chomp.to_i
		datos[indiv][:edad] = edad_nueva
	when 3
		puts "indique la nueva comuna"
		comuna_nueva = gets.chomp
		datos[indiv][:comuna] = comuna_nueva
	when 4
		puts "indique el nuevo genero"
		genero_nuevo = gets.chomp
		datos[indiv][:genero] = genero_nuevo
	else
		puts "ok, gracias por todo"
	end


end

while seleccion != 10 do
mensaje(bienvenida)
mensaje(opciones)
seleccion = gets.chomp.to_i

while seleccion < 0 or seleccion > 11 do
puts "Escriba un número entre 1 y 10"
seleccion = gets.chomp.to_i
end


case seleccion
when 1
	puts "\nUsted eligió la opción #{seleccion}: Ingresar alumno.\nIngrese el nombre"
	agregar(alumnos)
when 2
	puts "\nUsted eligió opción #{seleccion}: editar información del alumno.\n¿A cuál alumno quiere modificar?"
	editar(alumnos,opcion2)
when 3
	puts "\nUsted eligió opción #{seleccion}: eliminar registro de alumno.\n¿Qué alumno quiere eliminar?"
	eliminar(alumnos)
when 4
	puts "\nUsted eligió opción #{seleccion}.\nLa cantidad de personas ingresadas es #{alumnos.length}."
when 5
	puts "\nUsted eligió la opción #{seleccion}.\nLas comunas existentes son:"
	comunas(alumnos)
when 6
	puts "\nUsted eligió la opción #{seleccion}\nLas personas con edad entre 20 y 25 años son:"
	edad(alumnos,20,25)

when 7
	puts "\nUsted eligió la opción #{seleccion}.\nLa suma de la edad de las personas es:"
	sumaedad(alumnos)

when 8
	puts "\nUsted eligió la opción #{seleccion}.\nEl promedio de la edad del grupo es:"
	promedioedad(alumnos)

when 9
	puts "\nUsted eligió la opción #{seleccion}.\n"
	porgen(alumnos)

end
end
puts "\nUsted eligió la opción #{seleccion}.\nPrograma Finalizado\n\n"

puts alumnos