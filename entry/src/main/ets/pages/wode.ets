class WinRecord{
  id: number = 0;   //中奖id 主键
  shopName: string = '';   //奖品名称
  image: ResourceStr = '';  //奖品图片
  expiryDate: string = '';  //兑换时间
  status: number = 1;    //状态 （待领取1，已领取2，已过期3）

  constructor(id: number, shopName: string, image: ResourceStr, expiryDate: string, status: number) {
    this.id = id;
    this.shopName = shopName;
    this.image = image;
    this.expiryDate = expiryDate;
    this.status = status;
  }
}

@Entry
@Component
export struct wode{
  @State winRecordList: Array<WinRecord> = [
    new WinRecord(1, '43度茅台500ml(价值1099)', $r('app.media.43maotai'), '2024.05.20-2024.06.20', 1),
    new WinRecord(2, '53度茅台500ml(价值1499)', $r('app.media.53maotai'), '2024.05.20-2024.06.20', 1),
    new WinRecord(3, 'iphone15 粉色 128g(价值5999)', $r('app.media.iphone_pink'), '2024.05.20-2024.06.20', 1),
    new WinRecord(4, 'iphone15pro 粉色 128g(价值5999)\"', $r('app.media.iphone_pink'), '2024.05.20-2024.06.20', 1),
    new WinRecord(2, '罗技鼠标(价值200)', $r('app.media.Logiteach'), '2024.05.20-2024.06.20', 2),
    new WinRecord(2, '联想键盘(价值100)', $r('app.media.keyboard'), '2024.04.20-2024.05.20', 3),
    new WinRecord(2, '53度茅台500ml(价值1499)111', $r('app.media.53maotai'), '2024.05.20-2024.06.20', 3),
    new WinRecord(3, 'iphone15 粉色 128g(价值5999)2222', $r('app.media.iphone_pink'), '2024.05.20-2024.06.20', 3),
  ]

  build(){
    Column(){
      Scroll() {
        Column() {
          List() {
            ForEach(this.winRecordList, (item: WinRecord) => {
              ListItem() {
                WinRecordItem({winRecordItem: item})
              }
            }, (item: WinRecord) => item.shopName)
          }
          .scrollBar(BarState.Off)
        }
      }
    }
    .width('100%')
    .padding({top: 20})
  }
}

@Component
struct WinRecordItem {
  @Prop winRecordItem: WinRecord;

  build() {
    Row() {
      Image(this.winRecordItem.image)
        .width(130)
        .objectFit(ImageFit.Contain)
        .height(110)
        .borderRadius(8)
        .borderWidth(1)
        .borderColor(Color.Gray)
      Blank()
      Column() {
        Flex({ direction: FlexDirection.Row }) {
          Text(this.winRecordItem.shopName)
            .width('75%')
            .height(50)
            .fontSize(18)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(2)

          if(this.winRecordItem.status == 1) {
            Text('待领取')
              .width('25%')
              .fontColor(Color.Red)
              .textAlign(TextAlign.End)
          } else if(this.winRecordItem.status == 2){
            Text('已领奖')
              .width('25%')
              .textAlign(TextAlign.End)
          } else {
            Text('已过期')
              .width('25%')
              .textAlign(TextAlign.End)
              .fontColor(Color.Gray)
          }
        }
        Flex({ direction: FlexDirection.Row }) {
          Text(this.winRecordItem.expiryDate)
            .width('75%')
            .fontSize(13)
            .fontColor(Color.Gray)
          Text('查看')
            .width('15%')
            .fontSize(13)
          Image($r('app.media.chakan'))
            .width(15)
        }
        .margin({top: 25})
      }
      .width('58%')
    }
    .width('100%')
    .height(120)
    .backgroundColor(Color.White)
    .padding({left: 10, right: 10})
    .margin({bottom: 20})
  }
}