/*
 * Solo - A small and beautiful blogging system written in Java.
 * Copyright (c) 2010-2019, b3log.org & hacpai.com
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
/**
 * @fileoverview util and every page should be used.
 *
 * @author <a href="http://vanessa.b3log.org">Liyuan Li</a>
 * @version 0.1.0.1, Mar 22, 2019
 */

/**
 * @description 皮肤脚本
 * @static
 */
var Skin = {
  init: function () {
    var $article__toc = $('.article__toc')
    $(window).scroll(function () {
      if ($article__toc.length === 1) {
        if ($('.article__bottom').offset().top < $(window).scrollTop()) {
          $article__toc.hide()
        } else {
          $article__toc.show()
        }
      }

      if ($('#headerNav').length === 0) {
        return
      }
      if ($(window).scrollTop() > 64) {
        $('#headerNav').addClass('header__nav--fixed')
        $('.main').css('margin-top', '100px')
      } else {
        $('#headerNav').removeClass('header__nav--fixed')
        $('.main').css('margin-top', '50px')
      }
    })
    $(window).scroll()

    Util.initPjax(function () {
      Util.parseMarkdown()
      if (Util.isArticlePage(location.href)) {
        if (!$('#articleSideShare .article__code').qrcode) {
          $.ajax({
            method: 'GET',
            url: Label.staticServePath + '/js/lib/jquery.qrcode.min.js',
            dataType: 'script',
            cache: true,
          })
        }
      }
      Skin.initToc()
    })
    Skin.initToc()
  },
  initTags: function () {
    var $tags = $('#tags')
    var tagsArray = $tags.find('.tag')
    // 根据引用次数添加样式，产生云效果
    var max = parseInt(tagsArray.first().data('count'))
    var distance = Math.ceil(max / 5)
    for (var i = 0; i < tagsArray.length; i++) {
      var count = parseInt($(tagsArray[i]).data('count'))
      // 算出当前 tag 数目所在的区间，加上 class
      for (var j = 0; j < 5; j++) {
        if (count > j * distance && count <= (j + 1) * distance) {
          tagsArray[i].className = 'tag tag__level' + j
          break
        }
      }
    }

    // 按字母或者中文拼音进行排序
    $tags.html(tagsArray.get().sort(function (a, b) {
      var valA = $(a).text().toLowerCase()
      var valB = $(b).text().toLowerCase()
      // 对中英文排序的处理
      return valA.localeCompare(valB)
    }))
  },
  initArticle1111: function () {
    if ($('#articleShare').length === 0) {
      return
    }

    var $postSide = $('.post__side')
    if ($(window).height() >= $('.post').height()) {
      $postSide.css('opacity', 1)
    }
    $postSide.css('left', (($('.post').offset().left - 20) / 2 - 27) + 'px')

    var sideAbsoluteTop = ($(window).height() - 249) / 2 + 125
    var beforScrollTop = $(window).scrollTop()
    $(window).scroll(function () {
      if ($('#articleShare').length === 0) {
        return
      }
      var scrollTop = $(window).scrollTop()
      var bottomTop = $('.article__bottom').offset().top
      if (scrollTop > 65) {
        $postSide.css('opacity', 1)

        if (beforScrollTop - scrollTop > 0) {
          // up
          $('.header').addClass('header--fixed').css({'top': '0'})
          $('.main').css('padding-top', '64px')
          if ($(window).height() <= $('.post').height() && scrollTop <
            bottomTop - $(window).height()) {
            $('.article__toolbar').css({
              'bottom': 0,
              'opacity': 1,
            })
          }
        } else if (beforScrollTop - scrollTop < 0) {
          // down
          $('.header').css({'top': '-64px'}).removeClass('header--fixed')
          $('.main').css('padding-top', '0')
          $('.article__toolbar').css({
            'bottom': '-44px',
            'opacity': 0,
          })
        }

      } else {
        if ($(window).height() <= $('.post').height()) {
          $postSide.css('opacity', 0)
        }

        $('.header').removeClass('header--fixed').css('top', '-64px')
        $('.main').css('padding-top', '0')
      }

      if (scrollTop > bottomTop - $(window).height()) {
        if (bottomTop < $(window).height()) {
          $postSide.css({
            'position': 'absolute',
            'top': (bottomTop - 125) + 'px',
          })
        } else {
          $postSide.css({
            'position': 'absolute',
            'top': (bottomTop - sideAbsoluteTop) + 'px',
          })
        }
      } else {
        $postSide.css({
          'position': 'fixed',
          'top': '50%',
        })
      }

      beforScrollTop = scrollTop
    })

    $(window).scroll()
  },
  initArticle: function () {
    this._initPage()
    page.share()
  },
  _initPage: function () {
    var $articleTocs = $('.vditor-reset [id^=b3_solo_h]')
    var $articleToc = $('.article__toc')
    var $articleProgress = $('.article__progress')

    if ($articleToc.length === 1) {
      $('.post__toc').
        css('left', $('.article .item__content').offset().left +
          $('.article .item__content').outerWidth() - 80)
    }
    $(window).unbind('scroll').scroll(function (event) {
      if ($articleProgress.length === 0) {
        return false
      }

      $articleProgress.attr('value', parseInt($(window).scrollTop())).
        attr('max', parseInt($('body').outerHeight() -
          $(window).height()))

      if ($(window).scrollTop() > 236) {
        $('.article__top').css('top', 0)
      } else {
        $('.article__top').css('top', -60)
      }

      if ($('.article__toc li').length === 0) {
        return false
      }

      if ($(window).scrollTop() > 990 && $(window).scrollTop() <
        $('.article').outerHeight() + 100) {
        $('.post__toc').show()
      } else {
        $('.post__toc').hide()
        return
      }

      // 界面各种图片加载会导致帖子目录定位
      var toc = []
      $articleTocs.each(function (i) {
        toc.push({
          id: this.id,
          offsetTop: this.offsetTop,
        })
      })

      // 当前目录样式
      var scrollTop = $(window).scrollTop()
      for (var i = 0, iMax = toc.length; i < iMax; i++) {
        if (scrollTop < toc[i].offsetTop) {
          $articleToc.find('li').removeClass('current')
          var index = i > 0 ? i - 1 : 0
          $articleToc.find('a[href="#' + toc[index].id + '"]').
            parent().
            addClass('current')
          break
        }
      }
      if (scrollTop >= toc[toc.length - 1].offsetTop) {
        $articleToc.find('li').removeClass('current')
        $articleToc.find('li:last').addClass('current')
      }
    })

    $(window).scroll()
  },
}
// Skin.init();