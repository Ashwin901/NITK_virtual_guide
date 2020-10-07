class GuideEvent{}

class ChangeGuidePageEvent extends GuideEvent{
  int index;
  ChangeGuidePageEvent({this.index});
}

class ChangeThemeEvent extends GuideEvent{
  var theme;
  ChangeThemeEvent({this.theme});
}