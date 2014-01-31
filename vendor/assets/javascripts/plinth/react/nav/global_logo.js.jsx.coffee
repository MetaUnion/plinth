###* @jsx React.DOM ###
App.Nav = App.Nav || {}

App.Nav.GlobalLogo = React.createClass
  displayName: "Global Logo"
  render: ->
    `<h1 className='nav-global_title'>
      <a href='/'>
        <img src='http://placehold.it/100x30/4d4d4d/FFFFFF0&amp;text=Plinth'/>
        <span className='visuallyhidden'>Plinth</span>
      </a>
    </h1>`
