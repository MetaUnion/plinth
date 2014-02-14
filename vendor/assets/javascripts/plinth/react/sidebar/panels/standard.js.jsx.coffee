###* @jsx React.DOM ###
#= require_tree ../slats
App.Sidebar = App.Sidebar || {}
App.Sidebar.Panel = App.Sidebar.Panel || {}

App.Sidebar.Panel.Standard = React.createClass
  displayName: "Standard Panel"

  getDefaultProps: ->
    data: {}

  getInitialState: ->
    slats: []

  componentDidMount: ->
    setTimeout(
      (=>
        @getData()
      )
    ,3000)

  componentWillReceiveProps: (nextProps)->
    @setState slats: []
    setTimeout(
      (=>
        @getData()
      )
    ,3000)

  getData: ->
    dummy_slats = for i in [0..20]
      {
        type: "Basic",
        data: {
          title: "My Awesome Slat #{i}",
          description: "heaps of text",
          thumb: "http://placehold.it/50/",
          link: "http://google.com"
        } 
      }
    @setState slats: dummy_slats

  # 
  # Render
  # 

  createSlatPartials: ->
    return React.DOM.li({className: "sidebar__slat--empty"} ) unless @state.slats.length
    @state.slats.map (slat)->
      class_name = "sidebar__slat sidebar__slat--#{slat.type.toLowerCase()}"
      React.DOM.li { className: class_name }, App.Sidebar.Slat[slat.type]?({data: slat.data})

  render: ->
    items = @createSlatPartials()
    React.DOM.ul( {className:"sidebar__panel"}, items )
