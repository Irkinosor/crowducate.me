if(typeof Etc === 'undefined'){
  Etc = {};
}

Etc.prevent = function(evt){
  evt.preventDefault();
  evt.stopPropagation();
};
