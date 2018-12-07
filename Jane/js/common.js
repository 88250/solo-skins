/*
 * Solo - A small and beautiful blogging system written in Java.
 * Copyright (c) 2010-2018, b3log.org & hacpai.com
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
 * @version 0.1.0.0, Dec 7, 2018
 */

/**
 * @description 皮肤脚本
 * @static
 */
var Skin = {
  init: function () {
    Util.initPjax()

    $('body').on('click', '.content-reset img', function () {
      window.open(this.src)
    })

    $('.header a').each(function () {
      if (this.href === location.href) {
        this.className = 'current'
      }
    }).click(function () {
      $('.header a').removeClass('current')
      this.className = 'current'
    })
  },
  _initArticleCommon: function () {
    if ($('.b3-solo-list li').length > 0 && $(window).width() > 1000) {
      $('.side').
        prepend('<div class="module"><div class="module__list"></div></div>')
      $('.side .module:eq(0) .module__list').html($('.b3-solo-list'))
    }
  },
  initArticle: function () {
    this._initArticleCommon()

    setTimeout(function () {
      if ($('#externalRelevantArticlesWrap li').length === 0) {
        $('#externalRelevantArticlesWrap').next().remove()
        $('#externalRelevantArticlesWrap').remove()
      }

      if ($('#relevantArticlesWrap li').length === 0) {
        $('#relevantArticlesWrap').prev().remove()
        $('#relevantArticlesWrap').remove()
      }

      if ($('#randomArticlesWrap li').length === 0) {
        $('#randomArticlesWrap').prev().remove()
        $('#randomArticlesWrap').remove()
      }
    }, 1000)
  },
}
Skin.init()