import { Order } from './OrderModel';

@Component
export default struct OrderViewStruct {
  @Link orderList: Array<Order>;
  @Link pendingpaymentList: Array<Order>; // 待付款
  @Link toBeUseList: Array<Order>; // 待使用
  @Link doneList: Array<Order>; // 已完成
  @State currentIndex: number = 0

  @Builder
  tabBuilder(title: string, targetIndex: number) {
    Column() {
      Text(title).fontColor(this.currentIndex === targetIndex ? '#CD9B1D' : '#696969')
    }
    .width('100%')
    .height(30)
    .justifyContent(FlexAlign.Center)
    .backgroundColor("#eee")
  }

  build() {
    Tabs({ barPosition: BarPosition.Start }) {
      TabContent() {
        List() {
          ForEach(this.orderList, (item: Order, index: number) => {
            ListItem() {
              newOrderBuilder(item)
            }
          })
        }
        .height('100%')
      }
      .tabBar(this.tabBuilder('全部', 0))

      TabContent() {
        List() {
          ForEach(this.pendingpaymentList, (item: Order, index: number) => {
            ListItem() {
              newOrderBuilder(item)
            }
          })
        }
        .height('100%')
      }
      .tabBar(this.tabBuilder('待付款', 1))

      TabContent() {
        List() {
          ForEach(this.toBeUseList, (item: Order, index: number) => {
            ListItem() {
              newOrderBuilder(item)
            }
          })
        }
        .height('100%')
      }
      .tabBar(this.tabBuilder('待使用', 2))

      TabContent() {
        List() {
          ForEach(this.doneList, (item: Order, index: number) => {
            ListItem() {
              newOrderBuilder(item)
            }
          })
        }
        .height('100%')
      }
      .tabBar(this.tabBuilder('已完成', 3))
    }
    .backgroundColor("#eee")
    .onChange((index: number) => {
      this.currentIndex = index
    })
  }
}

@Builder
function newOrderBuilder(item: Order) {
  Column({ space: 5 }) {
    Row() {
      Text(item.hotelName).fontSize(18).fontWeight(FontWeight.Bold).opacity(0.7).margin({ left: '5%' });
      Blank();
      Text(getStatus(item.orderStatus)).height(30);
    }.width('100%').margin({ bottom: 10 });

    Row() {
      Text(item.roomName).fontSize(16).margin({ left: '10%' });
      Blank();
      Text('¥' + item.actualPaidPrice).fontSize(14).fontColor('#CD9B1D');
    }.width('100%');

    Row() {
      Text(item.rmQty + "晚" + item.nights + "间").fontSize(15).opacity(0.7).margin({ left: '10%' });
    }.width('100%');

    Row() {
      Text(item.arrDate + "至" + item.depDate).fontSize(14).opacity(0.7).margin({ left: '10%' });
      Blank();
      Text("X" + item.nights).fontSize(15).fontWeight(FontWeight.Bold);
    }.width('100%');
  }
  .width('96%')
  .height('22%')
  .backgroundColor(Color.White)
  .margin({ left: '2%', right: '2%', top: 10 })
  .padding(15)
  .borderRadius(15)
}

function getStatus(status: string) {
  switch (status) {
    case "10":
      return "线上取消"
    case "11":
      return "线下取消"
    case "13":
      return "退款成功"
    case "15":
      return "退款失败"
    case "20":
      return "已完成"
    case "30":
      return "待使用"
    case "0":
      return "未付款"
    default: {
      return ""
    }
  }
}