From: Sp0oKeR <spooker@gmail.com>
Subject: Problems with ROUTE - Compile
Date: Wed, 24 Aug 2005 16:31:45 -0300
Message-ID: <9255886c050824123126f6c664@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

I applied POM in my kernel 2.4.31. I compiled kernel ok, but Im trying
to build new iptables package and Im getting this errors

c -O2 -g -pipe -march=3Di386 -mcpu=3Di686
-I/usr/src/redhat/BUILD/iptables-1.2.8/include -Wall -Wunused
-I/usr/src/linux/include -Iinclude/ -DIPTABLES_VERSION=3D\"1.2.8\"=20
-fPIC -o extensions/libipt_ULOG_sh.o -c extensions/libipt_ULOG.c
ld -shared -o extensions/libipt_ULOG.so extensions/libipt_ULOG_sh.o
cc -O2 -g -pipe -march=3Di386 -mcpu=3Di686
-I/usr/src/redhat/BUILD/iptables-1.2.8/include -Wall -Wunused
-I/usr/src/linux/include -Iinclude/ -DIPTABLES_VERSION=3D\"1.2.8\"=20
-fPIC -o extensions/libipt_ROUTE_sh.o -c extensions/libipt_ROUTE.c
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


I tried redhat source and the last version and I got same errors.

Thanks,

Sp0oKeR

