window.addEventListener("load",function(){
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: -18.897, lng: 47.525},
        zoom: 12
    });
});

function process(ligne) {
    let xhr;
    try {
        xhr = new XMLHttpRequest(''); 
    }catch (error) {
        xhr=false;
    }
    //preparation du request sur l'envois vers le file de destination
    xhr.open("POST","Acceuil/getcordonneeLigne/"+ligne+"/");
    //envoye le formulaire
    xhr.send();
    //arriver du pages simulation
    xhr.onreadystatechange  = function(){
        if (xhr.readyState == 4) {
            if (xhr.status == 200) { 
                var value = JSON.parse(xhr.responseText);
                var result = []; // Tableau vide pour stocker les nouvelles valeurs   
                for (let index = 0; index < value.length; index++) {
                  var element = {
                    nom: value[index].nom, // Remplacez "nom" par le nom de la propriété dans "value"
                    position: new google.maps.LatLng(value[index].latitude, value[index].longitude) // Remplacez "lat" et "lng" par les propriétés de latitude et longitude dans "value"
                  };
                    result.push(element); // Ajoute l'élément dans le tableau "result"
                    // Parcours du tableau des arrêt
                }
                var mapOptions = {
                    center: new google.maps.LatLng(-18.897, 47.525),
                    zoom: 12
                };
                var carte = new google.maps.Map(document.getElementById("map"), mapOptions);

//                console.log(result);
                for (var i = 0; i < result.length; i++) {
                    var arret = result[i];
                    
                    // Création du marqueur pour chaque arrêt
                    var marker = new google.maps.Marker({
                        position: arret.position,
                        map: carte,
                        title: arret.nom
                    });
                }
            }
        }
    };
}