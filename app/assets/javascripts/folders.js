$(document).ready(function() {
jQuery('#gtreetable').gtreetable({
  'source': function (id) {
      return {
        type: 'GET',
        url: 'nodeChildren',
        data: { 'id': id },
        dataType: 'json',
        error: function(XMLHttpRequest) {
          alert(XMLHttpRequest.status+': '+XMLHttpRequest.responseText);
        }
      }
    }
});
});
