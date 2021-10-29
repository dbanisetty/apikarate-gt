@run
Feature: validate ecg api route

Scenario Outline: verify gumtree ecg api route by location id

  * def currentDate = callonce isoDate

  * url baseUrl
  Given path '/api/papi/ads/search'
  * params { categoryId:'<categoryId>', categoryRedirected: '<categoryRedirected>', includeTopAds: '<includeTopAds>', keyword: '<keyword>', locationId: '<locationId>', page: '<page>', size: '<size>', sortType: '<sortType>'}
  * print 'ReqIS:' + params
  When method get
  Then status 200
  And match header Content-Type contains 'application/json;'

  # assert on params in response
  * def adSearchOptions = response.adSearchOptions
  And match adSearchOptions.keyword == '<keyword>'
  And match adSearchOptions.locationId contains <locationId>
  * match adSearchOptions.categoryId == <categoryId>

  # assert on headers in response
  * def correlationId = responseHeaders['x-ebay-capi-request-correlation-id']
  * print 'correlationId:' + correlationId
  Then match correlationId == '#notnull'

  # get all Ads end date and verify >currentDate
  * def AdsEndDate = get response.ads[*].endDate
  * print 'AdsEndDate: ' + AdsEndDate
  * print 'currentDate is: ' + currentDate
  #using js #? truthy and self validation expression variable `_`
  And match AdsEndDate ==  '#? _ >= currentDate'


  Examples:
    |categoryId|categoryRedirected|includeTopAds|keyword|locationId|page|size|sortType|
    |0         |1                 |1            |Table  |3003435   |1   |20  |DATE_DESCENDING|

