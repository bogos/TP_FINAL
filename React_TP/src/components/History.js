import React, { Component } from "react";
import BigNumber from "bignumber.js";

class History extends Component {
    constructor(props) {
        super(props);
        this.state = {
            address: "",
        };
    }

    async componentWillReceiveProps() {
        const { web3 } = this.props;
        if (web3 && !this.state.address) {
            const address = (await web3.eth.getAccounts())[0];
            this.setState({ address });
        }
    }

    render() {
        const { web3, results } = this.props;
        const { address } = this.state;
        return (
            results && results.length > 0 &&
            <div className="history">
                <h2 className="history--title">History</h2>
                <table className="history--table">
                    <thead>
                        <tr>
                            <th>Round</th>
                            <th>Winners</th>
                            <th>Your payout</th>
                            <th>Result</th>
                        </tr>
                    </thead>
                    <tbody>
                        {results.map((result, i) => {
                            if (!result.winners) {
                                result.winners = [];
                            }
                            const correct = result.winners && result.winners.indexOf(address) > -1;
                            let payout = 0;
                            if (result.winners.length > 0 && correct) {
                                let individualAmount = new BigNumber(result.amount).div(new BigNumber(result.winners.length));
                                individualAmount = individualAmount.times(new BigNumber(99)).div(new BigNumber(100));
                                payout = web3.utils.fromWei(individualAmount.toFixed(0));
                            }
                            const image = result.option !== 0 ? require(`../images/${result.option}.jpg`) : "";
                            return (
                                <tr key={i} className={correct ? "correct" : ""}>
                                    <td>#{result.id}</td>
                                    <td className="highlight">{result.winners.length}</td>
                                    <td>{payout} ETH</td>
                                    <td className="result">
                                        {result.option !== 0 ?
                                            <>
                                                <span>View result</span>
                                                <img src={image} alt={result.option} />
                                            </>
                                            :
                                            <>No result</>
                                        }
                                    </td>
                                </tr>
                            );
                        })}
                    </tbody>
                </table>
            </div>
        )
    }
}

export default History;