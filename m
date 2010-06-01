From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables rules in comparable form
Date: Tue, 1 Jun 2010 13:56:37 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006011353310.22291@obet.zrqbmnf.qr>
References: <20100601081053.GA13943@q.uh.cz> <alpine.LSU.2.01.1006011043190.3431@obet.zrqbmnf.qr> <4C04D07F.6040702@chello.at> <20100601112552.GA15745@q.uh.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100601112552.GA15745@q.uh.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Radek Kanovsky <rk@dat.cz>
Cc: netfilter@vger.kernel.org


On Tuesday 2010-06-01 13:25, Radek Kanovsky wrote:
>
>Whole iptables ruleset is represented by few files in /etc. Some of th=
em
>are generated, some of them are hand written. I am able to feed /etc
>rules to iptables-restore or execute them as shell script. This is
>trivial. Although iptables-restore is faster than executing iptables i=
n
>shell script, it is still very slow sometimes.
>
>Changes in /etc ruleset are small but frequent. But primarily both
>solutions reset couters if used and it is not good for me now. So I
>ended with script that does incremental updates.

How slow are we talking about? restore is never slower than
iptables=C2=A0- ever, because, like iptables, it does one table replace
operation per invocation of either binary. Your "incremental update"
is in fact none, because tables are always replaced wholesome.

