import React from 'react'
import Head from 'next/head'
import { useRouter } from 'next/router'
import Cortinilla from './shared/Cortinilla'
import data from './data'

const OffersPage = () => {
  return (
    <div className="main-wrapper pcx">
      <Head>
        <title>Registro de oferta</title>
        <meta name="description" content="Formularios de HoyTrabajas" />
      </Head>
      <div className="d-flex my-50 justify-content-center w-100 pb-50 ">
        <Cortinilla redirectTo="/offers/forms" {...data[0]} />
      </div>
    </div>
  )
}

export default OffersPage