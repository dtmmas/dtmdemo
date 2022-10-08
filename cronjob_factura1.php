<?php
date_default_timezone_set('America/Guatemala');
class BD
{
	public $host;
	private $database;
	private $user;
	private $password;
	private $conexion;

	function __construct()
	{
        $datos = file('.env', FILE_IGNORE_NEW_LINES);
        date_default_timezone_set('America/Guatemala');
		$this->host 	= 'localhost';
		$this->database = explode('=',$datos[14])[1];
		$this->user 	= explode('=',$datos[15])[1];
		$this->password = explode('=',$datos[16])[1];
		$this->conexion = null;
	}

	public function conectar(){
		
		$this->conexion = new mysqli($this->host, $this->user, $this->password, $this->database);
		
		/* verificar conexión */
		if (mysqli_connect_errno()) {
		    printf("Connect failed: %s\n", mysqli_connect_error());
		    exit();
		}

		$this->conexion->set_charset("utf8");

		return $this->conexion;
	}

	public function cerrar(){
		$this->conexion->close();
	}
}

class Funciones{

    public function GenerarFacturas()
    {   
        $this->insertLog('GenerarFacturas', 'Inicio proceso para generar facturas');
        $my_date = new DateTime();
        $my_date->modify('last day of this month');
        $date_expiration = $my_date->format('Y-m-d 23:59:59');

        $BD = new BD();
        $conexiondb = $BD->conectar();
        $sql = "SELECT client_product.id, (SELECT price FROM products WHERE id= product_id) as precio FROM client_product LEFT OUTER JOIN invoices ON (client_product.id = invoices.client_product_id AND client_product.status = '1' AND invoices.date_expiration='$date_expiration') WHERE invoices.client_product_id IS NULL";
        $sentencia = $conexiondb->prepare($sql);
    
        $sentencia->execute();
        $sentencia->bind_result($client_product_id, $precio);
    
        $sentencia->store_result();
        if($sentencia->num_rows>0){
            $total = 0;
            while ($sentencia->fetch()) {
                $this->insertInvoice($client_product_id, $precio, $date_expiration);
                $total++;
            }
        }
        $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
        $this->insertLog('GenerarFacturas', 'Se generaron las facturas para el mes de '.$meses[date('n')-1].' - Total:'.$total);
        $BD->cerrar();
    }

    public function marcarFacturasComoVencidas()
    {   
        $this->insertLog('marcarFacturasComoVencidas', 'Inicio proceso de vencimiento de facturas');
        $BD = new BD();
        $conexiondb = $BD->conectar();
        $sentencia = $conexiondb->prepare("UPDATE `invoices` SET `status` = '-1', updated_at=? WHERE `date_expiration` <= ? AND status='0' ");
        $sentencia->bind_param('ss', $fecha_actual, $fecha_actual);
        $fecha_actual = date('Y-m-d H:i:s');
        if ($sentencia->execute()) {
            $result = true;		
        }else{
            $result = false;
        }
        $conexiondb->close();
        $this->insertLog('marcarFacturasComoVencidas', 'Se marcaron como vencidas las facturas no pagadas');
        return $result;
    }

    protected function insertInvoice($client_product_id, $price, $date_expiration)
    {
        $BD = new BD();
        $conexiondb = $BD->conectar();
        $sql = "INSERT INTO `invoices` ( `client_product_id`,  `price`, `date_expiration`, `created_at`, `updated_at`) VALUES 
        ( ?,  ?, ?, ?, ?)";
        $sentencia = $conexiondb->prepare($sql);
        $sentencia->bind_param('idsss', $client_product_id, $price, $date_expiration, $fecha, $fecha);
        $fecha = date('Y-m-d H:i:s');
        if($sentencia->execute()){
            $result = true;
        }else{
            $result = false;
        }

        $conexiondb->close();

        return $result;
    }

    protected function insertLog($tipo, $detalle)
    {
        $BD = new BD();
        $conexiondb = $BD->conectar();
        $sql = "INSERT INTO `logs` ( `tipo`,  `detalle`, `created_at`, `updated_at`) VALUES 
        (?,?,?,?)";
        $sentencia = $conexiondb->prepare($sql);
        $sentencia->bind_param('ssss', $tipo, $detalle, $fecha, $fecha);
        $fecha = date('Y-m-d H:i:s');
        if($sentencia->execute()){
            $result = true;
        }else{
            $result = false;
        }
        $conexiondb->close();
        return $result;
    }
}


$cron = new Funciones();

$cron->marcarFacturasComoVencidas();
$cron->GenerarFacturas();

?>