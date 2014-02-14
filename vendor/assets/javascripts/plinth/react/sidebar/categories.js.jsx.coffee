###* @jsx React.DOM ###
#= require ./category_options
App.Sidebar = App.Sidebar || {}

App.Sidebar.Categories = React.createClass
  displayName: "Categories"

  # mixins: [App.Mixins.WindowResizeMixin]

  getDefaultProps: ->
    data: []

  getInitialState: ->
    selected: ""

  componentWillMount: ->
    @getCategories()

  getCategories: ()->
    @props.data = @categoriesMock()
    @setState selected: "/supermarket"

  categoriesMock: ->
    [
      {
        groupName: "Jobs",
        data:
          [
            {
              label: "Intern",
              URL: "/intern"
            }
          ,
            {
              label: "Grad",
              URL: "/Grads"
            }
          ,
          ]
      }
    ,
      {
        groupName: "Offers",
        data:
          [
            {
              label: "Supermarket",
              URL: "/supermarket"
            }
          ,
            {
              label: "Eating Out",
              URL: "/eating-out"
            }
          ]
      }
    ]

  handleCategoryChange: (event)->
    window.location.href = event.target.value

  # 
  # Render
  # 

  render: ->
    options = @props.data.map (group, k)=>
      App.Sidebar.CategoryOptions({group: group, key: "cat_group_#{k}"})

    React.DOM.div( {className:"sidebar__categories"},
      React.DOM.select( { ref: "select", value: @state.selected, onChange: @handleCategoryChange}, options )
    )
