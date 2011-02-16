From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Ebtables usage
Date: Wed, 16 Feb 2011 09:50:58 +0100
Message-ID: <4D5B8FF2.2000806@plouf.fr.eu.org>
References: <AANLkTikpZ+q-L7AcYPmZzED3QAtNF-mDx47E5kfo41CW@mail.gmail.com>	<AANLkTikBvMercRhMs-rpRBYurGUV4J3FHXigtBXBhdsc@mail.gmail.com>	<AANLkTimR2FQfmmnoy6YoYYGCAqs=j26KpvtLTYHHgMQN@mail.gmail.com>	<4D5A59D9.9040407@plouf.fr.eu.org> <AANLkTikarsE3D+pyj_xKtR1F-Dy32+BKCiKWRZo18HMC@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikarsE3D+pyj_xKtR1F-Dy32+BKCiKWRZo18HMC@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jacky Lam <lamshuyin@gmail.com>
Cc: netfilter@vger.kernel.org

Jacky Lam a =E9crit :
> I want to share a network service by two computers but I don't have
> any extra router or switch, but one computer has 2 ethernet cards and
> running Linux. But that computer is old and slow. So I want to know i=
f
> I can set up that computer as a ethernet level switch/bridge.

What kind of network service ? Is that service running on the old compu=
ter ?
You can set up a computer as an ethernet bridge, but that old computer
may not be fast enough to handle gigabit traffic.

> That means I am done right (except the two rules at the beginning) to
> setup a ethernet switch? I don't need to setup any rules by iptables
> or ebtables?

You need iptables and ebtables rules for IP and ethernet packet
filtering and mangling. You don't need them if the box does only plain
routing or bridging.
