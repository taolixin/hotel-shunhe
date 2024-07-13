@Entry
@Component
struct Index {
  @State currentIndex: number= 1;
  @State message: string = 'Hello World';

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        Text('首页的内容').fontSize(30)
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
    .animationDuration(0)
    .backgroundColor('#F1F3F5')
    .onChange((index: number) => {
      this.currentIndex = index
    })

  }
  @Builder tabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 30, height: 30 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)

  }
}
