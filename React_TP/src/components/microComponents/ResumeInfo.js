import React from 'react'

const ResumeInfo = (props) => (
    <div className="list-container">
        <div className="list-title">
            {props.title}
        </div>
        <div className="list-value">
            {props.value}
        </div>
    </div>
)
export default ResumeInfo;