#=require plinth/plugins/tbg-sidebar-toggle

describe 'Sidebar Toggle:', ->
  beforeEach ->
    loadFixtures "plugins/tbg-sidebar-toggle_fixture"

  describe 'A good jquery plugin', ->
    it 'should exisit', ->
      expect($.fn.sidebarToggle).toBeDefined()
      expect($.fn.sidebarToggle).not.toBeNull()

    it 'should return element', ->
      expect($(document.body).sidebarToggle()[0]).toEqual document.body

  describe 'instantiates class upon click', ->
    it "adds the instance to the data method", ->
      link = $('[data-sidebarToggle]')
      console.log link
      # We make the target fail so that it is
      # not removed before we can test
      link.click()
      console.log link.data('sidebarTogglePlugin')
      expect( link.data('sidebarTogglePlugin') ).toBeDefined()
      expect( link.data('sidebarTogglePlugin') ).not.toBeNull()

  describe 'Define variables upon instantiation', ->
    it "defines element variables", ->
      link = $('[data-sidebarToggle]')
      console.log link
      link.sidebarToggle()
      console.log link.data( )
      expect( link.data('sidebarTogglePlugin').$el ).toEqual link
      expect( link.data('sidebarTogglePlugin').$canvas ).toEqual $('.off-canvas')

  describe 'Toggles canvas class', ->
    it "Adds a class to the canvas when clicked", ->
      link = $('[data-sidebarToggle]')
      link.click()
      data = link.data('sidebarTogglePlugin')
      expect( data.$canvas.hasClass( data._toggleClass ) ).toBeTruthy()

    it "Removes a class to the canvas when clicked again", ->
      link = $('[data-sidebarToggle]')
      link.click()
      data = link.data('sidebarTogglePlugin')
      expect( data.$canvas.hasClass( data._toggleClass ) ).toBeTruthy()
      link.click()
      expect( data.$canvas.hasClass( data._toggleClass ) ).toBeFalsy()

  describe 'Toggles self state class', ->
    it "Adds active class to self when clicked", ->
      link = $('[data-sidebarToggle]')
      link.click()
      data = link.data('sidebarTogglePlugin')
      expect( data.$el.hasClass( data._activeClass ) ).toBeTruthy()

    it "Removes active class to self when clicked again", ->
      link = $('[data-sidebarToggle]')
      link.click()
      data = link.data('sidebarTogglePlugin')
      expect( data.$el.hasClass( data._activeClass ) ).toBeTruthy()
      link.click()
      expect( data.$el.hasClass( data._activeClass ) ).toBeFalsy()

