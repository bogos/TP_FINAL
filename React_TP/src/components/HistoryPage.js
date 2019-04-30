import React, { Component } from "react";

import History from "./History";

class HistoryPage extends Component {
    render() {
        const { web3, results } = this.props;
        return (
            <History web3={web3} results={results} />
        )
    }
}

export default HistoryPage;