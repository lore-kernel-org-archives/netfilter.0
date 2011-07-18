From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [MASQUERADE] Not changing to new source ip address when dynamically
 assigned in ppp link
Date: Mon, 18 Jul 2011 12:49:45 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107181242310.7358@frira.zrqbmnf.qr>
References: <1310981976.47646.YahooMailNeo@web121603.mail.ne1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1310981976.47646.YahooMailNeo@web121603.mail.ne1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Autocad Learner <learn.autocad@yahoo.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Monday 2011-07-18 11:39, Autocad Learner wrote:

>We are using linux Red Hat version RHEL 2.6.9-5.EL =C2=A0and iptables=20
>version 1.2.11-3.1.RHEL4 as Source System. The source ip address is=20
>assigned dynamically via ppp link over eth0 interface.=C2=A0
>
>When the link goes down and comes back, we get a new ip address and it=
=20
>is evident in the ppp0 interface. But the packets going out of our=20
>system still uses the old ip address.

This is already fixed in contemporary kernels AFAICS.
