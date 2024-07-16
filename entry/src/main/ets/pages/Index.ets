import { CircleShape, EllipseShape, PathShape, RectShape } from '@ohos.arkui.shape';

@Entry
@Component
struct Index {
  @State currentIndex: number = 1;
  @State message: string = 'Hello World';

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        Column({ space: 10 }){

          Column({ space: 5 }) {


            Image($rawfile('shunhe.webp'))
              .width(405)
              .height(310)
              .objectFit(ImageFit.Fill)
              .borderRadius({
                bottomLeft: 100, bottomRight: 100

              })


          }
          Column({ space: 5 } ){

            Row(){
              Image($rawfile('gonggao.PNG'))
              .width(30)
              .height(20)
              .objectFit(ImageFit.Fill)
              Swiper() {
                Text('“舜和会” 客人礼遇您了解吗1')
                  .width('90%')
                  .height('100%')
                  .backgroundColor(Color.White)
                  .textAlign(TextAlign.Center)
                  .fontSize(12)

                Text('"舜和会” 客人礼遇您了解吗2')
                  .width('90%')
                  .height('100%')
                  .backgroundColor(Color.White)
                  .textAlign(TextAlign.Center)
                  .fontSize(12)

                Text('"舜和会” 客人礼遇您了解吗3')
                  .width('90%')
                  .height('100%')
                  .backgroundColor(Color.White)
                  .textAlign(TextAlign.Center)
                  .fontSize(12)
              }
              .loop(true)
              .autoPlay(true)
              .interval(1500)
              .indicator(false)
              .displayArrow({
                showBackground: true,
                isSidebarMiddle: true,
                backgroundSize: 24,
                backgroundColor: Color.White,
                arrowSize: 18,
                arrowColor: Color.Black
              }, false)
            }
            .width(350)
            .height(20)
            .borderImage({
              source: {
                angle: 90,
                direction: GradientDirection.Left,
                colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
              },
              slice: { top: 8, bottom: 8, left: 8, right: 8 },
              width: { top: "5px", bottom: "5px", left: "10px", right: "10px" },
              repeat: RepeatMode.Stretch,
              fill: false
            })





          }.height(20)
          .width(400)

          .borderRadius(5)
          .direction(Direction.Ltr)



          Column(){
            Grid() {
              GridItem({}) {
                Image($rawfile('dingfang.PNG'))
                  .width(170)
                  .height(150)
                  .borderRadius(10)


              }.margin(0)

              GridItem() {
                Image($rawfile('tuangou.png'))
                  .width(170)
                  .height(150)
                  .borderRadius(10)

              }

            }
            .rowsTemplate('2fr ')
            .columnsTemplate('1fr  1fr' )
            .height(180)

            .columnsGap(15)
            .rowsGap(10)

            Grid() {
              GridItem() {
                Image($rawfile('yuding.png'))
                  .width(110)
                  .height(90)
                  .borderRadius(10)

              }

              GridItem() {
                Image($rawfile('order.png'))
                  .width(110)
                  .height(90)
                  .borderRadius(10)

              }

              GridItem() {
                Image($rawfile('concat.png'))
                  .width(110)
                  .height(90)
                  .borderRadius(10)

              }


            }
            .rowsTemplate('1fr')
            .columnsTemplate('1fr 1fr 1fr ')
            .columnsGap(10)
            .rowsGap(15)
            .height(90)





          }
          .width(355)
          Column({ space: 5 }){
            Grid() {
              GridItem() {

                Image($rawfile('meishi.PNG'))
                  .width(90)
                  .height(90)
                  .objectFit(ImageFit.Fill)


              }

              GridItem() {
                Image($rawfile('jituan.PNG'))
                  .width(90)
                  .height(90)
                  .objectFit(ImageFit.Fill)


              }

              GridItem() {
                Image($rawfile('weizhi.PNG'))
                  .width(90)
                  .height(90)
                  .objectFit(ImageFit.Fill)


              }

              GridItem() {
                Image($rawfile('kerenshuo.PNG'))
                  .width(90)
                  .height(90)
                  .objectFit(ImageFit.Fill)

              }


            }
            .rowsTemplate('1fr')
            .columnsTemplate('1fr 1fr 1fr 1fr')
            .rowsGap(0)
            .height(80)

          }
          .width(355)
          .borderRadius(10)
          .borderImage({
            source: {
              angle: 90,
              direction: GradientDirection.Left,
              colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
            },
            slice: { top: 8, bottom: 8, left: 8, right: 8 },
            width: { top: "10px", bottom: "10px", left: "10px", right: "10px" },
            repeat: RepeatMode.Stretch,
            fill: false
          })






        }


      }
      .tabBar(this.tabBuilder('首页', 0, $rawfile('index_select.png'), $rawfile('index_normal.png')))
      // .backgroundColor(Color.Gray)

      TabContent() {
        Image($rawfile('vip.png'))
          .height(720)
      }
      .tabBar(this.tabBuilder('会员', 1, $rawfile('vip_select.png'), $rawfile('vip_normal.png')))


      TabContent() {
        Text('我的内容').fontSize(30)
      }
      .tabBar(this.tabBuilder('我的', 2, $rawfile('mine_select.png'), $rawfile('mine_normal.png'))
      )

    }
    // .animationDuration(0)
    // .backgroundColor('#F1F3F5')
    .onChange((index: number) => {
      this.currentIndex = index
    })

  }

  @Builder
  tabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 35, height: 35 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#f4ea2a' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)

  }

}
