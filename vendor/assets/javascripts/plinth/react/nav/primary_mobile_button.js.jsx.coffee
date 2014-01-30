###* @jsx React.DOM ###
App.Nav = App.Nav || {}

App.Nav.PrimaryMobileButton = React.createClass
  displayName: "Primary Mobile Button"

  handleClick: (e)->
    e.preventDefault()
    @props.handleSubNavToggle()

  render: ->
    styles = visibility: if @props.hide then "hidden" else "visible"
    text = if @props.count == 0 then "Explore" else "More"
    `<li className='nav-mobile-switch' style={styles}  ref="more_button">
      <a onClick={this.handleClick} href='#nav-global_primary-list'>{text}</a>
     </li>`
