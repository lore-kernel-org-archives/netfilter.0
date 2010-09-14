From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Is a match-all rule with jump to empty chain processed?
Date: Tue, 14 Sep 2010 19:57:37 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009141954390.23103@obet.zrqbmnf.qr>
References: <BLU124-W223DA5F1742B40AD5E2ABBA3780@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BLU124-W223DA5F1742B40AD5E2ABBA3780@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Data Shock <datashock@hotmail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-09-14 17:14, Data Shock wrote:

>I have an optimization question regarding iptables:=C2=A0 Will a rule =
that=20
>matches all packets and jumps to a defined but empty table be=20
>processed? And if so, how much overhead is involved with jumping to an=
=20
>empty table?

Jumping to arbitrary tables is not within the design.

>-t filter -N empty_chain
>-t filter -A INPUT -j empty_chain

That is a chain, not a table. And yes, it is processed including=20
overhead, as is done in many other kernel subsystems. The kernel really=
=20
is not responsible for the user's misdeeds. not use empty chains :)


>When an override is required, like "allow all UDP destined for port=20
>1234", the cron job could run a simple "iptables -t filter -A override=
s=20
>-p udp -m udp --dport 1234 -j ACCEPT".=C2=A0 When the override was no =
longer=20
>needed, it could simply flush the overrides chain.
>
>Under normal operation the overrides chain would be empty.=C2=A0 I hat=
e to=20
>spend overhead processing the "match all jump to overrides" rule.

I'd say benchmark it before calling it a problem.
