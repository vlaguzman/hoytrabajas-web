import React from 'react'

export const showMessage = (messageList, color='black')=>{
  if(messageList){
    return messageList
    .map( messages => messages
      .map( (message, index) => ( <span key={`${message}_${index}`} style={{color: color}} key={message}>* {message} <br/></span> ) ) )
  }
}

export const showExperience = experienceList => {
  if(experienceList){
    return experienceList.map( (experience, index) => (<p key={`${experience[1]}_${index}`}> {`en ${experience[0]} como ${experience[1]}`}</p>))
  }
}