<#--

    Solo - A small and beautiful blogging system written in Java.
    Copyright (c) 2010-present, b3log.org

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
<#include "../../common-template/macro-common_head.ftl">
<#include "macro-comments.ftl">
<#include "../../common-template/macro-comment_script.ftl">
<!DOCTYPE html>
<html>
<head>
    <@head title="${article.articleTitle} - ${blogTitle}" description="${article.articleAbstract?html}">
        <link rel="stylesheet"
              href="${staticServePath}/skins/${skinDirName}/css/base.css?${staticResourceVersion}"/>
        <#if previousArticlePermalink??>
            <link rel="prev" title="${previousArticleTitle}" href="${servePath}${previousArticlePermalink}">
        </#if>
        <#if nextArticlePermalink??>
            <link rel="next" title="${nextArticleTitle}" href="${servePath}${nextArticlePermalink}">
        </#if>
    </@head>
</head>
<body>
        <#include "header.ftl">
<div class="wrapper">
    <div class="main-wrap">
        <main>
            <article class="post">
                <header>
                    <h1>
                        <a rel="bookmark" href="${servePath}${article.articlePermalink}">
                        ${article.articleTitle}
                        </a>
                                <#if article.articlePutTop>
                                    <sup>
                                        ${topArticleLabel}
                                    </sup>
                                </#if>
                                <#if article.hasUpdated>
                                    <sup>
                                        ${updatedLabel}
                                    </sup>
                                </#if>
                    </h1>
                    <div class="meta">
                                <span class="vditor-tooltipped vditor-tooltipped__n" aria-label="${createDateLabel}">
                                    <i class="icon-date"></i>
                                    <time>
                                    ${article.articleCreateDate?string("yyyy-MM-dd")}
                                    </time>
                                </span>
                        &nbsp; | &nbsp;
                        <span class="vditor-tooltipped vditor-tooltipped__n" aria-label="${commentCountLabel}">
                                    <i class="icon-comments"></i>
                                    <a href="${servePath}${article.articlePermalink}#comments">
                                        ${article.articleCommentCount} ${commentLabel}</a>
                                </span>
                        &nbsp; | &nbsp;
                        <span class="vditor-tooltipped vditor-tooltipped__n" aria-label="${viewCountLabel}">
                                    <i class="icon-views"></i>
                        ${article.articleViewCount} ${viewLabel}
                                </span>
                    </div>
                </header>

                <div class="vditor-reset">
                ${article.articleContent}
                            <#if "" != article.articleSign.signHTML?trim>
                                <div>
                                    ${article.articleSign.signHTML}
                                </div>
                            </#if>
                </div>

                <footer class="tags">
                            <#list article.articleTags?split(",") as articleTag>
                                <a class="tag" rel="tag" href="${servePath}/tags/${articleTag?url('UTF-8')}">
                                    ${articleTag}</a>
                            </#list>

                <#-- div class="copyright">
                    ${articleCP1Label}
                    <a rel="bookmark" href="${servePath}${article.articlePermalink}">
                        ${article.articleTitle}
                    </a> -
                    <a href="${servePath}">
                        ${blogTitle}
                    </a>
                </div -->

                    <div class="rel fn-clear">
                                <#if previousArticlePermalink??>
                                    <a href="${servePath}${previousArticlePermalink}" rel="prev"
                                       class="fn-left vditor-tooltipped vditor-tooltipped__n"
                                       aria-label="${previousArticleTitle}">
                                        ${previousArticleLabel}
                                    </a>
                                </#if>
                                <#if nextArticlePermalink??>
                                    <a href="${servePath}${nextArticlePermalink}" rel="next"
                                       class="fn-right vditor-tooltipped vditor-tooltipped__n"
                                       aria-label="${nextArticleTitle}">
                                        ${nextArticleLabel}
                                    </a>
                                </#if>
                    </div>
                </footer>
                        <@comments commentList=articleComments article=article></@comments>
                <br>
                <div id="externalRelevantArticles" class="list"></div>
                <div id="relevantArticles" class="list"></div>
                <div id="randomArticles" class="list"></div>
            </article>
        </main>
                <#include "side.ftl">
    </div>
</div>
        <#include "footer.ftl">
        <@comment_script oId=article.oId commentable=article.commentable>
        page.tips.externalRelevantArticlesDisplayCount = "${externalRelevantArticlesDisplayCount}";
            <#if 0 != randomArticlesDisplayCount>
        page.loadRandomArticles();
            </#if>
            <#if 0 != externalRelevantArticlesDisplayCount>
        page.loadExternalRelevantArticles("<#list article.articleTags?split(",") as articleTag>${articleTag}<#if articleTag_has_next>,</#if></#list>"
            , "<header class='title'><h2>${externalRelevantArticlesLabel}</h2></header>");
            </#if>
            <#if 0 != relevantArticlesDisplayCount>
        page.loadRelevantArticles('${article.oId}', '<h4>${relevantArticlesLabel}</h4>');
            </#if>
        Skin.initToc()
        </@comment_script>
</body>
</html>
