import React from 'react'
import Head from 'next/head'
import Paper from '@material-ui/core/Paper'
import { FormProvider } from '../../../context/formContext'
import { InfoProvider } from '../../../context/formInfoContext'
import FormBody from './sections/FormBody'
import allForms from './formJson'
import {Row, Col} from 'reactstrap'
import LinearProgress from '@material-ui/core/LinearProgress';
import Typography from '@material-ui/core/Typography';

const FormsPage = () => {
  const myRef = React.createRef()

  const scrollTop = () => {
    setTimeout(() => {
      myRef.current.scrollIntoView({ behavior: 'smooth', block: 'start' })
    }, 50)
  }

  return (
    <div className="main-wrapper pcx" ref={myRef}>
      <Head>
        <title>Registro de candidato</title>
        <meta name="description" content="HoyTrabajas Registro" />
      </Head>
      <Row className='mx-0 mt-70 mb-0 w-100 justify-content-center d-md-none'>
        <Col>
          <LinearProgress color="primary" variant="determinate" value={50} className='w-75 mx-auto' />
          <Typography variant='h6' className='text-center'>
            50%
          </Typography>
        </Col>
      </Row>
      <Row className="mt-10 mb-70 justify-content-center w-100 pb-50 mx-0 px-20">
        <FormProvider allForms={allForms} formName="candidate">
          <InfoProvider>
            <Paper className="position-relative d-flex flex-column paper-width justify-content-around align-items-center pt-60 mb-70">
              <FormBody scrollAction={scrollTop} />
            </Paper>
          </InfoProvider>
        </FormProvider>
      </Row>
    </div>
  )
}

export default FormsPage