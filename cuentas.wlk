import cosas.*
import casa.*

object cuentaCorriente {
    var saldoEnCuenta = 0

    method depositar(monto) {
        saldoEnCuenta += monto 
    }

    method validarExtraccion(monto) {
      if (monto > saldoEnCuenta) {
        self.error("El saldo" + saldoEnCuenta + "es insuficiente para el monto" + monto)
      }
    }

    method extraer(monto) {
        self.validarExtraccion(monto)
        saldoEnCuenta -= monto
    }

    method saldoEnCuenta(_saldoEnCuenta){
        saldoEnCuenta = _saldoEnCuenta
    }

    method saldo(){
        return saldoEnCuenta
    }
}

object cuentaConGastos {
    var saldoEnCuenta  = 0
    var property  costoOperacion = 20

    method depositar(monto) {
        saldoEnCuenta += (monto - costoOperacion).max(0)
    }

    method extraer(monto) {
        saldoEnCuenta -= monto
    }

    method saldo(){
        return saldoEnCuenta
    }

    method saldoEnCuenta(_saldoEnCuenta){
        saldoEnCuenta = _saldoEnCuenta
    }

}

object cuentaCombinada {
    var cuentaPrimaria = null
    var cuentaSecundaria = null


    method saldo() {
        return cuentaPrimaria.saldo() + cuentaSecundaria.saldo()
    }

    method depositar(monto) {
        cuentaPrimaria.depositar(monto)
    }

    method extraer(monto) {
        // const cuenta = if (cuentaPrimaria.saldo() >= monto)  cuentaPrimaria  else cuentaSecundaria.extraer(monto) 
        //cuenta.extraer(monto)
        
        if (cuentaPrimaria.saldo() >= monto) {
            cuentaPrimaria.extraer(monto)
        } else {
            cuentaSecundaria.extraer(monto)
        }
    }

    method asignarCuentaPrimaria(cuenta){
        cuentaPrimaria = cuenta
    }

    method asignarCuentaSecundaria(cuenta){
        cuentaSecundaria = cuenta
    }
}

