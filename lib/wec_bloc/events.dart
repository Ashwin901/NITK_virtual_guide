class GuideEvent{}

class ChangeGuidePageEvent extends GuideEvent{
  int index;
  ChangeGuidePageEvent({this.index});
}

class GetInfoEvent extends GuideEvent{
  var itemName;
  var tag;
  GetInfoEvent({this.itemName,this.tag});
}

class ChangeThemeEvent extends GuideEvent{
  var theme;
  ChangeThemeEvent({this.theme});
}