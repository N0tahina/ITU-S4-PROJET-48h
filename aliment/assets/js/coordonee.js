window.addEventListener("load",function(){
    //prendre l'element de la form
    var ligne = this.document.getElementById("ligne");
    //prendre l'element de la form
    var form = this.document.getElementById("formD");
     //prise en charge du button submit
     form.addEventListener("submit",function(event) {
         event.preventDefault();//bloque le submit par defaut
         sendData(form); 
     })
     //send Data element
     function sendData(){
         var xhr;
            try {
                 xhr = new XMLHttpRequest(''); 
            }catch (error) {
                 xhr=false;
            }
        // envoyer formdata en objet
        var formData = new FormData(form);
        //preparati.on du request
        xhr.open("POST","getcordonneeLigne/"+ligne.value+"/");
        //envoye le formulaire
        xhr.send(formData);
        //arriver du pages simulation
        xhr.onreadystatechange  = function(){
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    map = new google.maps.Map(document.getElementById('map'), {
                        center: {lat: -18.897, lng: 47.525},
                        zoom: 12
                    });     
                    // Tableau des coordonnées des arrêts du taxibe 137
                    var parcoursTaxibe = [
                        { nom: "Fiadanamanga", position: new google.maps.LatLng(-18.997763755906767, 47.53579252384108) },
                        { nom: "Mandrimena", position: new google.maps.LatLng(-18.9915955271054, 47.53257066045039) },
                        { nom: "Galana", position: new google.maps.LatLng(-18.987416163547877, 47.532173663216824) },
                        { nom: "Boulangerie", position: new google.maps.LatLng(-18.984206559105516, 47.532804479055734) },
                        { nom: "Andoharanofotsy", position: new google.maps.LatLng(-18.977033694393125, 47.5329385895031) },
                        { nom: "Pharmacie", position: new google.maps.LatLng(-18.974345058730098, 47.53197299428833) },
                        { nom: "Malaza", position: new google.maps.LatLng(-18.97089280480064, 47.52996670195163) },
                        { nom: "Sampanan'ny Tongarivo", position: new google.maps.LatLng(-18.969564, 47.529560) },
                        { nom: "Ambaniatsimo", position: new google.maps.LatLng(-18.965845458070813, 47.52974282804187) },
                        { nom: "Magasin M", position: new google.maps.LatLng(-18.963415378963074, 47.529496064808065) },
                        { nom: "Analamanga", position: new google.maps.LatLng(-18.957829614000413, 47.52935658995687) },
                        { nom: "35", position: new google.maps.LatLng(-18.95423250558159, 47.52884160582896) },
                        { nom: "Fasika", position: new google.maps.LatLng(-18.949529258107788, 47.52603601518474) },
                        { nom: "Ankadimbahoaka", position: new google.maps.LatLng(-18.943021997644006, 47.52358665250784) },
                        { nom: "Sampanan'ny fasan'ny karana", position: new google.maps.LatLng(-18.94233011109593, 47.52279158084812) },
                        { nom: "Paraky", position: new google.maps.LatLng(-18.935195631172604, 47.52189327704523) },
                        { nom: "Descours", position: new google.maps.LatLng(-18.934918338318717, 47.52143135486626) },
                        { nom: "JIRAMA", position: new google.maps.LatLng(-18.92807994750312, 47.51898797881533) },
                        { nom: "Toby", position: new google.maps.LatLng(-18.923264068887583, 47.521146932809835) },
                        { nom: "Anosy", position: new google.maps.LatLng(-18.91800681315132, 47.521833578341464) },
                        { nom: "Ambondrona", position: new google.maps.LatLng (-18.906867, 47.526611) },
                        { nom: "Analakely", position: new google.maps.LatLng(-18.90475129935858, 47.524258295219575) }
                    ];
                
                    // Parcours du tableau des arrêts
                    for (var i = 0; i < parcoursTaxibe.length; i++) {
                        var arret = parcoursTaxibe[i];
                
                        // Création du marqueur pour chaque arrêt
                        var marker = new google.maps.Marker({
                            position: arret.position,
                            map: map,
                            title: arret.nom
                        });
                    }
                }
            }
        };
    }
 });
