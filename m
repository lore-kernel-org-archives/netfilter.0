From: vlad <faktroot@mail.ru>
Subject: Not compiled  connlimit
Date: Mon, 15 Mar 2004 17:42:24 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <702781646.20040315174224@mail.ru>
Reply-To: vlad <faktroot@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Hello netfilter,

gcc -D__KERNEL__ -I/usr/src/linux-2.4.25/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE -DMODVERSIONS -include /usr/src/linux-2.4.25/include/linux/modversions.h  -nostdinc -iwithprefix include -DKBUILD_BASENAME=ipt_connlimit  -c -o ipt_connlimit.o ipt_connlimit.c
ipt_connlimit.c: In function `init':
ipt_connlimit.c:219: error: `ip_conntrack_module' undeclared (first use in this function)
ipt_connlimit.c:219: error: (Each undeclared identifier is reported only once
ipt_connlimit.c:219: error: for each function it appears in.)
ipt_connlimit.c:220: warning: value computed is not used
ipt_connlimit.c: In function `fini':
ipt_connlimit.c:227: error: `ip_conntrack_module' undeclared (first use in this function)
ipt_connlimit.c:228: warning: value computed is not used
make[2]: *** [ipt_connlimit.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.4.25/net/ipv4/netfilter'
make[1]: *** [_modsubdir_ipv4/netfilter] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.25/net'
make: *** [_mod_net] Error 2

Where?

Thnx.

-- 
With best wishes,
 vlad                          mailto:faktroot@mail.ru

System/Network Administrator
TV/Video Engineer
ICQ 163227020
----------------------------------------------



