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
          Column({ space: 10 }) {


            Image($rawfile('shunhe.webp'))
              .width(400)
              .height(330)
              .borderRadius({
                bottomLeft: 100, bottomRight: 100

              })


          }
          .justifyContent(FlexAlign.Start)
          Column({ space: 10 }){
            Grid() {
              GridItem({}) {
                Image($rawfile('dingfang.PNG'))
                  .width(180)
                  .height(150)
                  .borderRadius(10)


              }.margin(0)

              GridItem() {
                Image($rawfile('tuangou.png'))
                  .width(180)
                  .height(150)
                  .borderRadius(10)

              }

            }
            .rowsTemplate('2fr ')
            .columnsTemplate('1fr  1fr' )
            .height(180)

            .columnsGap(10)
            .rowsGap(15)

            Grid() {
              GridItem() {
                Image($rawfile('dingfang.PNG'))
                  .width(120)
                  .height(100)
                  .borderRadius(10)

              }

              GridItem() {
                Image($rawfile('tuangou.png'))
                  .width(120)
                  .height(100)
                  .borderRadius(10)

              }

              GridItem() {
                Image($rawfile('dingfang.PNG'))
                  .width(120)
                  .height(100)
                  .borderRadius(10)

              }


            }
            .rowsTemplate('1fr')
            .columnsTemplate('1fr 1fr 1fr ')
            .columnsGap(10)
            .rowsGap(15)
            .height(90)

            Grid() {
              GridItem() {
                Image($rawfile('home_meishi.png'))
                  .width(100)
                  .height(100)
                  .objectFit(ImageFit.Fill)


              }

              GridItem() {
                Image($rawfile('home_hotel.png'))
                  .width(100)
                  .height(100)
                  .objectFit(ImageFit.Fill)


              }

              GridItem() {
                Image($rawfile('home_location.png'))
                  .width(100)
                  .height(100)
                  .objectFit(ImageFit.Fill)


              }

              GridItem() {
                Image($rawfile('home_custom.png'))
                  .width(100)
                  .height(100)
                  .objectFit(ImageFit.Fill)

              }


            }
            .rowsTemplate('1fr')
            .columnsTemplate('1fr 1fr 1fr 1fr')
            .rowsGap(0)
            .height(90)



          }





        }


      }
      .tabBar(this.tabBuilder('首页', 0, $rawfile('index_select.png'), $rawfile('index_normal.png')))

      TabContent() {
        Text('推荐的内容').fontSize(30)
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
