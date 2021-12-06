function deleteMovie(n){
    const ok = confirm('정말 삭제합니까?');
    // alert(ok);
    if(ok){
        location.href='MovieDelController?no=' + n
    }
}