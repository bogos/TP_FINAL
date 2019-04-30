import React, { Component } from "react";
import BigNumber from "bignumber.js";
import axios from "axios";
import MyChart from "./MyChart";
import ResumeData from "./ResumeData";

import { DBServices } from "../services";

import Chart from 'react-apexcharts';
import ApexCharts from 'apexcharts';


let sensor_master = [];

class HomePage extends Component {
    constructor(props) {
        super(props);
        this.state = {
            humidity_data: 0,
            temperature_data: 0,

            
            data : [],

           
        }
    }

    componentDidMount = async() => {

        // sensor_master = await this.resolveSensorData();
        // console.log(this.state);

        // // Get Temperature
        // let temperature_data = sensor_master.map(x => { return { x: x.temperatura, y: x.time }});
        // // Get Humidity
        // let humidity_data = sensor_master.map(x =>  {return { x: x.humidity, y: x.time }});

        // this.setState({temperature_data: temperature_data, humidity_data: humidity_data});
        // console.log(this.state);


    }

    componentWillUnmount() {

    }

    updateChart = () =>{
        const max = 90;
        const min = 30;


        const newSeries = [];
        this.state.series.map((s) => {
            const data = s.data.map(() => {
                return Math.floor(Math.random() * (180 - min + 1)) + min
            })
            newSeries.push({ data, name: s.name })
            })
            
        this.setState({
          series: newSeries
        })

        console.log("hola", newSeries);
    }
    
    resolveSensorData = async () => {
     let dbServices = new DBServices(); 
     return await dbServices.resolveListarSensor();
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
                                                <label>Subject</label>
                                                <select id="state_cargo" className="form-control bg-ash border-none">
                                                    {/* <option></option> */}
                                                    {/* <option value="EN CURSO">EN CURSO</option>
                                                    <option value="ENTREGADO">ENTREGADO</option> */}
                                                </select>
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
                        <ResumeData id="temperatura" />
                        <ResumeData id="humedad" />
                    </div>
                        
{/*                         
                        <div className="col-lg-4">
                            <div className="card alert">
                                <div className="card-header">
                                    <h4 className="f-s-14"><b>Cargo</b></h4>
                                </div>                                                               
                                <div className="card-body">
                                    <div className="row" style={{margin_top: "10px",margin_bottom: "10px"}}>
                                            <div className="horizontal-form-elements">
                                                    <form className="form-horizontal">
                                                        <div className="row">
                                                            <div className="col-lg-12">
                                                                <div className="form-group">
                                                                    <label className="col-sm-3 control-label">Owner</label>
                                                                    <div className="col-sm-9">
                                                                        <input type="text" className="form-control" value="Some text value..."/>
                                                                    </div>
                                                                </div>                                                                                                                
                                                            </div>         
                                                        </div>
                                                    </form>
                                                </div>
                                    </div>   
                                    <div className="row" style={{margin_top: "10px",margin_bottom: "10px"}}>
                                        <div className="table-responsive">
                                            <table className="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Name</th>
                                                        <th>Status</th>
                                                        <th>Date</th>
                                                        <th>Price</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">1</th>
                                                        <td>Carag 1</td>
                                                        <td><span className="badge badge-primary">Sale</span></td>
                                                        <td>January 22</td>
                                                        <td className="color-primary">$21.56</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">2</th>
                                                        <td>Carag 2</td>
                                                        <td><span className="badge badge-success">Tax</span></td>
                                                        <td>January 30</td>
                                                        <td className="color-success">$55.32</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">3</th>
                                                        <td>Carag 3</td>
                                                        <td><span className="badge badge-danger">Extended</span></td>
                                                        <td>January 25</td>
                                                        <td className="color-danger">$14.85</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>                          
                                    <div className="row" style={{margin_top: "10px",margin_bottom: "10px"}}>
                                        <div className="horizontal-form-elements">
                                            <form className="form-horizontal">
                                                <div className="row">
                                                    <div className="col-lg-12">
                                                        <div className="form-group">
                                                            <label className="col-sm-2 control-label">Price</label>
                                                            <div className="col-sm-10">
                                                                <input type="text" className="form-control" value="Some text value..."/>
                                                            </div>
                                                        </div>
                                                        <div className="form-group">
                                                            <label className="col-sm-2 control-label">Place</label>
                                                            <div className="col-sm-10">
                                                                <input type="email" className="form-control" placeholder="Email"/>
                                                            </div>
                                                        </div>
                                                        <div className="form-group">
                                                            <label className="col-sm-2 control-label">Value</label>
                                                            <div className="col-sm-10">
                                                                <input className="form-control" type="password" value="password"/>
                                                            </div>
                                                        </div>
                                                        <div className="form-group">
                                                            <label className="col-sm-2 control-label">Note</label>
                                                            <div className="col-sm-10">
                                                                <textarea className="form-control" rows="3" placeholder="Text input"></textarea>
                                                            </div>
                                                        </div>                                                                                                                        
                                                    </div>                                                                                                                                         
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> */}
                </section>
            </>
        )
    }

    handleStart() {
        const { pollComplete } = this.state;
        if (pollComplete) {
            this.setState({ pollComplete: false, winner: -1 });
        }
    }

    async handleComplete() {
        // this.setState({ pollComplete: true });

        // // Check for new poll every 5 seconds.
        // const checkForUpdates = async () => {
        //     let currentPoll;
        //     try {
        //         const response = await axios.get("https://p1-server.herokuapp.com/poll");
        //         currentPoll = response.data;
        //         const oldPoll = this.props.currentPoll;
        //         if (currentPoll.id !== oldPoll.id) {
        //             let result;
        //             try {
        //                 const response = await axios.get(`https://p1-server.herokuapp.com/results?from=${oldPoll.id}&to=${oldPoll.id}`);
        //                 result = response.data[0];

        //                 if (result.amount !== "0") {
        //                     // Check if the user's balance has changed.
        //                     await this.props.updateBalance();

        //                     const winner = result.option;
        //                     this.setState({ winner });
        //                 }
        //             } catch (error) {
        //                 console.error(error);
        //             }

        //             if (result && result.amount !== "0") {
        //                 // Show winner for 5 seconds.
        //                 await new Promise(resolve => setTimeout(resolve, 5 * 1000));
        //             }

        //             console.log(currentPoll);
        //             this.setState({ selected: -1, pollComplete: false });
        //             await this.props.resolvePoll(currentPoll);
        //         } else {
        //             setTimeout(async () => await checkForUpdates(), 5 * 1000);
        //         }
        //     } catch (error) {
        //         console.error(error);
        //     }
        // };
        // checkForUpdates();
    }

    handleClick(selected) {
        if (selected !== this.state.selected) {
            this.setState({ selected });
        }
    }

    handleChange(amount) {
        this.setState({ amount });
    }

    async handleVote() {
        const { web3, currentPoll, resolveVote } = this.props;
        const { selected, amount } = this.state;

        const address = (await web3.eth.getAccounts())[0];
        const value = web3.utils.toWei(new BigNumber(amount).toFixed());

        const vote = {
            pollID: currentPoll.id,
            address,
            option: selected,
            amount: value,
        }
        try {
            await axios.post("https://p1-server.herokuapp.com/vote", JSON.stringify(vote));
            await resolveVote(vote);
        } catch (error) {
            console.error(error);
        }
    }
}

export default HomePage;