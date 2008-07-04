From: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= 
	<scramatte@zensoluciones.com>
Subject: ipp2 won't compile with lastest  iptables from  git
Date: Fri, 04 Jul 2008 17:33:17 +0200
Message-ID: <486E42BD.7090609@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi

I can't compile ipp2p wit the latest iptables from git !
I've applied the ipp2p patch from  patch-o-matic  git  ... When I open 
libipt_ipp2.c it seems that the source already has the required change 
for  iptables 1.4.x ... biut unfortuanteley doesn't works for me !

...
make[2]: Entering directory `/usr/src/iptables/extensions'
  CC       libipt_ipp2p.oo
libipt_ipp2p.c:396: error: variable 'ipp2p' has initializer but 
incomplete type
libipt_ipp2p.c:398: error: unknown field 'next' specified in initializer
libipt_ipp2p.c:398: warning: excess elements in struct initializer
libipt_ipp2p.c:398: warning: (near initialization for 'ipp2p')
libipt_ipp2p.c:399: error: unknown field 'name' specified in initializer
libipt_ipp2p.c:399: warning: excess elements in struct initializer
libipt_ipp2p.c:399: warning: (near initialization for 'ipp2p')
libipt_ipp2p.c:400: error: unknown field 'version' specified in initializer
libipt_ipp2p.c:400: error: 'IPTABLES_VERSION' undeclared here (not in a 
function)
libipt_ipp2p.c:400: warning: excess elements in struct initializer
libipt_ipp2p.c:400: warning: (near initialization for 'ipp2p')
libipt_ipp2p.c:401: error: unknown field 'size' specified in initializer
libipt_ipp2p.c:401: warning: excess elements in struct initializer
libipt_ipp2p.c:401: warning: (near initialization for 'ipp2p')
libipt_ipp2p.c:402: error: unknown field 'userspacesize' specified in 
initializer
libipt_ipp2p.c:402: warning: excess elements in struct initializer
libipt_ipp2p.c:402: warning: (near initialization for 'ipp2p')
libipt_ipp2p.c:403: error: unknown field 'help' specified in initializer
libipt_ipp2p.c:403: warning: excess elements in struct initializer
libipt_ipp2p.c:403: warning: (near initialization for 'ipp2p')
libipt_ipp2p.c:404: error: unknown field 'init' specified in initializer
libipt_ipp2p.c:404: warning: excess elements in struct initializer
libipt_ipp2p.c:404: warning: (near initialization for 'ipp2p')
libipt_ipp2p.c:405: error: unknown field 'parse' specified in initializer
libipt_ipp2p.c:405: warning: excess elements in struct initializer
libipt_ipp2p.c:405: warning: (near initialization for 'ipp2p')
libipt_ipp2p.c:406: error: unknown field 'final_check' specified in 
initializer
libipt_ipp2p.c:406: warning: excess elements in struct initializer
libipt_ipp2p.c:406: warning: (near initialization for 'ipp2p')
libipt_ipp2p.c:407: error: unknown field 'print' specified in initializer
libipt_ipp2p.c:407: warning: excess elements in struct initializer
libipt_ipp2p.c:407: warning: (near initialization for 'ipp2p')
libipt_ipp2p.c:408: error: unknown field 'save' specified in initializer
libipt_ipp2p.c:408: warning: excess elements in struct initializer
libipt_ipp2p.c:408: warning: (near initialization for 'ipp2p')
libipt_ipp2p.c:409: error: unknown field 'extra_opts' specified in 
initializer
libipt_ipp2p.c:410: warning: excess elements in struct initializer
libipt_ipp2p.c:410: warning: (near initialization for 'ipp2p')
libipt_ipp2p.c: In function 'libipt_ipp2p_init':
libipt_ipp2p.c:416: warning: implicit declaration of function 
'register_match'
make[2]: *** [libipt_ipp2p.oo] Error 1
make[2]: Leaving directory `/usr/src/iptables/extensions'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/usr/src/iptables'
make: *** [all] Error 2



