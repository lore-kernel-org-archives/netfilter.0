From: Brian Schang <netfilter@lists.schang.net>
Subject: Problems compiling xtables-addons v1.28
Date: Fri, 27 Aug 2010 23:34:09 -0400
Message-ID: <4C7883B1.10006@lists.schang.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello:

I have successfully compiled and am running xtables-addons v1.27. 
However I cannot get v1.28 to compile:

[root@server2 xtables-addons (build)]# ./autogen.sh
libtoolize: putting auxiliary files in `.'.
libtoolize: copying file `./ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
libtoolize: copying file `m4/libtool.m4'
libtoolize: copying file `m4/ltoptions.m4'
libtoolize: copying file `m4/ltsugar.m4'
libtoolize: copying file `m4/ltversion.m4'
libtoolize: copying file `m4/lt~obsolete.m4'
geoip/Makefile.am:3: `pkglibexec_SCRIPTS' is used but `pkglibexecdir' is 
undefined
autoreconf: automake failed with exit status: 1

Any suggestions would be appreciated.

Thank you.

-- 
Brian Schang
