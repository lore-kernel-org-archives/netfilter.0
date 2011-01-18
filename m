From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Best way to kill a live TCP connection?
Date: Tue, 18 Jan 2011 19:45:28 +0100
Message-ID: <4D35DFC8.7000302@freemail.hu>
References: <4D2C4E92.6040902@tana.it> <alpine.LNX.2.01.1101111537180.8612@obet.zrqbmnf.qr> <4D2C8374.70408@tana.it> <4D2C95ED.70805@plouf.fr.eu.org> <4D2CC740.9090007@riverviewtech.net> <4D35D2D2.3020201@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D35D2D2.3020201@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Alessandro Vesely <vesely@tana.it>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Do you know the conntrack tool?

conntrack -D...


2011-01-18 18:50 keltez=E9ssel, Alessandro Vesely =EDrta:
> Having tried it, it's rather tricky.  The behavior depends on when th=
e
> connection is deleted.  For example, with
>
>     # input rule meant to drop incoming packets
>     iptables -A INPUT -m conntrack --ctstate NEW -p tcp ! --syn\
>        -j DROP
> and
>     # output rule to reset connections to the local server
>     iptables -A OUTPUT -m conntrack --ctstate NEW -p tcp ! --syn\
>        -j REJECT --reject-with tcp-reset
I do not think that the outgoing packets will be sent without a SYN...=20
But you may check it.
> the connection is most likely deleted after the local server has sent
> a reply but before the remote client sends a further commands.  In
> this case the server will timeout waiting for those dropped input pac=
kets.
>
> I tried removing that input rule.  That way the relevant packets are
> accepted, but server's reply packets in the OUTPUT table are marked
> ESTABLISHED again.
>
> I tried using connmark, as in
>
>     iptables -A INPUT -m conntrack --ctstate NEW -p tcp ! --syn\
>        -j CONNMARK --or-mark 8
> and
>     iptables -A OUTPUT -m connmark --mark 8/8 -p tcp ! --syn\
>        -j REJECT --reject-with tcp-reset
>
> However, the latter rule never matched.  Is it the wrong table?
>
Do you have more connmark rules? Maybe something interferencing whit=20
these rules...

Swifty
