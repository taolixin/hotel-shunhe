import axios, { AxiosError, AxiosResponse } from '@ohos/axios';
import { Order } from '../model/OrderModel';
import OutFrame from '../model/OutFrame';

const url: string = "http://172.22.144.1:3000/orderList";

@Entry
@Component
export struct OrderList {
  @State orderList: Array<Order> = []
  @State @Watch("switchState") loadState: number = 0
  // 待付款
  @State pendingpaymentList: Array<Order> = [];
  // 待使用
  @State toBeUseList: Array<Order> = [];
  // 已完成
  @State doneList: Array<Order> = [];

  switchState() {
    this.pendingpaymentList = []
    this.toBeUseList = []
    this.doneList = []

    this.pendingpaymentList = this.orderList.filter(item => item.orderStatus == "0");
    this.doneList = this.orderList.filter(item => item.orderStatus == "20");
    this.toBeUseList = this.orderList.filter(item => item.orderStatus == "30");
    this.orderList = this.orderList
  }

  build() {
    Column() {
      OutFrame({
        orderList: $orderList,
        pendingpaymentList: $pendingpaymentList,
        toBeUseList: $toBeUseList,
        doneList: $doneList
      })
    }
    .width('100%')
  }

  aboutToAppear() {
    axios.get(url)
      .then((resp: AxiosResponse) => {
        this.orderList = resp.data;
        this.loadState = 1
      })
      .catch((err: AxiosError) => {
        this.loadState = 2
        AlertDialog.show({ message: "error:" + JSON.stringify(err) })
      })
  }
}