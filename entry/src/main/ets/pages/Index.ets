// Index.ets
// 导入页面路由模块
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  private swiperController: SwiperController = new SwiperController()

  build() {
    Row() {
      Column() {
        // Swiper(this.swiperController) {
        //   Text("0")
        //     .width('90%')
        //     .height('100%')
        //     .backgroundColor(Color.Gray)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(30)
        //
        //   Text("1")
        //     .width('90%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(30)
        //
        //   Text("2")
        //     .width('90%')
        //     .height('100%')
        //     .backgroundColor(Color.Blue)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(30)
        // }
        // .indicatorStyle({
        //   size: 30,
        //   left: 0,
        //   color: Color.Red
        // })
        // .autoPlay(true)
        // .loop(true)

        Text(this.message)
          .fontSize(50)
          .fontColor($r('app.color.text_color'))
          .fontWeight(FontWeight.Bold)
        // 添加按钮，以响应用户点击
        Button() {
          Text('Next')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor($r('app.color.text_color'))
        .width('40%')
        .height('5%')
        // 跳转按钮绑定onClick事件，点击时跳转到第二页
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Next' button.`)

          // 弹出自定义的询问框
          promptAction.showDialog({
            message: '您还没有完成支付，确定要返回吗？',
            buttons: [
              {
                text: '取消',
                color: '#FF0000'
              },
              {
                text: '确认',
                color: '#0099FF'
              }
            ]
          }).then((result) => {
            if (result.index === 0) {
              // 用户点击了“取消”按钮
              console.info('User canceled the operation.');
            } else if (result.index === 1) {
              // 用户点击了“确认”按钮
              console.info('User confirmed the operation.');
              // 跳转到第二页
              router.pushUrl({ url: 'pages/Second' }).then(() => {
                console.info('Succeeded in jumping to the second page.')
              }).catch((err) => {
                console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
              })
            }
          }).catch((err) => {
            console.error(`Invoke showDialog failed, code is ${err.code}, message is ${err.message}`);
          })

        })
      }
      .width('100%')
    }
    .height('100%')
  }
}