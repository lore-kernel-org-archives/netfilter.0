From: Radek Kanovsky <rk@dat.cz>
Subject: Re: iptables rules in comparable form
Date: Tue, 1 Jun 2010 18:03:37 +0200
Message-ID: <20100601160337.GB15745@q.uh.cz>
References: <20100601081053.GA13943@q.uh.cz> <alpine.LSU.2.01.1006011043190.3431@obet.zrqbmnf.qr> <4C04D07F.6040702@chello.at> <20100601112552.GA15745@q.uh.cz> <alpine.LSU.2.01.1006011353310.22291@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.01.1006011353310.22291@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Tue, Jun 01, 2010 at 01:56:37PM +0200, Jan Engelhardt wrote:

> >Whole iptables ruleset is represented by few files in /etc. Some of =
them
> >are generated, some of them are hand written. I am able to feed /etc
> >rules to iptables-restore or execute them as shell script. This is
> >trivial. Although iptables-restore is faster than executing iptables=
 in
> >shell script, it is still very slow sometimes.
> >
> >Changes in /etc ruleset are small but frequent. But primarily both
> >solutions reset couters if used and it is not good for me now. So I
> >ended with script that does incremental updates.
>=20
> How slow are we talking about? restore is never slower than
> iptables=A0- ever, because, like iptables, it does one table replace
> operation per invocation of either binary. Your "incremental update"
> is in fact none, because tables are always replaced wholesome.

I know that iptables-restore with 10000 rules on input is faster than
10000 sequential "iptables -A ..." rules. It is obvious. But anyway it
is sometimes slower than my one "iptables -D" command followed by one
"iptables -A" command that both together reflect one particular change
in ruleset that I am able to recognize with rule comparison. Especially
under higher load. Reason is not obvious. I was forced also implement m=
y
own locking and memoization around iptables-save that prevents its
concurrent invocation from accounting process. The accounting is simple=
 -
it transfers output to accounting machinge. That caused troubles in the
past when I used to see hanging iptables-save/-restore processes. Maybe
some locking issues? It is hard to reproduce or debug for me. We use
Debian Etch and Lenny mainly without any kernel or netfilter customizat=
ion.

I wanted to discuss this theme before I will start to prepare increment=
al
updates for tc configuration. It is even worse as restart takes routine=
ly
1 or 2 minutes and there is no tc-restore mechanism and tc output
is totally different from its input.

Also note that my problem is not performance of packet filtering.
It is OK.

Regards

Radek Kanovsky
