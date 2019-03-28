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
<div class="pjax">
    <#if pjax><!---- pjax {#pjax} start ----></#if>
    <#include "marcr-header.ftl">
    <@header type="article"></@header>
    <div class="article__top">
        <div class="fn__clear">
            <div class="title">${article.articleTitle}</div>
            <#include "../../common-template/share.ftl">
        </div>
        <progress class="article__progress"></progress>
    </div>
    <div class="article">
        <div class="ft__center">
            <div class="item__meta">
                <time>
                ${article.articleCreateDate?string("yyyy-MM-dd")}
                </time>
                /
                <#list article.articleTags?split(",") as articleTag>
                <a class="tag" rel="tag" href="${servePath}/tags/${articleTag?url('UTF-8')}">${articleTag}</a> &nbsp;
                </#list>
            </div>
            <h2 class="item__title">
            ${article.articleTitle}
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
            </h2>
        </div>
        <div class="item__cover" style="background-image: url(${article.articleImg1URL})"></div>
        <section class="vditor-reset item__content wrapper">
        ${article.articleContent}
            <#if "" != article.articleSign.signHTML?trim>
                <div>
                    ${article.articleSign.signHTML}
                </div>
            </#if>
        </section>
    </div>
    <#if article?? && article.articleToC?? && article.articleToC?size &gt; 0>
    <div class="post__toc">
        <#include "../../common-template/toc.ftl"/>
    </div>
    </#if>
    <@comments commentList=articleComments article=article></@comments>
    <div class="article__bottom">
        <div class="wrapper">
            <div class="fn__flex">
                <div class="item" id="externalRelevantArticles"></div>
                <div class="item" id="randomArticles"></div>
                <div class="item" id="relevantArticles"></div>
            </div>
        </div>
    </div>
    <#if pjax><!---- pjax {#pjax} end ----></#if>
</div>
<#include "footer.ftl">
<script type="text/javascript" src="${staticServePath}/js/lib/jquery.qrcode.min.js"></script>
<#if pjax><!---- pjax {#pjax} start ----></#if>
<@comment_script oId=article.oId commentable=article.commentable>
    Skin.initArticle()
    page.tips.externalRelevantArticlesDisplayCount = "${externalRelevantArticlesDisplayCount}";
    <#if 0 != randomArticlesDisplayCount>
    page.loadRandomArticles('<h3>${randomArticlesLabel}</h3>');
    </#if>
    <#if 0 != externalRelevantArticlesDisplayCount>
    page.loadExternalRelevantArticles("<#list article.articleTags?split(",") as articleTag>${articleTag}<#if articleTag_has_next>,</#if></#list>",
    '<h3>${externalRelevantArticlesLabel}</h3>');
    </#if>
    <#if 0 != relevantArticlesDisplayCount>
    page.loadRelevantArticles('${article.oId}', '<h3>${relevantArticlesLabel}</h3>');
    </#if>
</@comment_script>
<#if pjax><!---- pjax {#pjax} end ----></#if>
</body>
</html>
