// pages/buySuccess/buySuccess.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    data: '',
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {
    if (options.share_user_id){
      wx.setStorageSync('shareId', options.share_user_id);
    }
    if (options.payment_type == '0') {
      options.payment_type = '微信支付'
    } else {
      options.payment_type = '余额支付'
    };
    this.setData({
      data: options,
      btnColor: wx.getStorageSync('btnColor'),
    });
    wx.setNavigationBarColor({
      frontColor: '#ffffff',
      backgroundColor: wx.getStorageSync('globalStyle').global_bg1,
    })
  },
  confirm: function() {
    if (this.data.data.pageName == 'order') {
      wx.navigateTo({
        url: '../Order/Order?id=' + '1',
      })
    } else {
      wx.switchTab({
        url: '../index/index',
      })
    }
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function() {
    
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function() {
    return {
      title: '蜗店',
      path: 'pages/index/index?page=' + getApp().page + '&share_user_id=' + wx.getStorageSync('user_id')
    }
  }
})