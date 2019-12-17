import React from 'react'
import PropTypes from 'prop-types'
import CarouselRow from '../../../../components/Carousel/CarouselRow'

const JobCategories = ({ categories, translations }) => {
  return (
    <div className="t-home__jobCategories">
      <div
        className="mt-0 mb-40 d-flex flex-column justify-content-center align-items-center"
        style={{ textAlign: 'center' }}
      >
        <h4 className="companiesTitle a-typo__titleH4 color__blue-main">
          {translations.title}
        </h4>
        <h5 className="companiesSubtitle a-typo__titleH5">
          {translations.subtitle}
        </h5>
      </div>
      <CarouselRow slidesToShow={8} dots={false}>
        {categories.map(
          (item, index) =>
            index <= 13 && (
              <div key={item.id} className="jobCategory a-filter__gray">
                <div className="jobCategory__image">
                  <img
                    width="100%"
                    src={`/assets/static/img/${item.img}`}
                    alt={`${item.name} Icon`}
                  />
                </div>
                <p className="jobCategory__title color__blue-main fw-bold">
                  {item.name}
                </p>
              </div>
            )
        )}
      </CarouselRow>
      <p className="a-callToAction__inline">
        {translations.call_to_action_text.text}{' '}
        <a className="color__blue-main" href="/">
          {translations.call_to_action_text.link}
        </a>
      </p>
    </div>
  )
}

JobCategories.propTypes = {
  categories: PropTypes.array.isRequired,
  translations: PropTypes.shape({
    title: PropTypes.string.isRequired,
    subtitle: PropTypes.string.isRequired,
    call_to_action_text: PropTypes.shape({
      text: PropTypes.string.isRequired,
      link: PropTypes.string.isRequired
    })
  }).isRequired
}

export default JobCategories