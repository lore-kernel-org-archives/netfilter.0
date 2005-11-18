From: Arjen Smit <smit.arjen@gmail.com>
Subject: conntrack_rtsp
Date: Fri, 18 Nov 2005 12:11:34 +0100
Message-ID: <73fc994a0511180311q39fe9a4crcad41da424f24acd@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Hi all,

Is anyone aware of the status of the conntrack_rtsp module. I am
having a hard time compiling this.

On 2.6 kernel source using Patch-o-matic (pom) I patched in the
conntrack_rtsp module, compiled the kernel
and ran 'make modules'

See below,

  LD [M]  net/ipv4/netfilter/ip_conntrack.o

  CC [M]  net/ipv4/netfilter/ip_conntrack_proto_sctp.o

  CC [M]  net/ipv4/netfilter/ip_conntrack_rtsp.o

net/ipv4/netfilter/ip_conntrack_rtsp.c: In function 'help_out':

net/ipv4/netfilter/ip_conntrack_rtsp.c:340: error: too few arguments
to function 'ip_conntrack_expect_alloc'

net/ipv4/netfilter/ip_conntrack_rtsp.c:371: error: implicit
declaration of function 'ip_conntrack_expect_free'

make[3]: *** [net/ipv4/netfilter/ip_conntrack_rtsp.o] Error 1

make[2]: *** [net/ipv4/netfilter] Error 2

make[1]: *** [net/ipv4] Error 2

make: *** [net] Error 2

linux:/home/arsmit/packages/linux-2.6.13-15 #

After fixing an issue with 'ip_conntrack_expect_alloc' making it
similar to say the 'irc' module I came upon
the fundamental issue that functions like 'ip_conntrack_expect_free'
and ' ip_conntrack_change_expect' where implicitly defined.
Meaning they are not declared at all, I would expect them to be
declared in let's say 'ip_conntrack_core.c' but after
searching the whole kernel tree, nowhere.

I thought, maybe an older kernel tree, also nothing..


  CC [M]  net/ipv4/netfilter/ip_conntrack_rtsp.o

net/ipv4/netfilter/ip_conntrack_rtsp.c: In function 'help_out':

net/ipv4/netfilter/ip_conntrack_rtsp.c:371: error: implicit
declaration of function 'ip_conntrack_expect_free'

make[3]: *** [net/ipv4/netfilter/ip_conntrack_rtsp.o] Error 1

make[2]: *** [net/ipv4/netfilter] Error 2

make[1]: *** [net/ipv4] Error 2

make: *** [net] Error 2

linux:/home/arsmit/packages/linux-2.6.13-15 #




Has anyone ever managed to compile this, maybe I am overlooking
something because I a complete nooby,

I also looked into the source tree of a commercial product like the
linksys WRT54G WLAN router, they indeed use iptables with a load of
conntrack modules (sip, h323,mms, etc) but not rtsp. Maybe it is
because a lot of mediaclients like realplayer, quicktime, use http
fallback mechanism if the rtsp connection fails to set up, there is no
real need for a proper rtsp implementation.

Any ideas ? I would greatly appreciate !
Thanks
Arjen


  ReplyForward
=09=09
Hi all,

Is anyone aware of the status of the conntrack_rtsp module. I am
having a hard time compiling this.

On 2.6 kernel source using Patch-o-matic (pom) I patched in the
conntrack_rtsp module, compiled the kernel
and ran 'make modules'

See below,

  LD [M]  net/ipv4/netfilter/ip_conntrack.o

  CC [M]  net/ipv4/netfilter/ip_conntrack_proto_sctp.o

  CC [M]  net/ipv4/netfilter/ip_conntrack_rtsp.o

net/ipv4/netfilter/ip_conntrack_rtsp.c: In function 'help_out':

net/ipv4/netfilter/ip_conntrack_rtsp.c:340: error: too few arguments
to function 'ip_conntrack_expect_alloc'

net/ipv4/netfilter/ip_conntrack_rtsp.c:371: error: implicit
declaration of function 'ip_conntrack_expect_free'

make[3]: *** [net/ipv4/netfilter/ip_conntrack_rtsp.o] Error 1

make[2]: *** [net/ipv4/netfilter] Error 2

make[1]: *** [net/ipv4] Error 2

make: *** [net] Error 2

linux:/home/arsmit/packages/linux-2.6.13-15 #

After fixing an issue with 'ip_conntrack_expect_alloc' making it
similar to say the 'irc' module I came upon
the fundamental issue that functions like 'ip_conntrack_expect_free'
and ' ip_conntrack_change_expect' where implicitly defined.
Meaning they are not declared at all, I would expect them to be
declared in let's say 'ip_conntrack_core.c' but after
searching the whole kernel tree, nowhere.

I thought, maybe an older kernel tree, also nothing..


  CC [M]  net/ipv4/netfilter/ip_conntrack_rtsp.o

net/ipv4/netfilter/ip_conntrack_rtsp.c: In function 'help_out':

net/ipv4/netfilter/ip_conntrack_rtsp.c:371: error: implicit
declaration of function 'ip_conntrack_expect_free'

make[3]: *** [net/ipv4/netfilter/ip_conntrack_rtsp.o] Error 1

make[2]: *** [net/ipv4/netfilter] Error 2

make[1]: *** [net/ipv4] Error 2

make: *** [net] Error 2

linux:/home/arsmit/packages/linux-2.6.13-15 #




Has anyone ever managed to compile this, maybe I am overlooking
something because I a complete nooby,

I also looked into the source tree of a commercial product like the
linksys WRT54G WLAN router, they indeed use iptables with a load of
conntrack modules (sip, h323,mms, etc) but not rtsp. Maybe it is
because a lot of mediaclients like realplayer, quicktime, use http
fallback mechanism if the rtsp connection fails to set up, there is no
real need for a proper rtsp implementation.

Any ideas ? I would greatly appreciate !
Thanks
Arjen.

