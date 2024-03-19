// Second.ets
// 导入页面路由模块
import router from '@ohos.router';
import promptAction from '@ohos.promptAction'

class NetModel {
  public value: string
  public inset: NetModel

  constructor(value: string, inset: NetModel) {
    this.value = value
    this.inset = inset
  }
}
//装饰器
@Entry
@Component
struct Second {
  @State message: string = 'Hi there'
  @State netModel: NetModel = new NetModel("我有用", null)
  @State count: number = 0
  content: String = ""

  // 定义一个返回按钮的点击事件处理函数
  onBackClick(): void {
    // 调用router.showAlertBeforeBackPage()方法，设置返回询问框的信息
    try {
      router.showAlertBeforeBackPage({
        message: '您还没有完成支付，确定要返回吗？' // 设置询问框的内容
      });
    } catch (err) {
      console.error(`Invoke showAlertBeforeBackPage failed, code is ${err.code}, message is ${err.message}`);
    }

    // 调用router.back()方法，返回上一个页面
    router.back();
  }

  topTextClick(): void {
    this.netModel = new NetModel("我变了", null)
    this.message = "来了"
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(this.topTextClick.bind(this))
        Text(this.netModel.value)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(function(){
            console.log("点击事件")
            this.message = "不行吗？"
            this.count += 1
            // State({
            //   message: "发生变更"
            // })
          }.bind(this))
        // Divider()
        Button() {
          Text('Back' + this.count)
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        // 返回按钮绑定onClick事件，点击按钮时返回到第一页
        .onClick(this.onBackClick.bind(this))
        .width('100%')
      }
      .height('100%')
    }

  }
}
