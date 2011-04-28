From: Fiedler Roman <Roman.Fiedler@ait.ac.at>
Subject: AW: Best practice: Check --syn in PREROUTING with DNAT
Date: Thu, 28 Apr 2011 16:52:25 +0200
Message-ID: <9F69795E29C890408AC2DAF646C89BB3799D4F7DE4@MAILBOX.arc.local>
References: <9F69795E29C890408AC2DAF646C89BB3799D4F7DC3@MAILBOX.arc.local>
 <alpine.LNX.2.01.1104281631010.7072@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1104281631010.7072@obet.zrqbmnf.qr>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> Von: Jan Engelhardt [mailto:jengelh@medozas.de]
> Betreff: Re: Best practice: Check --syn in PREROUTING with DNAT
> 
> On Thursday 2011-04-28 16:18, Fiedler Roman wrote:
> 
> >Hello List,
> >
> >Is there a significant benefit when checking correct TCP flags in
> PREROUTING, e.g. with
> >
> >Iptables -t nat -A PREROUTING --destination a.b.c.d -p tcp -m tcp --dport 80
> --syn -j DNAT --to-destination w.x.y.z
> 
> It would restrict "NEW" tcp connections to begin with SYN and would not
> consider translating connections that get picked up after a flush of
> the CT table, for example.

So it is decided in PREROUTING if a connection is new or not? Using DNAT one can change an INVALID?? state connection to state NEW, perhaps even when natting to the same destination address?

And is the CPU overhead for this PREROUTING action relevant? After a flush, in steady-state worst case, the firewall should have to track 2x the connections before the flush (the packets for the broken conns and all clients could open up the same amount of conns as before flush), but 1/2 of these conns will not enter established, so n packets per connection (x*ACK PSH, y*FIN, z*RST) will traverse DNAT, correct? Could this cause load/resource problems in a setup, where the 1x normal connections were handled without any observable load?
 
> >Before accepting in INPUT rulebase:
> >
> >... -m state --state ESTABLISHED -j ACCEPT
> >... --destination w.x.y.z -p tcp -m tcp --dport 80 --syn -j ACCEPT
> >... drop/reject with logging
> 
> -m state should ideally be -m conntrack.

I checked the manpage, but I'm not sure what to use. From documentation, the -m conntrack --ctstate should also check virtual states, but is -m --state ESTABLISHED really different from -m conntrack --ctstate ESTABLISHED? If there is a significant difference (e.g  one is deprecated or might allow access restriction bypass), this should be marked out in the iptables documentation more clearly.
