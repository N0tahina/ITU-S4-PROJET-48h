var text = this.document.getElementById('ligne');
var value_recherche = this.document.getElementById('response');
var rest = []
text.addEventListener('keyup',() => {
    let xhr;
    try {
        xhr = new XMLHttpRequest(''); 
    }catch (error) {
        xhr=false;
    }
    if(this.document.getElementById('ligne').value == null){
        this.document.getElementById('ligne').value = 0
    }
    //preparation du request sur l'envois vers le file de destination
    xhr.open("POST","Acceuil/getligne/"+this.document.getElementById('ligne').value+"/");
    //envoye le formulaire
    xhr.send();
    //arriver du pages simulation
    xhr.onreadystatechange  = function(){
        if (xhr.readyState == 4) {
            value_recherche.innerHTML = ""
            if (xhr.status == 200) { 
                var value = JSON.parse(xhr.responseText);
                console.log(value);
                if(value.length > 0){                  
                    for (let index = 0; index < value.length; index++) {
                        var imput = '<a href="#" onclick=process("'+value[index].idligne+'")><input class="list-group-item-check">'
                        var label = '<label class="list-group-item rounded-3 py-3" for="listGroupCheckableRadios1">'+value[index].nom
                        var span = ' <span class="d-block small opacity-50">Liste des arrets disponible</span></label></a>'
                        value_recherche.innerHTML += imput+label+span
                    } 
                }      
            }
        }
    };
})