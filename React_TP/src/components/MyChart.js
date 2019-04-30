import React, { Component } from "react";
import Chart from 'react-apexcharts';
import ApexCharts from 'apexcharts';
import { DBServices } from "../services";
import ReactApexChart from "react-apexcharts";

// var lastDate = 0;
// var data = []

class MyChart extends Component {

    // state = {
    //   data: [],
    //   options: {
    //     chart: {
    //       id: this.props.id
    //     },
    //     xaxis: {
    //       // categories: [1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998]
    //       type:'datetime',
    //     },
    //     yaxis: {
    //       max: 100
    //     }
    //   },
    //   series: [
    //     {
    //       data: data.slice()
    //     }
    //   ],
    // }
    
      interval_1 = {}
      interval_2 = {}
      data = []
      lastDate = "";  
      state = {
        options: {
          chart: {
            id: this.props.id,
            animations: {
              enabled: true,
                  easing: 'linear',
                  dynamicAnimation: {
                    speed: 1000
                  }
                },
                toolbar: {
                  show: true
                },
                zoom: {
                  enabled: false
                }
              },
              dataLabels: {
                enabled: false
              },
              stroke: {
              curve: 'smooth'
            },
      
            title: {
                text: this.props.title,
                align: 'left'
              },
              markers: {
              size: 0
              },
              xaxis: {
                type: 'datetime',
                range: 100,
              },
              yaxis: {
                max: 100
              },
              legend: {
                show: false
              }
          },
          series: [{
            data: this.data
        }],
      }


    resolveSensorData = async () => {
      let dbServices = new DBServices(); 
      return await dbServices.resolveListarSensor();
    }
  
    componentDidMount = async () => {
      // this.dinamicCall();
      // this.interval = setInterval(()=>{
      //   this.dinamicCall();
      // }, 5000);

      this.intervals();
    }

    componentWillMount () {
      console.log("WillMount",this.props.data);
    }

    componentWillReceiveProps () {
      console.log("ReceiveProps",this.props.data);

    }

    // When Component Finish
    componentWillUnmount(){
      clearInterval(this.interval_1);
      clearInterval(this.interval_2);
    }

    intervals () {
      this.interval_1 = window.setInterval(() => {
        this.getNewSeries();
        
        ApexCharts.exec(this.props.id, 'updateSeries', [{
          data: this.data
        }])
      }, 2000)
  
      // every 60 seconds, we reset the data 
      this.interval_2 = window.setInterval(() => {
        this.resetData()
  
        ApexCharts.exec(this.props.id, 'updateSeries', [{
          data: this.data
        }], false, true)
      }, 60000)
    }

    resetData = () => {
      this.data = this.data.slice(this.data.length - 10, this.data.length);
    }

    getNewSeries = async () =>{
      let sensor_master = await this.resolveSensorData();

      if(sensor_master.length < 1) return;
      let tmpData = [];
      let value = [];
      if(this.props.id === "temperatura") {
        tmpData = sensor_master.map(x => { return { value: x.temperatura, time: x.time }});
      } else if (this.props.id === "humedad") { 
        tmpData = sensor_master.map(x => { return { value: x.humidity, time: x.time }});
      }

      var newDate = tmpData[tmpData.length - 1];
      value = tmpData[tmpData.length - 1]
      this.lastDate = newDate.time;

      this.data.push({
        x: newDate.time,
        y: value.value
      })
      console.log("data", value, this.lastDate);
    }
  
    render () {
      // var chart = new ApexCharts(document.querySelector("#chart_humidity"), this.state.options);
      // chart.render();
        return (
          <div id={this.props.id}>
            <ReactApexChart 
              options={this.state.options} 
              series={this.state.series} 
              type="line" height={this.props.height}
            />
          </div>
        );
    }

}

export default MyChart;