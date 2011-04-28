From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: AW: Best practice: Check --syn in PREROUTING with DNAT
Date: Thu, 28 Apr 2011 17:38:26 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104281730290.22058@obet.zrqbmnf.qr>
References: <9F69795E29C890408AC2DAF646C89BB3799D4F7DC3@MAILBOX.arc.local> <alpine.LNX.2.01.1104281631010.7072@obet.zrqbmnf.qr> <9F69795E29C890408AC2DAF646C89BB3799D4F7DE4@MAILBOX.arc.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9F69795E29C890408AC2DAF646C89BB3799D4F7DE4@MAILBOX.arc.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fiedler Roman <Roman.Fiedler@ait.ac.at>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On Thursday 2011-04-28 16:52, Fiedler Roman wrote:
>> >Is there a significant benefit when checking correct TCP flags in
>> PREROUTING, e.g. with
>> >
>> >Iptables -t nat -A PREROUTING --destination a.b.c.d -p tcp -m tcp --dport 80
>> --syn -j DNAT --to-destination w.x.y.z
>> 
>> It would restrict "NEW" tcp connections to begin with SYN and would not
>> consider translating connections that get picked up after a flush of
>> the CT table, for example.
>
>So it is decided in PREROUTING if a connection is new or not?

nf_ct initial classification is hooked to NF_INET_PRE_ROUTING |
NF_INET_LOCAL_OUT at priority before nf_nat.

>Using DNAT one
>can change an INVALID?? state connection to state NEW, perhaps even when
>natting to the same destination address?

No. You need a non-NULL ct to be able to apply any tuple transformation,
but INVALID is equal to ct==NULL.

>And is the CPU overhead for this PREROUTING action relevant? After a
>flush, in steady-state worst case, the firewall should have to track
>2x the connections before the flush (the packets for the broken
>conns and all clients could open up the same amount of conns as
>before flush),

Flushing the list of NFCT connections does not change the state
of the TCP/SCTP connections; nor will it mean more work for NFCT.

>so n packets per connection (x*ACK PSH, y*FIN, z*RST) will traverse
>DNAT, correct?

The nat table (iptable_nat.ko) is a _configuration database_ (of
sorts). The nf_nat.ko module still processes *all* packets - as such,
the amount of work does not change (see above).

>> >... --destination w.x.y.z -p tcp -m tcp --dport 80 --syn -j ACCEPT
>> >... drop/reject with logging
>> 
>> -m state should ideally be -m conntrack.
>
>I checked the manpage, but I'm not sure what to use. From
>documentation, the -m conntrack --ctstate should also check virtual
>states, but is -m --state ESTABLISHED really different from -m
>conntrack --ctstate ESTABLISHED? If there is a significant
>difference (e.g one is deprecated or might allow access restriction
>bypass), this should be marked out in the iptables documentation
>more clearly.

-m state recieves no more feature updates. Yes, I agree about
the documentation update and shall pursue that.

