import { router } from '@kit.ArkUI';

@Entry
@Component
struct GoCommentsPage {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 1 }) {
      Column() {

        Row() {

          Text("<")
            .fontSize(25)
            .width(10)
            .height(20)
            .fontWeight(600)
            .textAlign(TextAlign.Start)
            .onClick(() => {
              router.back();
            })

          Text("发表评论")
            .fontSize(20)
            .width(350)
            .height(20)
            .fontWeight(600)
            .textAlign(TextAlign.Center)

        }
        .margin(5)


      }
      .width("100%")
      .height(50)
      .backgroundColor(Color.White)

      Column() {
        Image($rawfile("tuijian.PNG")).width("100%")


      }
      .margin(-1)
      .width("100%")
      .height(50)
      .backgroundColor(Color.White)

      Column() {
        Row() {

          Text("请选择门店   >")
            .fontSize(20)
            .width(355)
            .height(20)
            .fontWeight(600)
            .textAlign(TextAlign.End)


        }.margin(10)
        .width(355)

      }
      .width("100%")
      .height(50)
      .backgroundColor(Color.White)
      Column(){
        Rating({ rating: 0, indicator: false })
          .stars(5)
          .stepSize(1)
          .margin( 5 )
          .height(50)

      }
      .height(60)
      .width("100%")
      .backgroundColor(Color.White)
      Column(){
        Column(){
          Row(){
            Text("服务周到")
              .fontSize(20)
              .margin(10)
              .width(80)
              .height(20)
              .fontWeight(600)
              .textAlign(TextAlign.Start)
            Rating({ rating: 0, indicator: false })
              .stars(5)
              .stepSize(1)
              .margin( 5 )
              .height(30)


          }
          .margin(5)
          .width("100%")
          Row(){
            Text("环境卫生")
              .fontSize(20)
              .margin(10)
              .width(80)
              .height(20)
              .fontWeight(600)
              .textAlign(TextAlign.Start)
            Rating({ rating: 0, indicator: false })
              .stars(5)
              .stepSize(1)
              .margin( 5 )
              .height(30)


          }
          .margin(5)
          .width("100%")
          Row(){
            Text("设施设备")
              .fontSize(20)
              .margin(10)
              .width(80)
              .height(20)
              .fontWeight(600)
              .textAlign(TextAlign.Start)
            Rating({ rating: 0, indicator: false })
              .stars(5)
              .stepSize(1)
              .margin( 5 )
              .height(30)


          }
          .margin(5)
          .width("100%")
          Row(){
            Text("综合体验")
              .fontSize(20)
              .margin(10)
              .width(80)
              .height(20)
              .fontWeight(600)
              .textAlign(TextAlign.Start)
            Rating({ rating: 0, indicator: false })
              .stars(5)
              .stepSize(1)
              .margin( 5 )
              .height(30)


          }
          .margin(5)
          .width("100%")

          Row(){

            Text("出游类型")
              .fontSize(20)
              .margin(10)
              .width(80)
              .height(20)
              .fontWeight(600)
              .textAlign(TextAlign.Start)

            Column(){
              Row(){

                  Toggle({ type: ToggleType.Button, isOn: false }) {
                    Text('商务出差')
                  }
                  .width(70)
                  .selectedColor(Color.Red)
                  .margin(3)
                  .onChange((isOn: boolean) => {
                    console.info('Component status:' + isOn)
                  })


                Toggle({ type: ToggleType.Button, isOn: false }) {
                  Text('家庭亲子')
                }
                .width(70)
                .margin(3)
                .selectedColor(Color.Red)
                .onChange((isOn: boolean) => {
                  console.info('Component status:' + isOn)
                })
                Toggle({ type: ToggleType.Button, isOn: false }) {
                  Text('朋友出游')
                }
                .width(70)
                .margin(3)
                .selectedColor(Color.Red)
                .onChange((isOn: boolean) => {
                  console.info('Component status:' + isOn)
                })


              }
              Row(){
                Toggle({ type: ToggleType.Button, isOn: false }) {
                  Text('情侣出游')
                }
                .width(70)
                .margin(3)
                .selectedColor(Color.Red)
                .onChange((isOn: boolean) => {
                  console.info('Component status:' + isOn)
                })
                Toggle({ type: ToggleType.Button, isOn: false }) {
                  Text('代人预定')

                }
                .width(70)
                .margin(3)
                .selectedColor(Color.Red)
                .onChange((isOn: boolean) => {
                  console.info('Component status:' + isOn)
                })

                Toggle({ type: ToggleType.Button, isOn: false }) {
                  Text('其他')

                }
                .width(70)
                .margin(3)
                .selectedColor(Color.Red)
                .onChange((isOn: boolean) => {
                  console.info('Component status:' + isOn)
                })
              }
            }




          }
          .margin(5)
          .width("100%")


        }

      }
      .height(300)
      .width("100%")
      .backgroundColor(Color.White)
      Column(){
        TextArea({placeholder:'请留下您的宝贵意见'}).maxLength(200)
          .height(180)
          .width(355)
          .margin(10)
          .borderRadius(15)
          .backgroundColor('#cbe6e6e6')
          .showCounter( true)
      }
      .backgroundColor(Color.White)
      .width("100%")
      Column(){
        Button("提交").width("100%").fontColor(Color.White).width("100%").height(45).margin(5).backgroundColor(Color.Red)
          .onClick(()=> {
            router.pushUrl({ url: "pages/Index" })
          })
      }
      .width("100%")
      .height("100%")
      .backgroundColor(Color.White)

    }
    .width("100%")
    .height("100%")
    .backgroundColor('#cbe6e6e6')
    .onClick(() => {
      router.back();
    })

  }
}