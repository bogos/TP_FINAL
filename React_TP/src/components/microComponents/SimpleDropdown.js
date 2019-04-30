import React, { Component } from 'react';

class SelectOption extends Component {
    render() {
        return (
            <option value={this.props.dataItem.value}>{this.props.dataItem.label}</option>
        )
    }
}

class SimpleDropdown extends Component {

    render() {

        let options = [];

        if (this.props.selectableData) {
            const selectableData = this.props.selectableData;
            options = selectableData.map((dataItem) =>{
                    return <SelectOption key={'option_' + dataItem.value} dataItem={dataItem} />
            }
            );
        }

        return (
            <div className="form-group">
                <label>{this.props.label}</label>
                <select onChange={this.props.handleInputChange} name={this.props.name} className="form-control">
                    {options}
                </select>
            </div>
        )
    }
}

export default SimpleDropdown;