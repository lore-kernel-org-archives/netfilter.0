From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [MASQUERADE] Not changing to new source ip address when dynamically
 assigned in ppp link
Date: Mon, 18 Jul 2011 14:15:38 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107181407430.13166@frira.zrqbmnf.qr>
References: <1310981976.47646.YahooMailNeo@web121603.mail.ne1.yahoo.com> <alpine.LNX.2.01.1107181242310.7358@frira.zrqbmnf.qr> <1310990054.84728.YahooMailNeo@web121619.mail.ne1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1310990054.84728.YahooMailNeo@web121619.mail.ne1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Autocad Learner <learn.autocad@yahoo.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Monday 2011-07-18 13:54, Autocad Learner wrote:

>Hi Jan,
>
>Thanks for your quick reply.
>
>Unfortunately we cannot upgrade our kernels.=C2=A0
>
>I would like to know if there is any clean work around to deal with th=
is
>issue.

You could clear the CT table on ppp-down... but that, too, is only
available in newer kernel versions.

[In other words, running old systems just works to your _complete_
disadvantage.]

>We do not want to do an iptables restart or server restart to take thi=
s
>effect.=C2=A0 Also i saw in one of the posts i can set the ip_conntrac=
k_udp_timeout
>and ip_conntrack_udp_timeout_stream to 0 and revert back after 10 seco=
nds.
>Since i am a newbie, i am not sure whether this would affect any other
>application. Is it the best way to deal with this issue?
>
>To understand this problem:-
>
>The ip_dynaddr says it would update the ip address when the packet is
>retransmitted before we get any incoming packets from the destination.

I only glanced over it, but it seems ip_dynaddr is merely to cater for
address changes in the TCP SYN retry cycle during dial-on-demand.
