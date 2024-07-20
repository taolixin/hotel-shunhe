import axios, { AxiosError, AxiosResponse } from '@ohos/axios';

import dayJs from 'dayjs'
import { router } from '@kit.ArkUI';

class CommentsModel {
  id: string = "";
  commentMakerName: string = "";
  comment: string = "";
  score: number  ;
  commentTime: Date ;
  hotelName: string = "";


  constructor(id: string, commentMakerName: string, comment: string, score: number, commentTime: Date, hotelName: string) {
    this.id = id;
    this.commentMakerName = commentMakerName;
    this.comment = comment;
    this.score = score;
    this.commentTime = commentTime;
    this.hotelName = hotelName;

  }
}

@Entry
@Component
struct CommentsPage {
  @State message: string = 'Hello World';
  @State comments: CommentsModel[] = [];
  @State rating: number = 0

  aboutToAppear(): void {
    axios.get("http://172.22.144.1:3000/comments").then((res: AxiosResponse<CommentsModel[]>) => {
      // AlertDialog.show({message:JSON.stringify(res.data)})
      this.comments = res.data;
      console.log("看着里1" + JSON.stringify(res.data))

    }).catch((err: AxiosError) => {
      console.log("看着里2" + JSON.stringify(err))
    })

  }

  build() {
   Column(){
     Column({space:1}){
       Row(){

         Text("<").fontSize(25).width(55).height(20).fontWeight(600).textAlign(TextAlign.Center)
           .onClick(() => {
             router.back();
           })

         Text("客人说").fontSize(20).width(250).height(20).fontWeight(600).textAlign(TextAlign.Center)

       }
       .margin(15)
       .width(355)
       .height(30)
       Row(){
         Text("服务周到2").fontSize(12).fontColor(Color.Red).width(70).height(25).fontWeight(300).textAlign(TextAlign.Center).backgroundColor("#f8caca").borderRadius(5).margin(10)
         Text("环境卫生2").fontSize(12).fontColor(Color.Red).width(70).height(25).fontWeight(300).textAlign(TextAlign.Center).backgroundColor("#f8caca").borderRadius(5).margin(10)
         Text("设施设备2").fontSize(12).fontColor(Color.Red).width(70).height(25).fontWeight(300).textAlign(TextAlign.Center).backgroundColor("#f8caca").borderRadius(5).margin(10)
         Text("综合体验2").fontSize(12).fontColor(Color.Red).width(70).height(25).fontWeight(300).textAlign(TextAlign.Center).backgroundColor("#f8caca").borderRadius(5).margin(10)
       }
       .margin(15)
       .width(355)
       .height(30)

     }.backgroundColor(Color.White)
     Column(){
       List({space:10}){
         ForEach(this.comments, (item: CommentsModel) => {
           ListItem(){
             Column({space:3}){
               Row(){
                 Column(){
                   Image($rawfile("white.png")).width(60)
                     .clip(new Circle({ width: 60, height: 60 }))
                     .backgroundColor("#e6e6e6")
                     .objectFit(ImageFit.Contain)


                 }
                 Column(){
                   Text(item.commentMakerName).fontSize(12).margin(10).width(100).textAlign(TextAlign.Start)

                   Rating({ rating: item.score, indicator: false })
                     .stars(5)
                     .stepSize(0.5)
                     .margin( 5 )
                     // .onChange((value: number) => {
                     //   this.rating = value
                     // })


                 }.width(120)


                 Column(){

                   Text(`${dayJs(item.commentTime).format('YYYY/MM/DD')}`)
                     .fontSize(10).fontWeight(150).margin(5).width(120).textAlign(TextAlign.Center)
                   Text(item.hotelName).fontSize(10).fontWeight(150).margin(10).width(120).textAlign(TextAlign.End)


                 }.width(200)


               } .height(60)




               Row(){
               Text(item.comment) .fontSize(10).fontWeight(150).margin(5).width(355).textAlign(TextAlign.Center)

               }.height(50)

             }.width("100%")
             .height(130)
             .margin(8)
             .backgroundColor(Color.White)


           }
           .width("100%")
           .height(140)
           .backgroundColor(Color.White)

         })

       }
       .width("100%")
       .divider({strokeWidth:0, color:Color.White,startMargin:10,endMargin:20}).height('80%')









     }
     Column(){
       Button("去评论").width("100%").fontColor(Color.White).width("100%").height(45).margin(5).backgroundColor(Color.Red)
         .onClick(()=> {
           router.pushUrl({ url: "pages/GoCommentsPage" })
         })
     }.width("100%")


   }.width("100%")
    .height("100%")
   .backgroundColor('#e6e6e6')
  }
}

