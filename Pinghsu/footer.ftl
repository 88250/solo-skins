<#--

    Solo - A small and beautiful blogging system written in Java.
    Copyright (c) 2010-2019, b3log.org & hacpai.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->
<footer class="footer">
    <nav class="footer__nav mobile__none">
        <#list pageNavigations as page>
            <a href="${page.pagePermalink}" target="${page.pageOpenTarget}" rel="section">
                ${page.pageTitle}
            </a>
        </#list>
        <a rel="alternate" href="${servePath}/rss.xml" rel="section">RSS</a>
        <#if isLoggedIn>
        <a href="${servePath}/admin-index.do#main" title="${adminLabel}">${adminLabel}</a>
        <a href="${logoutURL}">${logoutLabel}</a>
        <#else>
        <a href="${servePath}/start">${startToUseLabel}</a>
        </#if>
    </nav>
    <div class="footer__border mobile__none"></div>
    <div class="wrapper fn__flex">
        <div class="fn__flex-1 mobile__none">
            <div class="ft__gray">${adminUser.userName} - ${blogSubtitle}</div><br>
            <#if noticeBoard??>
                ${noticeBoard}
            </#if>
        </div>

        <#if 0 != mostUsedCategories?size>
            <div class="footer__mid fn__flex-1 mobile__none">
                <div class="ft__gray">${categoryLabel}</div> <br>
                <#list mostUsedCategories as category>
                    <a href="${servePath}/category/${category.categoryURI}"
                       aria-label="${category.categoryTagCnt} ${cntLabel}${tagsLabel}"
                       class="ft__nowrap tooltipped tooltipped__n">
                        ${category.categoryTitle}</a> &nbsp; &nbsp;
                </#list>
            </div>
        </#if>

        <div class="fn__flex-1 footer__copyright">
            <a href="${servePath}/archives.html">
            ${statistic.statisticPublishedBlogArticleCount}
            ${articleLabel}
            </a> &nbsp; &nbsp;
            ${statistic.statisticPublishedBlogCommentCount}
            ${commentLabel} <br>
            ${statistic.statisticBlogViewCount} <span class="ft-gray">${viewLabel}</span> &nbsp; &nbsp;
            ${onlineVisitorCnt} <span class="ft-gray">${onlineVisitorLabel}</span> <br>
            <a href="https://solo.b3log.org" target="_blank">Solo</a> ${version}
            &copy; ${year} ${footerContent}
            <a href="${servePath}">${blogTitle}</a>
            <br>
            Powered by <a href="https://b3log.org" target="_blank">B3log</a> 开源
            <br>
            Theme <a rel="friend" href="https://github.com/b3log/solo-skins" target="_blank">Pinghsu</a>
            by <a href="http://vanessa.b3log.org" target="_blank">Vanessa</a>
        </div>
    </div>
</footer>
<script type="text/javascript" src="${staticServePath}/js/lib/compress/pjax.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${staticServePath}/js/common${miniPostfix}.js?${staticResourceVersion}"
        charset="utf-8"></script>
<script type="text/javascript" src="${staticServePath}/skins/${skinDirName}/js/headroom${miniPostfix}.js"
        charset="utf-8"></script>
<script type="text/javascript"
        src="${staticServePath}/skins/${skinDirName}/js/common${miniPostfix}.js?${staticResourceVersion}"
        charset="utf-8"></script>
<script type="text/javascript">
    var latkeConfig = {
        'servePath': "${servePath}",
        'staticServePath': "${staticServePath}",
        'isLoggedIn': "${isLoggedIn?string}",
        'userName': "${userName}",
    }

    var Label = {
        'markedAvailable': ${markedAvailable?c},
        'skinDirName': "${skinDirName}",
    }

    Util.initSW()
    Util.parseMarkdown()
    Util.killIE()
</script>
${plugins}
