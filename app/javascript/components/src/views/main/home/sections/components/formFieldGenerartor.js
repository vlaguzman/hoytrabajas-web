import React from 'react'
import { Col } from 'reactstrap'
import TextField from '@material-ui/core/TextField'
import MenuItem from '@material-ui/core/MenuItem'

export default ({ fields }) => {
  return (
    <>
      {fields.map(({ label, name, type, aux, id }, i) => (
        /* TODO oscar I change md valud from 2 to 12 to expand de input */
        <Col key={i} xs={12} md={10} className=" p-0 pb-20 mx-5">
          {type.includes('text') ? (
            <TextField {...{ label }} className="pr-5" name={name} id={id} />
          ) : (
            <TextField
              select
              {...{ label }}
              className="w-100 pr-10"
              value=""
              name={name}
            >
              {aux.map(({ value, label }) => (
                <MenuItem key={value} {...{ value }}>
                  {label}
                </MenuItem>
              ))}
            </TextField>
          )}
        </Col>
      ))}
    </>
  )
}
