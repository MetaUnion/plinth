###* @jsx React.DOM ###
#= require ./panel_switches
#= require_tree ./panels
App.Sidebar = App.Sidebar || {}

App.Sidebar.Panels = React.createClass
  displayName: "Panels"

  getDefaultProps: ->
    data: []

  getInitialState: ->
    selected: ""

  componentWillMount: ->
    @getPanels()

  getPanels: ()->
    @props.data = @panelsMock()
    @setState selected: 1

  panelsMock: ->
    [
      {
        type: "Standard",
        url: "/supermarket",
        label: "Latest",
        icon: "someicon",
        refresh_time: 3000
      },
      {
        type: "Standard",
        url: "/pops",
        label: "Popular",
        icon: "othericon",
        refresh_time: 3000
      },
      {
        type: "Search",
        url: "/search",
        label: "Search",
        icon: "glass",
        refresh_time: 0
      }
    ]

  handlePanelChange: (selected_key)->
    @setState selected: selected_key

  # 
  # Render
  # 

  render: ->
    selected_panel = @props.data[@state.selected]
    console.log selected_panel.type
    React.DOM.div( {className:"sidebar__panels"},
      [
        App.Sidebar.PanelSwitches({ panels: @props.data, handlePanelClick: @handlePanelChange, selected: @state.selected }),
        App.Sidebar.Panel[selected_panel.type]?({ data: selected_panel})
      ]
    )
