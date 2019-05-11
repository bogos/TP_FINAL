import axios from 'axios';

export class DBServices {
        
    API_URL = "https://tpapi20190510124026.azurewebsites.net/api/TP";
    // API_URL = "http://localhost:58476/api/TP";
    METHODS = {
        LISTAR_TIPO_PRODUCTO: "/ListarTipoProducto",
        LISTAR_PRODUCTO: "/ListarProducto",
        LISTAR_CARGA_PRODUCTO: "/ListarCargaProductos",
        LISTAR_SENSOR: "/ListarSensor",
        LISTAR_CIUDAD: "/ListarCiudad",
        LISTAR_CARRERA: "/ListarCarrera",
        LISTAR_BC: "/ListarBC",
        LISTAR_CARGA: "/ListarCarga",
        REGISTRAR_CARGA: "/RegistrarCarga"
    }   

    resolveListarTipoProducto = async () => {
        try {
            let url = this.API_URL + this.METHODS.LISTAR_TIPO_PRODUCTO;
            const response = await axios.get(url);
            console.log("ListarTipoProducto", response.data.data);
            return response.data.data;
            
        } catch (error) {
            console.error(error);
        }
    }
    
    resolveListarProducto = async () => {
        try {
            let url = this.API_URL + this.METHODS.LISTAR_PRODUCTO;
            const response = await axios.get(url);
            console.log("ListarProducto", response.data.data);
            return response.data.data;
        } catch (error) {
            console.error(error);
        }
    }
    
    resolveListarCargaProductos = async () => {
        try {
            const url = this.API_URL + this.METHODS.LISTAR_CARGA_PRODUCTO; 
            const response = await axios.get(url);
            console.log("ListarCargaProductos", response.data.data);
            return response.data.data;
        } catch (error) {
            console.error(error);
        }
    }
    
    resolveListarSensor = async () => {
        try {
        const url = this.API_URL + this.METHODS.LISTAR_SENSOR; 
        const response = await axios.get(url);
        return response.data.data;
        } catch (error) {
            console.error(error);
        }
    }

    resolveListarCiudad = async () => {
        try {
            let url = this.API_URL + this.METHODS.LISTAR_CIUDAD;
            const response = await axios.get(url);
            console.log("ListarCiudad", response.data.data);
            return response.data.data;
        } catch (error) {
            console.error(error);
        }
    }

    resolveListarCarrera = async () => {
        try {
            let url = this.API_URL + this.METHODS.LISTAR_CARRERA;
            const response = await axios.get(url);
            console.log("ListarCarrera", response.data.data);
            return response.data.data;
        } catch (error) {
            console.error(error);
        }
    }

    resolveListarCarga= async () => {
        try {
            let url = this.API_URL + this.METHODS.LISTAR_CARGA;
            const response = await axios.get(url);
            console.log("ListarCarga", response.data.data);
            return response.data.data;
        } catch (error) {
            console.error(error);
        }
    }

    postRegistroCarga = async (data) => {
        try{
            let url = this.API_URL + this.METHODS.REGISTRAR_CARGA;
            const response = await axios.post(url, data);
            console.log("RegistroCarga", data, response);
            return response;
        } catch (error){
            console.log(error);
        }
    }
}
