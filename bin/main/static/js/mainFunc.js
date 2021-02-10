$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

$(function() {     
  //при нажатии на ссылку, содержащую Thumbnail
  $('a.thumbnail').click(function(e) {
    //отменить стандартное действие браузера
    e.preventDefault();
    //присвоить атрибуту scr элемента img модального окна
    //значение атрибута scr изображения, которое обёрнуто
    //вокруг элемента a, на который нажал пользователь
    $('#image-modal .modal-body img').attr('src', $(this).find('img').attr('src'));
    //открыть модальное окно
    $("#image-modal").modal('show');
  });
  //при нажатию на изображение внутри модального окна 
  //закрыть его (модальное окно)
  $('#image-modal .modal-body img').on('click', function() {
    $("#image-modal").modal('hide')
  });
});

ymaps.ready(init);
function init()
{ 
    var myMap = new ymaps.Map("map", {
        center: [68.970599, 33.093592],
        zoom: 12
    });
    
    myMap.geoObjects
  /*  .add(new ymaps.GeoObject({
        geometry: {
            type: "Point",
            coordinates: [70.970599, 37.093592]
        },
        properties: {
            iconContent: 'M0455R',
            hintContent: '<b>Класс: исследовательский</br>Широта: 70.970599</br>Долгота: 37.093592</b>'
        }
    }, {
        preset: 'islands#blueStretchyIcon',
        draggable: false
    }))*/ 
    .add(new ymaps.GeoObject({
        geometry: {
            type: "Point",
            coordinates: [70.970599, 38.093592]
        },
        properties: {
            iconContent: 'PDS5678',
            hintContent: '<b>Класс: арктический</br>Широта: 70.970599</br>Долгота: 38.093592</b>'
        }
    }, {
        preset: 'islands#blueStretchyIcon',
        draggable: false
    }))
    .add(new ymaps.GeoObject({
        geometry: {
            type: "Point",
            coordinates: [69.970599, 35.093592]
        },
        properties: {
            iconContent: 'R78901',
            hintContent: '<b>Класс: научный</br>Широта: 69.970599</br>Долгота: 35.093592</b>'
        }
    }, {
        preset: 'islands#blueStretchyIcon',
        draggable: false
    }));  
}