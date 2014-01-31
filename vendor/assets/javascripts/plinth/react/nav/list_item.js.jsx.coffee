###* @jsx React.DOM ###
App.Nav = App.Nav || {}

App.Nav.ListItem = React.createClass
  displayName: "Navigation List Item"

  getDefaultProps: ->
    display: true

  render: ->
    classes = []
    classes += if @props.item.active then "is-active " else ""
    classes += if @props.display then "" else "nav-global_primary--hide "
    `<li className={classes} ><a href={this.props.item.url}>{this.props.item.label}</a></li>`
