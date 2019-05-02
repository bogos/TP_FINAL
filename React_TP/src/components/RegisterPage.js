import React, { Component } from "react";
import Input from './microComponents/Input';
import SimpleDropdown from './microComponents/SimpleDropdown';
import 'react-dropdown/style.css';
import {DBServices} from '../services';
import DatePicker from 'react-datepicker';
import "react-datepicker/dist/react-datepicker.css";


class Register extends Component {
    constructor(props) {
        super(props);
        this.DBServices = new DBServices();
        this.state = {
            tracking_id:"", //
            expedition_date:"",// 
            city_id: null,//
            destinity_address:"",
            address:"",
            ptracking_id: null, //
            weight:null, //
            delivery_term:null,
            state:"", 
            value: null, //
            observations:"", // 
            start_time:"", 
            end_time:"", 
            location_id:null, 
            user_id:null, 
            id_contrato:"", 
            carrier_id: 0,
            product_id: "",
            product_name: "",
            product_unit: 0,

            ListaTipoProducto : [],
            ListaProducto : [],
            ListaCargaProducto : [],
            ListaSensor : [],
            ListaCiudad : [],
            ListaCarrera : [],
            FilterListaProducto:[],

            Successfull: "",
        }
    }
    
    componentDidMount = async () => {   
        const allServices = await this.organizeAllSevicesData();

        this.setState({
            ListaTipoProducto: allServices.ListaTipoProducto,
            ListaProducto: allServices.ListaProducto,
            ListaCargaProducto: allServices.ListaCargaProducto,
            ListaSensor: allServices.ListaSensor,
            ListaCiudad: allServices.ListaCiudad,
            ListaCarrera: allServices.ListaCarrera
        });
    }

    resolveAllServices = async () => {
        let ListaTipoProducto = await this.DBServices.resolveListarTipoProducto();
        let ListaProducto = await this.DBServices.resolveListarProducto();
        let ListaCargaProducto = await this.DBServices.resolveListarCargaProductos();
        let ListaSensor = await this.DBServices.resolveListarSensor();
        let ListaCiudad = await this.DBServices.resolveListarCiudad();
        let ListaCarrera = await this.DBServices.resolveListarCarrera();

        return {
            ListaTipoProducto: ListaTipoProducto,
            ListaProducto: ListaProducto,
            ListaCargaProducto: ListaCargaProducto,
            ListaSensor: ListaSensor,
            ListaCiudad: ListaCiudad,
            ListaCarrera: ListaCarrera
        }
    }

    organizeAllSevicesData = async() => {
        let allServices = await this.resolveAllServices();
        
        allServices.ListaTipoProducto = allServices.ListaTipoProducto.map(x => {return { value: x.typproduct_id , label: x.typ_name}});
        // allServices.ListaProducto = allServices.ListaProducto.map(x=> {return{value: x.product_id, label: x.product_name, product_type: x.typproduct_id}})
        
        // Generate false
        allServices.ListaProducto = allServices.ListaProducto.map( (x, index, array) => {
            if(index < 5){
                return{value: x.product_id, label: x.product_name, product_type: 1}    
            } else if(index > 4 && index < 10) {
                return{value: x.product_id, label: x.product_name, product_type: 2}
            } else {
                return{value: x.product_id, label: x.product_name, product_type: 3}
            }
        })
        // allServices.CargaProducto = 
        // allServices.ListaSensor = allServices.ListaSensor.map(x => {return { value: x. , label: }})
        allServices.ListaCiudad = allServices.ListaCiudad.map(x => {return {value: x.city_id, label: x.city_name}});
        allServices.ListaCarrera = allServices.ListaCarrera.map(x => { return {value: x.carrier_id, label: x.name }});
        
        return allServices;
    }
    
    handleProductType = async (e) => {
      const target = e.target;
      const value = target.type === 'checkbox'? target.checked:target.value;
      const name = target.name;

      await this.setState({
        [name]:value 
     });
      const newListaProducto = this.filterDropdownValues(value, this.state.ListaProducto);

      await this.setState({
        FilterListaProducto: newListaProducto 
     });
     console.log(this.state);
    }

    filterDropdownValues(value, lista){
        return lista.filter(x => x.product_type == value);
    }

    handleChange = async (e) => {
        e.persist();
        const value = e.target.type === 'checkbox'? e.target.checked:e.target.value;

        if(e.target.name === "product_id"){
            // console.log( e.target.value);
            // console.log(this.state.ListaProducto[0], this.state.ListaProducto[e.target.value].label);
            const name = this.state.ListaProducto[e.target.value - 1].label;
            await this.setState({product_name: name});
        }

        await this.setState({
            [e.target.name] :value
        });
        console.log(this.state);
    }

    // Date Pickers
    handleStartTimeChange = async (date) => {
        await this.setState({start_time: date});
        console.log(this.state);
    }
    
    handleEndTimeChange = async (date) => {
        await this.setState({end_time: date});
        console.log(this.state);
    }

    handleExpeditionTimeChange = async (date) => {
        await this.setState({expedition_date: date});
        console.log(this.state);
    }

    submitRegister = async () => {
        let dump_state = {...this.state};
        delete dump_state.ListaTipoProducto;
        delete dump_state.ListaProducto;
        delete dump_state.ListaCargaProducto;
        delete dump_state.ListaSensor;
        delete dump_state.ListaCiudad;
        delete dump_state.FilterListaProducto;
        delete dump_state.ListaCarrera;
        delete dump_state.Successfull;

        dump_state = {
            tracking_id:        String(dump_state.tracking_id), // Not Null
            expedition_date:    this.transformDate(dump_state.expedition_date), 
            city_id:            Number(dump_state.city_id),
            address:            String(dump_state.address), // Not null
            destinity_address:  String(dump_state.destinity_address), // Not null
            // ptracking_id:       Number(dump_state.ptracking_id)||null,
            ptracking_id:       null,
            weight:             Number(dump_state.weight),
            delivery_term:      Number(dump_state.delivery_term)||null,  
            state:              String(dump_state.state), // Not null
            value:              parseFloat(dump_state.value).toFixed(2),
            observations:       String(dump_state.observations), // Not null
            start_time:         this.transformDate(dump_state.start_time),
            end_time:           this.transformDate(dump_state.end_time),
            location_id:        Number(dump_state.location_id) || null, 
            user_id:            Number(dump_state.user_id)||null,
            id_contrato:        String(dump_state.id_contrato), // Not null
            carrier_id:         Number(dump_state.carrier_id),
            // sensor_id:          String(dump_state.sensor_id) // Not null
            id_sensor:          String(dump_state.sensor_id),
            product_id:         null,
            product_name:       String(dump_state.product_name),
            product_unit:       Number(dump_state.product_unit)
        }

        console.log("Dump_state", dump_state);
        let response = await this.DBServices.postRegistroCarga(dump_state);
        console.log("DONE!", response);

        let msg = "";
        if(response.data.result){
            msg = "Se ha ejecutado el registro exitosamente";
        } else { 
            msg = "Ha ocurrido un error";
        }
        await this.setState({Successfull: msg});
    }

    transformDate(date) {
        return new Intl.DateTimeFormat('ja-JP').format(date); // yyyy/mm/dd
    }
    
    render() {
        return (
            <>
            <div className="row">
                <div className="col-lg-12" style={{margin_rigth:"7.5px"}}>
                    <div className="page-header">
                        <div className="page-title">
                            <h1>Registro de Carga</h1>
                        </div>
                    </div>
                </div>
            </div>
            <section id="main-content">
                <div className="row">
                    <div className="col-lg-12">
                            <div className="card alert">
                                <div className="card-header">
                                    <h4>Ingresar datos</h4>
                                </div>
                            <div className="card-body">
                                <div className="card-container">
                                    <div className="left-form">
                                        <Input label="Codigo Seguimiento" name="tracking_id" handleChange={this.handleChange}/>
                                        <div className ="form-group">
                                            <label>Plazo de entrega</label>
                                            <DatePicker
                                                name = "expedition_date"
                                                dateFormat="yyyy/MM/dd"
                                                selected={this.state.expedition_date}
                                                onChange={this.handleExpeditionTimeChange}
                                                className="form-control"
                                                placeholderText = "Seleccione Fecha"
                                            />
                                        </div>
                                        <SimpleDropdown 
                                            label="Lugar de origen" name="city_id" 
                                            selectableData = {this.state.ListaCiudad} handleInputChange = {this.handleChange} />
                                        <div className ="form-group">
                                            <label>Hora de Inicio</label>
                                            <DatePicker
                                                name = "start_time"
                                                dateFormat="yyyy/MM/dd"
                                                selected={this.state.start_time}
                                                onChange={this.handleStartTimeChange}
                                                className="form-control"
                                                placeholderText = "Seleccione Fecha"
                                                />
                                            </div>
                                        <div className ="form-group">
                                            <label>Plazo de entrega</label>
                                            <DatePicker
                                                name = "end_time"
                                                dateFormat="yyyy/MM/dd"
                                                selected={this.state.end_time}
                                                onChange={this.handleEndTimeChange}
                                                className="form-control"
                                                placeholderText = "Seleccione Fecha"
                                            />
                                        </div>
                                        <SimpleDropdown 
                                            label="Transportista" name="carrier_id" 
                                            selectableData = {this.state.ListaCarrera} handleInputChange = {this.handleChange} />
                                    </div>

                                    <div className="right-form">
                                        <SimpleDropdown 
                                            label="Tipo de Producto" name="product_type_id" 
                                            selectableData = {this.state.ListaTipoProducto} handleInputChange = {this.handleProductType} />
                                        <div className="product-container">
                                            <SimpleDropdown 
                                                label="Producto" name="product_id" 
                                                selectableData = {this.state.FilterListaProducto < 1 ? [{value:0, label:"Seleccione un Tipo Producto"}] : this.state.FilterListaProducto } 
                                                handleInputChange = {this.handleChange} />

                                            <Input label="Unidades" name="product_unit" handleChange={this.handleChange} style={{text_align: "center"}}/>
                                        </div>
                                        <div className="table-responsive">
                                            <table className="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Producto</th>
                                                        <th>Unidades</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">{this.state.product_id}</th>
                                                        <td>{this.state.product_name}</td>
                                                        <td>{this.state.product_unit}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <Input label="Peso de la carga" name="weight" handleChange={this.handleChange}/>
                                        <Input label="Valor de la carga" name="value" handleChange={this.handleChange}/>
                                        <Input label="Observaciones" name="observations" handleChange={this.handleChange}/>
                                    </div>
                                </div>
                                <button className="register-btn" onClick={this.submitRegister}>Registrar</button>
                                <span className="successfull">{this.state.Successfull}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="row">
                    <div className="col-lg-12">
                    <div className="footer">
                        <p>
                        This dashboard was generated on
                        <span id="date-time">Wed Apr 24 2019 20:49:42 GMT-0500 (hora estándar de Perú)</span>
                    </p>
                    </div>
                </div>
              </div>
            </section>
          </>
        )
    }
}

export default Register;