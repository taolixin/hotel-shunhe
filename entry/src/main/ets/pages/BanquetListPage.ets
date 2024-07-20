import promptAction from '@ohos.promptAction'

// 宴会厅列表
class BanquetClass {
  id: string = '';  // 宴会厅id
  banquetName: string = '';  // 宴会厅名称
  labelList: string[] = []; // 标签
  banner: ResourceStr = '';

  constructor(id: string, banquetName: string, labelList: string[], banner: ResourceStr) {
    this.id = id;
    this.banquetName = banquetName;
    this.labelList = labelList;
    this.banner = banner;
  }
}

@Entry
@Component
struct BanquetListPage {
  @State banquetList: Array<BanquetClass> = [
    new BanquetClass('1', '401鲁韵厅', ['会议厅'], $r('app.media.banquet1')),
    new BanquetClass('2', '402齐风厅', ['宴会厅'], $r('app.media.banquet2')),
    new BanquetClass('3', '408女英厅', ['参会可容纳240人', '大型会议厅'], $r('app.media.banquet3')),
    new BanquetClass('4', '410重华厅', ['大型宴会', '进口艾迪线阵'], $r('app.media.banquet4')),
    new BanquetClass('5', '华厅三分之一厅', ['会议厅'], $r('app.media.banquet5')),
    new BanquetClass('6', '禧八喜', ['会议厅'], $r('app.media.banquet6')),
  ];

  build() {
    Column(){
      Navigation() {
        Scroll() {
          Column() {
            List() {
              ForEach(this.banquetList, (item: BanquetClass) => {
                ListItem() {
                  BanquetItem({ banquetItem: item })
                }
              }, (item: BanquetClass) => item.id)
            }
            .scrollBar(BarState.Off)
            .padding({ left: 16, right: 16 })
          }
          .margin({ top: 18, bottom: 30 })
          .alignItems(HorizontalAlign.Start)
        }
      }
      .title(this.NavigationTitle)
      .titleMode(NavigationTitleMode.Mini)
      .hideTitleBar(false)
    }
    .width('100%')
  }

  @Builder NavigationTitle() {
    Stack() {
      Text('舜和国际酒店')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('100%')
    }
    .margin({top: 16})
  }
}

@Component
struct BanquetItem {
  @Prop banquetItem: BanquetClass;
  build() {
    Row() {
      Image(this.banquetItem.banner)
        .width(180)
        .objectFit(ImageFit.Cover)
        .height(150)
      Column() {
        Text(this.banquetItem.banquetName)
          .fontSize(18)
          .textAlign(TextAlign.Start)
        ForEach(this.banquetItem.labelList, (item: string) => {
          ListItem() {
            Text(item)
              .fontSize(10)
              .border({ width: 1, color: Color.Gray })
              .padding(3)
              .margin({top: 5, right: 5})
          }
        })

        Blank()

        Button('立即前往')
          .margin({bottom: 5})
          .type(ButtonType.Normal)
          .borderRadius(8)
          .backgroundColor(Color.Red)
          .onClick(() => {
            promptAction.showToast({
              message: '敬请期待',
              duration: 2000
            });
          })
      }
      .height(150)
      .margin({left: 10})
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .margin({top: 15})
  }
}