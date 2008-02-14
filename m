From: Brent Clark <brentgclarklist@gmail.com>
Subject: Is anyone else having problems with the latest POM's geoip
Date: Thu, 14 Feb 2008 13:24:34 +0200
Message-ID: <47B424F2.5070607@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@vger.kernel.org

Hi

I would like to know if anyone else having problems with the latest POM=
's geoip with debian 2.6.24 kernel, and anyone know of release that wil=
l work.

   CC [M]  net/ipv4/netfilter/ipt_ipp2p.o
net/ipv4/netfilter/ipt_ipp2p.c:871: warning: initialization from incomp=
atible pointer type
net/ipv4/netfilter/ipt_ipp2p.c:875: warning: initialization from incomp=
atible pointer type
   CC [M]  net/ipv4/netfilter/ipt_geoip.o
net/ipv4/netfilter/ipt_geoip.c: In function =91match=92:
net/ipv4/netfilter/ipt_geoip.c:113: error: =91const struct sk_buff=92 h=
as no member named =91nh=92
net/ipv4/netfilter/ipt_geoip.c: At top level:
net/ipv4/netfilter/ipt_geoip.c:280: warning: initialization from incomp=
atible pointer type
net/ipv4/netfilter/ipt_geoip.c:284: warning: initialization from incomp=
atible pointer type
net/ipv4/netfilter/ipt_geoip.c: In function =91init=92:
net/ipv4/netfilter/ipt_geoip.c:291: error: implicit declaration of func=
tion =91ipt_register_match=92
net/ipv4/netfilter/ipt_geoip.c: In function =91fini=92:
net/ipv4/netfilter/ipt_geoip.c:296: error: implicit declaration of func=
tion =91ipt_unregister_match=92
make[4]: *** [net/ipv4/netfilter/ipt_geoip.o] Error 1
make[3]: *** [net/ipv4/netfilter] Error 2
make[2]: *** [net/ipv4] Error 2
make[1]: *** [net] Error 2
make[1]: Leaving directory `/usr/src/linux-source-2.6.24'

If anyone could assist thanks in advance.

Regards
Brent Clark

