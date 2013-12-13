CKEDITOR.editorConfig = function( config ) {
  config.toolbar_Custom = [
    { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
    { name: 'links',       items : [ 'Link','Unlink','Anchor' ] },
  ];

  config.toolbar = 'Custom';
};
