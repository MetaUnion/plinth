# ============================================================
# Forms v0.0.1
# ============================================================
# Copyright 2012 The Beans Group
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


plugin = ($)->

  "use strict"  

  # FORMs CLASS DEFINITION
  # ========================= 
  class TBGForm
    constructor: ( element ) ->
      @form = $(element)
      @send()

    _constructor: TBGForm

    send : ->
      if not (url = @form.data('forms') || @form.attr('action')) then return false
      @sendRequest @form.serialize(), url

    sendRequest : (data, url)->
      $.ajax
        type: 'POST'
        url: url
        data: data
        dataType: "json"
        success: =>
          @showSuccess()
        error: (err) =>
          @showErrors $.parseJSON(err.responseText)


    showErrors :( errors )->
      @form.find('.form-msg.is-error').remove()

      for field, error of errors
        $this = @form.find("[id$=#{field}]").addClass('is-error')
        if not msg = ($this.siblings(".form-msg"))[0] then msg = $("<small class='form-msg'></small>").insertAfter($this)
        msg.text( "#{field} " + error.join(' & ') ).addClass('is-error')
        $this.siblings('label').addClass('is-error')


    showSuccess :->
      @showErrors {}
      @successArea = $(@form.data 'forms-success-replace')
      @successHTML = @form.data 'forms-success-content'
      @successArea.fadeOut().html(@successHTML).fadeIn()
      $('body').trigger 'tbgform-success', [@form]
      if @form.data 'forms-success-formfade' then @form.fadeOut()



  # DOWNLOADFORM PLUGIN DEFINITION
  # ==========================

  $.fn.forms = ( option ) ->
    this.each ->
      $this = $(@)
      data = $this.data 'formsPlugin'
      if !data then $this.data 'formsPlugin', (data = new TBGForm @) else data[option]()

  $.fn.forms.Constructor = TBGForm


  # DATA API
  # ===================================

  $ ->
    $('body').on 'submit.forms.data-api', '[data-forms]' , ( e ) ->
      $(e.target).forms('send')
      return false

do ( plugin ) ->
  if typeof define is 'function' and define.amd
    # AMD. Register as an anonymous module.
    define(['jquery'], plugin);
  else
    # Browser globals
    plugin(jQuery)
