# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
jQuery ->
  Morris.Donut
    element: 'stat_file_update_type'
    data: $('#stat_file_update_type').data('filenames')
