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
<header class="header">
    <div class="wrapper">
        <a href="${servePath}" rel="start" class="header__logo">
            <img src="${adminUser.userAvatar}"/>
        ${blogTitle}
        </a>

        <nav class="header__nav">
            <a href="${servePath}/tags.html" rel="section">
                Tags
            </a>
            <a href="${servePath}/archives.html">
                Archives
            </a>
            <a rel="archive" href="${servePath}/links.html">
                Links
            </a>
            <a rel="archive" href="${servePath}/search">
                <i class="icon__search"></i>
            </a>
        </nav>
    </div>
</header>