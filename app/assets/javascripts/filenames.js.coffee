# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
jQuery ->
  Morris.Donut
    element: 'stat_file_update_type'
    data: [
      {label: "Download Sales", value: 12}
      {label: "In-Store Sales", value: 30}
      {label: "Mail-Order Sales", value: 20}
    ]
