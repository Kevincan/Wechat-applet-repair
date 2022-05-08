//app.js
App({
  onLaunch: function() {
    //wx.clearStorage();
    wx.removeStorageSync('uid');
    wx.removeStorageSync('zt');
    wx.removeStorageSync('qm');
    wx.showLoading({
      title: 'Loading...'
    })
    var that = this;
    wx.login({
      success: function(res) {
        wx.request({
          url: that.globalData.url + 'login.php',
          data: {
            code: res.code
          },
          success: function(res) {
            console.log("APP",res.data);
            that.globalData.employId = res.data.openid;
            if (res.data.status == '1') {
              wx.setStorageSync('uid', res.data.openid);
              wx.setStorageSync('zt', res.data.zt);
              wx.setStorageSync('config', res.data.config);
            } else {
              wx.setStorageSync('zt', res.data.zt);
              wx.showModal({
                title: '提示',
                content: '禁止登录',
                showCancel: false
              })
            }
            if (that.employIdCallback) {
              that.employIdCallback(res.data.openid);
            }
          }
        })
      }
    })
  },
  http: require("utils/request.js").request,
  globalData: {
    url: 'https://www.baoxiu.com/mini/',
    employId: ''
  }
})