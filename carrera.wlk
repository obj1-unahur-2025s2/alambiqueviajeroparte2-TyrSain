object inscripcion {
    var vehiculosInscriptos = []
    var rechazados = []
    var ciudad = null

    method vehiculosInscriptos() {
        return vehiculosInscriptos
    }

    method rechazados() {
        return rechazados
    }

    method ciudad() {
        return ciudad
    }

    method puedeCompetir(vehiculo) {
        if (ciudad.puedeLlegar(vehiculo)) {
            vehiculosInscriptos.add(vehiculo)
        }
        else {
            rechazados.add(vehiculo)
        }
    }

    method cambiarCiudadA_(ciudadNueva) {
        ciudad = ciudadNueva
    }

    method rehacerChequeo() {
        const vehiculosQuePueden = rechazados.filter({vehiculo => ciudad.puedeLlegar(vehiculo)})
        const vehiculosQueNoPueden = vehiculosInscriptos.filter({vehiculo => not ciudad.puedeLlegar(vehiculo)})
        vehiculosInscriptos.removeAll(vehiculosQueNoPueden)
        vehiculosInscriptos.addAll(vehiculosQuePueden)
        rechazados.removeAll(vehiculosQuePueden)
        rechazados.addAll(vehiculosQueNoPueden)
    }
}

object carrera {
    method avisarAVehiculos() {
        inscripcion.vehiculosInscriptos().forEach({vehiculo => vehiculo.desgaste()})
    }

    method ganador() {
        return inscripcion.vehiculosInscriptos().filter({vehiculo => vehiculo.rapido()})
    }
}