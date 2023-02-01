Kakao.init("99b09a2becb70c7132217259628c4f68");

function loginWithKakao() {
    
    Kakao.Auth.login({
        scope: 'profile, account_email',
        success: function(authOjb) {
            Kakao.API.request({
                url: '/v2/user/me',
                success: res => {
                    const email = res.kakao_account.email;
                    const name = res.properties.nickname;
                    
                    console.log(email);
                    console.log(name);
                }
            })
        }
    })
}