import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rotary_flutter/main.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuItem {
  final String iconPath;
  final String label;
  final Function() onTap;

  MenuItem({
    required this.iconPath,
    required this.label,
    required this.onTap
  });
}

final List<MenuItem> menuItems = [
  MenuItem(
    iconPath : 'asset/icons/notice.png',
    label : '공지사항',
    onTap: () {
      navigatorKey.currentContext?.push('/menu/notice');
    }
  ),
  MenuItem(
    iconPath : 'asset/icons/calender.png',
    label : '행사일정',
    onTap: () {

    }
  ),
  MenuItem(
    iconPath : 'asset/icons/gallery.png',
    label : '지구갤러리',
    onTap: () {
      navigatorKey.currentContext?.push('/menu/gallery');
    }
  ),
  MenuItem(
    iconPath : 'asset/icons/my_rotary.png',
    label : '내 로타리',
    onTap: () {

    }
  ),
  MenuItem(
    iconPath : 'asset/icons/homepage.png',
    label : '지구홈페이지',
    onTap: () {

    }
  ),
  MenuItem(
    iconPath : 'asset/icons/band.png',
    label : '3700밴드',
    onTap: () {
      // https://band.us/band/50079452

      launchUrl(Uri.parse('https://band.us/band/50079452'));
    }
  ),
  MenuItem(
    iconPath : 'asset/icons/write.png',
    label : '총재월신',
    onTap: () {

    }
  ),
  MenuItem(
    iconPath : 'asset/icons/document.png',
    label : '총재단소개',
    onTap: () {
      navigatorKey.currentContext?.push('/menu/introduce_foundation');
    }
  ),
  MenuItem(
    iconPath : 'asset/icons/member.png',
    label : '지구임원',
    onTap: () {
      navigatorKey.currentContext?.push('/menu/organization');
    }
  ),
  MenuItem(
    iconPath : 'asset/icons/search.png',
    label : '회원검색',
    onTap: () {

    }
  ),
  MenuItem(
    iconPath : 'asset/icons/ads.png',
    label : '광고협찬',
    onTap: () {

    }
  ),
  MenuItem(
    iconPath : 'asset/icons/myInfo.png',
    label : '자기정보수정',
    onTap: () {

    }
  ),
  MenuItem(
    iconPath : 'asset/icons/k_rotary.png',
    label : 'K-로타리',
    onTap: () {
      navigatorKey.currentContext?.push('/menu/kRotaryKorea');
    }
  ),
  MenuItem(
    iconPath : 'asset/icons/rotary_kor.png',
    label : '로타리코리아',
    onTap: () {
      navigatorKey.currentContext?.push('/menu/rotaryKorea');
    }
  ),
  MenuItem(
    iconPath : 'asset/icons/president.png',
    label : 'RI 회장',
    onTap: () {
      navigatorKey.currentContext?.push('/menu/president');
    }
  ),
  MenuItem(
    iconPath : 'asset/icons/oper.png',
    label : '운영방침',
    onTap: () {
      navigatorKey.currentContext?.push('/menu/policy');
    }
  ),
  MenuItem(
    iconPath : 'asset/icons/history.png',
    label : '총재약력',
    onTap: () {
      navigatorKey.currentContext?.push('/menu/record');
    }
  ),
  MenuItem(
    iconPath : 'asset/icons/scoring.png',
    label : '배점표',
    onTap: () {
      navigatorKey.currentContext?.push('/menu/allocation');
    }
  ),
  MenuItem(
    iconPath : 'asset/icons/average.png',
    label : '표장기준',
    onTap: () {
      navigatorKey.currentContext?.push('/menu/criterion');
    }
  ),
  MenuItem(
    iconPath : 'asset/icons/form.png',
    label : '편성표',
    onTap: () {
      navigatorKey.currentContext?.push('/menu/programing');
    }
  ),

];