/**
 * 酒店列表页
 *
 * */
import axios, { AxiosError, AxiosResponse } from "@ohos/axios";
import router from '@ohos.router';


class HotelModel {
  id: string = "";
  name: string = "";
  totalReviewsNum: string = "";
  address: string = "";
  imageUrl: string = "";
  price: string = "";
  labelList: string[] = [];

  constructor(id: string, name: string, totalReviewsNum: string, address: string, imageUrl: string, price: string, labelList: string[]) {
    this.id = id;
    this.name = name;
    this.totalReviewsNum = totalReviewsNum;
    this.address = address;
    this.imageUrl = imageUrl;
    this.price = price;
    this.labelList = labelList;
  }
}

@Entry
@Component
struct HotelListPage {
  @State message: string = 'Hello World';
  @State hotels: HotelModel[] = [];

  aboutToAppear(): void {
    axios.get("http://172.22.144.1:3000/hotelList").then((res: AxiosResponse<HotelModel[]>) => {
      // AlertDialog.show({message:JSON.stringify(res.data)})
      this.hotels = res.data;
      console.log("看着里1" + JSON.stringify(res.data))

    }).catch((err: AxiosError) => {
      console.log("看着里2" + JSON.stringify(err))
    })

  }

  build() {
    Column() {
      // 标题
      Row({ space: 20 }) {
        Image($r('app.media.logo')).width(30).onClick(() => {
          router.back();
        })
        Text("酒店列表").fontColor('#ff0a0909').fontSize(18)
      }.width('100%').height(50).padding({ left: 10, right: 10 }).linearGradient({
        direction: GradientDirection.Right,
        colors: [
          ['#FF43FCB2', 0.0], ['#ff43fcf6', 1.0]
        ]
      })

      // 酒店列表
      List() {
        ForEach(this.hotels, (item: HotelModel) => {
          ListItem() {

            Row({ space: 12 }) {
              Image(item.imageUrl).width(70).objectFit(ImageFit.Contain)
              Column({ space: 2 }) {
                Text(item.name).fontSize(16).fontColor('#333').fontWeight(FontWeight.Bold)
                Text(item.totalReviewsNum + '评论').fontSize(12).fontColor('#999').fontWeight(FontWeight.Bold)
                Text(item.address).fontSize(14).fontColor('#999').fontWeight(FontWeight.Bold)
                //   .textOverflow({overflow:TextOverflow.Ellipsis
                // })
                //   .maxLines(2)
                  .width("80%")
                Row() {
                  Column(){
                    Text(item.labelList.toString().replace(',',' ')).fontSize(13).fontColor('#345').fontWeight(FontWeight.Bold)
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
            .height(110)
            .backgroundColor('#fff')
            .padding(10)

          }.onClick(()=>{
            router.pushUrl({url:"pages/RoomListPage"})
          })
        })
      }
      .divider({strokeWidth:1, color:'#ffb1b3b5'}).height('93%')
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