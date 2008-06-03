From: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= 
	<scramatte@zensoluciones.com>
Subject: "extensions/libipt_ah.c" iptables 1.4.0 compilation problem
Date: Wed, 04 Jun 2008 00:20:57 +0200
Message-ID: <4845C3C9.8000109@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I've patched my 2.6.24.7 kernel to use various netfilter extensions. I 
can compile and install it  as a debian package.
But I can't build "iptables 1.4.0" ... Extensions are detected but 
compilation hang on libipt_ah.c

Note that I use a debian lenny

#make KERNEL_DIR=../linux-2.6.24.7
Extensions found: XT:geoip IPv4:ACCOUNT IPv4:IMQ IPv4:IPMARK IPv4:ROUTE 
IPv4:TARPIT IPv4:account IPv4:condition IPv4:ipp2p IPv4:ipv4options 
IPv4:layer7 IPv4:set IPv4:SET IPv6:IMQ IPv6:ROUTE
cc -O2 -Wall -Wunused -I"/lib/modules/2.6.16.19-xen/build"/include 
-I../linux-2.6.24.7/include -Iinclude/ -DIPTABLES_VERSION=\"1.4.0\"  
-fPIC -o extensions/libipt_ah_sh.o -c extensions/libipt_ah.c
In file included from include/iptables.h:4,
                 from extensions/libipt_ah.c:8:
include/xtables.h:84: warning: 'struct xt_entry_match' declared inside 
parameter list
include/xtables.h:84: warning: its scope is only this definition or 
declaration, which is probably not what you want
include/xtables.h:91: warning: 'struct xt_entry_match' declared inside 
parameter list
include/xtables.h:99: warning: 'struct xt_entry_match' declared inside 
parameter list
include/xtables.h:103: warning: 'struct xt_entry_match' declared inside 
parameter list
include/xtables.h:140: warning: 'struct xt_entry_target' declared inside 
parameter list
include/xtables.h:147: warning: 'struct xt_entry_target' declared inside 
parameter list
include/xtables.h:154: warning: 'struct xt_entry_target' declared inside 
parameter list
include/xtables.h:158: warning: 'struct xt_entry_target' declared inside 
parameter list
extensions/libipt_ah.c: In function 'ah_init':
extensions/libipt_ah.c:71: error: dereferencing pointer to incomplete type
extensions/libipt_ah.c: In function 'ah_parse':
extensions/libipt_ah.c:83: error: dereferencing pointer to incomplete type
extensions/libipt_ah.c: In function 'ah_print':
extensions/libipt_ah.c:128: error: dereferencing pointer to incomplete type
extensions/libipt_ah.c: In function 'ah_save':
extensions/libipt_ah.c:141: error: dereferencing pointer to incomplete type
extensions/libipt_ah.c: At top level:
extensions/libipt_ah.c:165: warning: initialization from incompatible 
pointer type
extensions/libipt_ah.c:166: warning: initialization from incompatible 
pointer type
extensions/libipt_ah.c:167: warning: initialization from incompatible 
pointer type
extensions/libipt_ah.c:168: warning: initialization from incompatible 
pointer type
make: *** [extensions/libipt_ah_sh.o] Error 1

thank you for your help

