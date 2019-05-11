import React, { Component } from "react";
import ResumeData from "./ResumeData";

import { DBServices } from "../services";
import SimpleDropdown from "./microComponents/SimpleDropdown";
import ResumeInfo from "./microComponents/ResumeInfo";

import documentImg from "../images/document.svg";
import humidityImg from "../images/humidity.svg";
import temperatureImg from "../images/temperature.svg";


class HomePage extends Component {
    constructor(props) {
        super(props);
        this.state = {
            subject : "",
            data: [],
            process_data: [],
            selected: "",
            newDataSelected: ''
        }

        this.dbServices = new DBServices();

        this.allData = [];
    }

    componentDidMount = async() => {

        this.allData = await this.resolveAllServices();
        let data = await this.dbServices.resolveListarCarga();
        
        console.log(data);
        if(data < 1 || data === undefined) return;
        let process_data = [...data];
        
        process_data = process_data.map(x => {return {value: x.tracking_id, label: x.tracking_id}});

        await this.setState({
            process_data:process_data,
            data: data
        });
        console.log(this.allData);   
    }

    componentWillUnmount() {
        
    }

    resolveAllServices = async () => {
        let ListaTipoProducto = await this.dbServices.resolveListarTipoProducto();
        let ListaProducto = await this.dbServices.resolveListarProducto();
        let ListaCargaProducto = await this.dbServices.resolveListarCargaProductos();
        let ListaSensor = await this.dbServices.resolveListarSensor();
        let ListaCiudad = await this.dbServices.resolveListarCiudad();
        let ListaCarrera = await this.dbServices.resolveListarCarrera();
        let ListaCarga  = await this.dbServices.resolveListarCarga();

        return {
            ListaTipoProducto: ListaTipoProducto,
            ListaProducto: ListaProducto,
            ListaCargaProducto: ListaCargaProducto,
            ListaSensor: ListaSensor,
            ListaCiudad: ListaCiudad,
            ListaCarrera: ListaCarrera,
            ListaCarga: ListaCarga
        }
    }

    setTrackingData = () => {
        let selected = this.state.selected;

        for(let ciudad of this.allData.ListaCiudad) {
            if(selected['city_id'] === ciudad['city_id']){
                selected['city_name'] = ciudad['city_name'];
            }
        }

        for(let ciudad of this.allData.ListaCarrera) {
            if(selected['carrier_id'] === ciudad['carrier_id']){
                selected['carrier_name'] = ciudad['name'];
            }
        }
        
        console.log("selected", selected);

        return selected;
    }

    handleChange = async (e) => {
        e.persist();
        const value = e.target.type === 'checkbox'? e.target.checked:e.target.value;

        await this.setState({
            [e.target.name] :value
        });

        let unitProcessData = this.state.data;
        unitProcessData = unitProcessData.filter( element => element.tracking_id == e.target.value);

        await this.setState({
            selected : unitProcessData[0]
        });

        console.log("State", this.state);

        let selected = this.setTrackingData();

        await this.setState({
            newDataSelected: selected 
        })
    }


    render() {
        return (
            <>
                <div className="row">
                    <div className="col-lg-8 p-r-0 title-margin-right">
                        <div className="page-header">
                            <div className="page-title">
                               
                            </div>
                        </div>
                    </div>
                    
                    <div className="col-lg-4 p-l-0 title-margin-left">
                        <div className="page-header">
                            <div className="page-title">
                                <ol className="breadcrumb text-right">
                                    <li>Dashboard</li>
                                    <li className="active">Home</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <section id="main-content">
                    <div className="row">
                        <div className="col-md-12">
                            <div className="card alert">
                                <div className="card-body">
                                    <div className="card-header m-b-20">
                                        <h4><b>Basic Data</b></h4>                                            
                                    </div>
                                </div>
                                <div className="row">
                                    <div className="col-md-3">
                                        <div className="basic-form">
                                            <div className="form-group">
                                                <SimpleDropdown 
                                                label="Subject" name="subject" 
                                                selectableData = {this.state.process_data} handleInputChange = {this.handleChange} />
                                            </div>
                                        </div>
                                    </div>
                                    <div className="col-md-3">
                                        <div className="basic-form">
                                            <div className="form-group">
                                                <label>Code</label>
                                                <input type="text" className="form-control border-none input-flat bg-ash" placeholder=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="col-md-3">
                                        <div className="basic-form">
                                            <div className="form-group">
                                                <label>Date</label>
                                                <input type="text" className="form-control border-none input-flat bg-ash" placeholder=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="col-md-3">
                                        <div className="basic-form">
                                            <div className="form-group">
                                                <label>Hour</label>
                                                <input type="text" className="form-control border-none input-flat bg-ash" placeholder=""/>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                  
                            </div>
                        </div>
                    </div>                   
                    <div className="row">
                        <div className="resume-content">
                            <div className="resume-charts">
                                <ResumeData id="temperatura" image={temperatureImg} signo="C" color=""/>
                                <ResumeData id="humedad" image={humidityImg} signo="%" color=""/>
                            </div>
                            <div className="resume-info">
                                <img src={documentImg}></img>
                                <div className="resume-info-container">
                                    <ResumeInfo title="Codigo" value={this.state.newDataSelected.tracking_id}/>
                                    <ResumeInfo title="Transportista" value={this.state.newDataSelected.carrier_name}/>
                                    <ResumeInfo title="Producto" value={this.state.newDataSelected.product_name}/>
                                    {/* <ResumeInfo title="TipoProducto" value={this.state.newDataSelected.product_id}/> */}
                                    <ResumeInfo title="Unidades" value={this.state.newDataSelected.product_unit}/>
                                    <ResumeInfo title="Peso" value={this.state.newDataSelected.weight}/>
                                    <ResumeInfo title="Precio" value={this.state.newDataSelected.value}/>
                                    <hr/>
                                    <ResumeInfo title="Observacion" value={this.state.newDataSelected.observations}/>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </>
        )
    }
}

export default HomePage;