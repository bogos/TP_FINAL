import React, { Component } from "react";
import CanvasJSReact from '../canvasjs.react';
import { DBServices } from "../services";

var updateInterval = 2000;

class ResumeData extends Component {
	
	lastValue = 0;
	constructor() {
		super();
		this.interval = {};
		this.dps = []
		this.state = {
			value: 0,
			date: 0
		}
	}
	componentDidMount() {
		this.interval = setInterval(this.updateChart, updateInterval);
	}

	componentWillUnmount() {
		clearInterval(this.interval);
	}

	resolveSensorData = async () => {
		let dbServices = new DBServices(); 
		return await dbServices.resolveListarSensor();
	}
	
	updateChart = async() => {
		let sensor_master = await this.resolveSensorData();

		if(sensor_master < 1 || sensor_master === undefined) return;

		sensor_master = sensor_master.sort((a,b)=> (a.id_message > b.id_message) ? 1 : -1);

		if(sensor_master.length < 1) return;
		let tmpData = [];

		if(this.props.id === "temperatura") {
			tmpData = sensor_master.map(x => { return { value: x.temperatura, time: x.time }});
		} else if (this.props.id === "humedad") { 
			tmpData = sensor_master.map(x => { return { value: x.humidity, time: x.time }});
		}

		var newData = tmpData[tmpData.length - 1];
		this.lastValue = newData.value;
		// if(newData.value === this.lastValue) return;

		this.dps.push({x: new Date(newData.time) ,y: newData.value});

		await this.setState({
			value: newData.value,
			date: newData.time
		});
		if (this.dps.length >  10 ) {
			this.dps.shift();
		}
		
		console.log("THISDPS", this.dps, this.state);
		this.chart.render();
	}
	render() {
		const options = {
			title :{
				text: this.props.id
			},
			axisX:{
				title:"tiempo",
				valueFormatString: "HH:mm:ss",
				labelAngle: -50,
				interval: 10,
			},
			dataPointWidth: 50,
			data: [{
				type: "spline",
				dataPoints : this.dps
			}]
		}
		return (
			<div className="resume-container">
				<div className="chart-container">
					<div className="chart">
						<CanvasJSReact.CanvasJSChart 
							options = {options}
							onRef={ref => this.chart = ref}
							/>
						</div>
				</div>
				<div className="info-container">
					<div className="circle">
						<img src={this.props.image}/>
						<span className="value">
							{ this.state.value }{this.props.signo}
						</span>
						{/* <span className="date">
							{ this.state.date }
						</span> */}
					</div>
					<div style={{fontWeight:"bold", marginTop: "15px"}}>{this.props.maxLimit}<br></br>{this.props.minLimit}</div>
				</div>
			</div>

			
		);
	}
}
export default ResumeData;                              