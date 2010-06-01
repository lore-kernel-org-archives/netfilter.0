From: Radek Kanovsky <rk@dat.cz>
Subject: Re: iptables rules in comparable form
Date: Tue, 1 Jun 2010 20:01:06 +0200
Message-ID: <20100601180106.GA19088@q.uh.cz>
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

> >Changes in /etc ruleset are small but frequent. But primarily both
> >solutions reset couters if used and it is not good for me now. So I
> >ended with script that does incremental updates.
>=20
> How slow are we talking about? restore is never slower than
> iptables=A0- ever, because, like iptables, it does one table replace
> operation per invocation of either binary. Your "incremental update"
> is in fact none, because tables are always replaced wholesome.

I take counters snapshot every minute for accounting. I can modify my
system a such way that changes are made immediately after this snapshot
phase via iptables-restore with reseting all counters in time very clos=
e
to the last read minimizing outage in accounting. But I can't rely on i=
t
if restore phase takes from 1 seconds to 2 minutes. It would lead to
totally unreliable accounting data and more complicated system. Thats
why I came with incremental updates that doesn't touch unchanged rules.

Regards

Radek Kanovsky
