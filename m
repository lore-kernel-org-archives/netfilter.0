From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Fwd: Need guidance in - dropping incoming packets to a interface
 in a bridged network.
Date: Mon, 25 Jul 2016 20:07:32 +0200
Message-ID: <a529b978-43b6-118e-0772-174c1a47f956@plouf.fr.eu.org>
References: <CAGx1xT3HGq8WNmHAmEAOUR551LuBrDoFo=uhW6VV1w50KpBb4A@mail.gmail.com>
 <CAGx1xT1+z8=0k9bc-iHKJZkjP0Lbe2rdU-V2wFMaus2tXzpT1Q@mail.gmail.com>
 <CAGx1xT3r9xXVU1uZYWJL3P68NMvOutKnR5FW8JDhFHnRYq4u7A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGx1xT3r9xXVU1uZYWJL3P68NMvOutKnR5FW8JDhFHnRYq4u7A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: namus <suman.subj@gmail.com>
Cc: netfilter@vger.kernel.org

Le 25/07/2016 =C3=A0 12:37, namus a =C3=A9crit :
> Hi Team,
>
> My device contains 2 ethernet interfaces(eth1 and eth2)  added to
> bridge interface(br0)
> I am trying to DROP all the packets to eth1 interface based on some
> user-condition .
(...)
> Following commands do not work:
>
> iptables -t filter -I INPUT -i eth2 -j DROP (doesn't drop any packets
> - checked via tcpdump of eth2 )

Check the "physdev" match.

