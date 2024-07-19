/**
 * 客房列表页
 * */
import axios, { AxiosError, AxiosResponse } from "@ohos/axios";
import router from '@ohos.router';


class RoomModel {
  id: string = "";
  roomName: string = "";
  imageUrl: string = "";
  price: string = "";
  labelList: string[] = [];

  constructor(id: string, name: string, imageUrl: string, price: string, labelList: string[]) {
    this.id = id;
    this.roomName = name;
    this.imageUrl = imageUrl;
    this.price = price;
    this.labelList = labelList;
  }
}

@Entry
@Component
struct RoomListPage {
  @State message: string = 'Hello World';
  @State rooms: RoomModel[] = [];
  @State flag:Boolean = false;
  @State roomHeight:Number = 110
  aboutToAppear(): void {
    axios.get("http://172.22.144.1:3000/roomList").then((res: AxiosResponse<RoomModel[]>) => {
      // AlertDialog.show({message:JSON.stringify(res.data)})
      this.rooms = res.data;
      console.log("看着里1" + JSON.stringify(res.data))

    }).catch((err: AxiosError) => {
      console.log("看着里2" + JSON.stringify(err))
    })

  }

  build() {
    Column() {
      // 标题
      Row({ space: 20 }) {
        Image($r('app.media.icon')).width(30).onClick(() => {
          router.back();
        })
        Text("客房列表").fontColor('#ff0a0909').fontSize(18)
      }.width('100%').height(50).padding({ left: 10, right: 10 }).linearGradient({
        direction: GradientDirection.Right,
        colors: [
          ['#FF43FCB2', 0.0], ['#ff43fcf6', 1.0]
        ]
      })

      // 酒店列表
      List() {
        ForEach(this.rooms, (item: RoomModel) => {
          ListItem() {

            Row({ space: 12 }) {
              Image(item.imageUrl).width(70).objectFit(ImageFit.Contain)
              Column({ space: 2 }) {
                Text(item.roomName).fontSize(16).fontColor('#333').fontWeight(FontWeight.Bold)
                Row() {
                  Column(){
                    Text(item.labelList.join(' ')).fontSize(13).fontColor('#345').fontWeight(FontWeight.Bold)
                  }
                  Blank()
                  Column(){
                    Text(`￥${item.price}起`).fontColor('#fff5a62f')
                  }
                }.width('75%')
              }
              .alignItems(HorizontalAlign.Start)//左对齐
            }
            .width('100%')
            .height(this.roomHeight.toString())
            .backgroundColor('#fff')
            .padding(10)
          }
          .onClick(()=>{
            console.log(item.roomName)
          })
        })
      }
      .divider({strokeWidth:1, color:'#ffb1b3b5',startMargin:10,endMargin:10}).height('93%')
      // .listDirection(Axis.Horizontal)

      // 屏幕底端
      Row({ space: 20 }) {
      }.width('100%').height(50).padding({ left: 10, right: 10 }).linearGradient({
        direction: GradientDirection.Right,
        colors: [
          ['#FF43FCB2', 0.0], ['#ff43fcf6', 1.0]
        ]
      })
    }
    .width('100%').height('100%')

  }
}