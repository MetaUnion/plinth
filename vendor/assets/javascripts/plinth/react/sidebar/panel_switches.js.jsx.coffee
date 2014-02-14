###* @jsx React.DOM ###
App.Sidebar = App.Sidebar || {}

App.Sidebar.PanelSwitches = React.createClass
  displayName: "Panel Switches"

  getDefaultProps: ->
    data: []
    selected: ""

  # This abstraction stops react from moaning about bind()
  handleClick: (i)-> @props.handlePanelClick i

  # 
  # Render
  # 

  render: ->
    links = @props.panels.map (panel, i)=>
      class_name = if i is @props.selected then "is-active" else ""
      React.DOM.li({ onClick: @handleClick.bind(this,i), className: class_name }, panel.label)
    React.DOM.ul({ className:"sidebar__panel-switches" }, links)
