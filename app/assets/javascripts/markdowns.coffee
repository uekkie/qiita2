$(document)
  .on 'turbolinks:load', ->
    $('#item_body')
      .on 'keyup', $.debounce( 500, ->
        content = $(this).val()
        $.ajax({
          url: "/markdown/preview",
          type: "GET",
          data: { content : content },
          dataType: "html",
          success: (data) ->
            $('#preview_by_ajax').html(data)
        }))
