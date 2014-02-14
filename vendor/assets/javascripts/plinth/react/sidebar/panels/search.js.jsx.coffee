###* @jsx React.DOM ###
#= require_tree ../slats
App.Sidebar = App.Sidebar || {}
App.Sidebar.Panel = App.Sidebar.Panel || {}

App.Sidebar.Panel.Search = React.createClass
  displayName: "Search Panel"

  getDefaultProps: ->
    url: "/home/search"
    data: {}

  getInitialState: ->
    slats: []


  # componentWillReceiveProps: (nextProps)->
  #   @getData()

  getSearchElements: (search = "")->
    $.ajax
      url: this.props.url,
      data:
        q: search
      success: (response)=>
        @setState slats: response.data

  updateSearch: (e)->
    @getSearchElements(e.target.value)

  # 
  # Render
  #

  createSlatPartials: ->
    @state.slats.map (slat)=>
      class_name = "sidebar__slat sidebar__slat--#{slat.type.toLowerCase()}"
      React.DOM.li { className: class_name }, App.Sidebar.Slat[slat.type]?({data: slat.data})

  render: ->
    items = @createSlatPartials()
    React.DOM.div({},
      [
        React.DOM.input({className: "sidebar__search-text", placeholder: "Search", type: "text", onChange: @updateSearch}, "" ),
        React.DOM.ul( {className:"sidebar__panel sidebar__panel--search"}, items )
      ]
    )
