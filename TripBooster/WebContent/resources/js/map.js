window.onload = function () {
   var map = new naver.maps.Map('map', {
       center: new naver.maps.LatLng(37.5665, 126.9780), // 서울 좌표
       zoom: 13
   });

   var loca = "도래울로 86"; // 여행 지역 주소
   
	naver.maps.Service.geocode({
        query: loca
    }, function(status, response) {
        if (status !== naver.maps.Service.Status.OK) {
            return alert('Something wrong!');
        }

        var result = response.v2, // 검색 결과의 컨테이너
            items = result.addresses; // 검색 결과의 배열
            
        // 리턴 받은 좌표 값을 변수에 저장
        let x = parseFloat(items[0].x);
        let y = parseFloat(items[0].y);
        
        // 지도 생성
        var map = new naver.maps.Map('map', {
			center: new naver.maps.LatLng(y, x), // 지도를 열 좌표
			zoom: 5
		});
		
        // 지도에 해당 좌표 마커(아이콘 설정)
        var markerOptions = {
        	    position: new naver.maps.LatLng(y, x), //마커찍을 좌표
        	    map: map,
        	    icon: {
        	        url: 'resources/img/marker.png', //아이콘 경로
        	        size: new naver.maps.Size(22, 36), //아이콘 크기
        	        origin: new naver.maps.Point(0, 0),
        	        anchor: new naver.maps.Point(11, 35)
        	    }
        	};
        
        // 마커 생성
        var marker = new naver.maps.Marker(markerOptions);
    });	
};
