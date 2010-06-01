From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables rules in comparable form
Date: Tue, 1 Jun 2010 20:26:30 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006012020370.15461@obet.zrqbmnf.qr>
References: <20100601081053.GA13943@q.uh.cz> <alpine.LSU.2.01.1006011043190.3431@obet.zrqbmnf.qr> <4C04D07F.6040702@chello.at> <20100601112552.GA15745@q.uh.cz> <alpine.LSU.2.01.1006011353310.22291@obet.zrqbmnf.qr> <20100601180106.GA19088@q.uh.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100601180106.GA19088@q.uh.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Radek Kanovsky <rk@dat.cz>
Cc: netfilter@vger.kernel.org


On Tuesday 2010-06-01 20:01, Radek Kanovsky wrote:
>On Tue, Jun 01, 2010 at 01:56:37PM +0200, Jan Engelhardt wrote:
>
>> >Changes in /etc ruleset are small but frequent. But primarily both
>> >solutions reset couters if used and it is not good for me now. So I
>> >ended with script that does incremental updates.
>>=20
>> How slow are we talking about? restore is never slower than
>> iptables=C2=A0- ever, because, like iptables, it does one table repl=
ace
>> operation per invocation of either binary. Your "incremental update"
>> is in fact none, because tables are always replaced wholesome.
>
>I take counters snapshot every minute for accounting. I can modify my
>system a such way that changes are made immediately after this snapsho=
t
>phase via iptables-restore with reseting all counters in time very clo=
se
>to the last read minimizing outage in accounting. But I can't rely on =
it
>if restore phase takes from 1 seconds to 2 minutes. It would lead to
>totally unreliable accounting data and more complicated system.

Sounds like you need xt_quota2. As its counters are independent of
rules when given names, they can never get set back to a value
less than what they were.

>why I came with incremental updates that doesn't touch unchanged rules=
=2E

As I said before, there is no concept of unchanged rules.

When you iptables -A, the entire ruleset is fetched from the kernel,
then modified, and finally reinserted - even when having only
added a single rule.
