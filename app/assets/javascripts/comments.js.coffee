$(document).on 'click', '.comments [data-reply-to]', ->
  textarea = $('#new_comment textarea')
  textarea.focus()
  textarea.val(textarea.val() + $(this).data('reply-to'))