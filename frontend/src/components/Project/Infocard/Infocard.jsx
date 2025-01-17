import React from 'react'
import './Infocard.css'
import { FiClipboard } from 'react-icons/fi'
import { FiBell } from 'react-icons/fi'
import { FiAlertCircle } from 'react-icons/fi'
import { FiCheckCircle } from 'react-icons/fi'
import { TbSubtask } from 'react-icons/tb'

const Infocard = ({ icon, number, text, className }) => {
  return (
    <div className={`infocard ${className}`}>
      {icon === `<TbSubtask />` && <TbSubtask size={40} fontWeight={300} />}
      {icon === `<FiBell />` && <FiBell size={40} fontWeight={300} />}
      {icon === `<FiAlertCircle />` && (
        <FiAlertCircle size={40} fontWeight={300} />
      )}
      {icon === `<FiCheckCircle />` && (
        <FiCheckCircle size={40} fontWeight={300} />
      )}
      <div className="info">
        <div className="info-number">{number}</div>
        <div className="info-text">{text}</div>
      </div>
    </div>
  )
}

export default Infocard
