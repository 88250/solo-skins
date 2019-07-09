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
<#macro header type>
    <progress class="fn__progress"></progress>
    <header class="header header--${type}">
        <div class="wrapper header__title">
            <h1 class="header__h1 fn__flex-inline">
                <a href="${servePath}" rel="start" class="header__title">${blogTitle}</a>
            </h1>
            <h2 class="header__desc header__desc--title">${blogSubtitle}</h2>
            <div class="header__desc">
                ${noticeBoard}
            </div>
            <svg class="header__down" id="headerDown" viewBox="0 0 32 32" width="100%" height="100%">
                <path d="M15.992 25.304c-0 0-0 0-0.001 0-0.516 0-0.981-0.216-1.31-0.563l-0.001-0.001-14.187-14.996c-0.306-0.323-0.494-0.76-0.494-1.241 0-0.998 0.809-1.807 1.807-1.807 0.517 0 0.983 0.217 1.313 0.565l0.001 0.001 12.875 13.612 12.886-13.612c0.331-0.348 0.797-0.565 1.314-0.565 0.481 0 0.918 0.187 1.242 0.493l-0.001-0.001c0.723 0.687 0.755 1.832 0.072 2.555l-14.201 14.996c-0.33 0.348-0.795 0.564-1.311 0.564-0.001 0-0.003 0-0.004 0h0z"></path>
            </svg>
        </div>
    </header>
    <div class="side__menu">
        <svg viewBox="0 0 32 32" width="100%" height="100%">
            <path d="M30 18h-28c-1.1 0-2-0.9-2-2s0.9-2 2-2h28c1.1 0 2 0.9 2 2s-0.9 2-2 2zM30 6.25h-28c-1.1 0-2-0.9-2-2s0.9-2 2-2h28c1.1 0 2 0.9 2 2s-0.9 2-2 2zM2 25.75h28c1.1 0 2 0.9 2 2s-0.9 2-2 2h-28c-1.1 0-2-0.9-2-2s0.9-2 2-2z"></path>
        </svg>
        <span>
            &nbsp; menu
        </span>
    </div>
    <div class="side__main">
        <div class="side__bg"></div>
        <div class="side__panel">
            <img src="${faviconURL}">
            <a href="${servePath}/tags.html" rel="section">
                ${allTagsLabel}
            </a>
            &nbsp;•&nbsp;
            <a href="${servePath}/archives.html">
                ${archiveLabel}
            </a>
            &nbsp;•&nbsp;
            <a rel="archive" href="${servePath}/links.html">
                ${linkLabel}
            </a>
            <nav class="wrapper header__nav fn__clear">
                <a href="${servePath}" rel="start">
                    <#if type == 'article'>
                        ${blogTitle}
                    <#else>
                        ${indexLabel}
                    </#if>
                </a>

                <#list pageNavigations as page>
                    <a class="fn__flex-inline" href="${page.pagePermalink}" target="${page.pageOpenTarget}" rel="section">
                        <#if page.pageIcon != ''><img src="${page.pageIcon}"></#if> ${page.pageTitle}
                    </a>
                </#list>

                <a href="${servePath}/search">
                    ${searchLabel}
                </a>

                <div class="fn__right">

                    <a rel="alternate" href="${servePath}/rss.xml">
                        RSS
                    </a>

                    <#if isLoggedIn>
                        <a href="${servePath}/admin-index.do#main">
                            ${adminLabel}
                        </a>
                        <a href="${logoutURL}">
                            ${logoutLabel}
                        </a>
                    <#else>
                        <a rel="alternate" href="${servePath}/start">
                            ${startToUseLabel}
                        </a>
                    </#if>
                </div>
            </nav>
        </div>
    </div>
</#macro>