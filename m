From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: libipt_ROUTE patch on 2.4.22 with iptables 1.2.8 won't compile :(
Date: Wed, 15 Oct 2003 19:56:05 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDEMKKNJDLAJDPNDPCDDOEDBNGAA.georgev@citadelcomputer.com.au>
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
To: Netfilter Mailling List <netfilter@lists.netfilter.org>

Hey all, it's my first question in a way long time... So here goes.

I have 2.4.22 kernel source compiled and patched with patch-o-matic
"patch-o-matic-20030107"

I've since rebooted onto the new 2.4.22 kernel and so far only 1 module
won't compile.

[root@firewall iptables-1.2.8]# make all
make: *** Warning: File `.makefirst' has modification time in the future
(2003-10-15 23:25:28 > 2003-10-15 19:50:05.809656)
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ -DIPTABLES_VERSION
=\"1.2.8\"  -fPIC -o extensions/libipt_ROUTE_sh.o -c
extensions/libipt_ROUTE.c
extensions/libipt_ROUTE.c: In function `init':
extensions/libipt_ROUTE.c:44: structure has no member named `oif'
extensions/libipt_ROUTE.c:45: structure has no member named `iif'
extensions/libipt_ROUTE.c:46: structure has no member named `gw'
extensions/libipt_ROUTE.c: In function `parse':
extensions/libipt_ROUTE.c:73: structure has no member named `oif'
extensions/libipt_ROUTE.c:76: structure has no member named `oif'
extensions/libipt_ROUTE.c:78: structure has no member named `oif'
extensions/libipt_ROUTE.c:91: structure has no member named `iif'
extensions/libipt_ROUTE.c:94: structure has no member named `iif'
extensions/libipt_ROUTE.c:96: structure has no member named `iif'
extensions/libipt_ROUTE.c:105: structure has no member named `gw'
extensions/libipt_ROUTE.c: In function `print':
extensions/libipt_ROUTE.c:142: structure has no member named `oif'
extensions/libipt_ROUTE.c:143: structure has no member named `oif'
extensions/libipt_ROUTE.c:145: structure has no member named `iif'
extensions/libipt_ROUTE.c:146: structure has no member named `iif'
extensions/libipt_ROUTE.c:148: structure has no member named `gw'
extensions/libipt_ROUTE.c:149: structure has no member named `gw'
extensions/libipt_ROUTE.c: In function `save':
extensions/libipt_ROUTE.c:161: structure has no member named `oif'
extensions/libipt_ROUTE.c:162: structure has no member named `oif'
extensions/libipt_ROUTE.c:164: structure has no member named `iif'
extensions/libipt_ROUTE.c:165: structure has no member named `iif'
extensions/libipt_ROUTE.c:167: structure has no member named `gw'
extensions/libipt_ROUTE.c:168: structure has no member named `gw'
make: *** [extensions/libipt_ROUTE_sh.o] Error 1


Any ideas what could be wrong here?

"Programming is like sex: one mistake and you have to support it for
the rest of your life." - George Vieira (Dj Tremors)


