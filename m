From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: Status of iptables target support in ipset
Date: Thu, 8 Nov 2012 01:47:25 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1211080132070.10271@aurora.sdinet.de>
References: <CABpXQ7aX_LtYxP5UCo454-V9yu07kc8BpUBesCWy-4V_2ZqRvw@mail.gmail.com> <509A31E1.8030703@ngtech.co.il> <alpine.DEB.2.00.1211072149480.3544@blackhole.kfki.hu> <509ACD9D.4060102@ngtech.co.il> <alpine.DEB.2.00.1211072238330.3863@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1211072238330.3863@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Eliezer Croitoru <eliezer@ngtech.co.il>, =?ISO-8859-15?Q?=22Csord=E1s_Csaba_Ifj=2E=22?= <cscsordas@gmail.com>, netfilter@vger.kernel.org

On Wed, 7 Nov 2012, Jozsef Kadlecsik wrote:

> On Wed, 7 Nov 2012, Eliezer Croitoru wrote:
> 
> > On 11/7/2012 10:51 PM, Jozsef Kadlecsik wrote:
> > > No, the idea is to add targets per set entry. I.e.
> > > 
> > > ipset add foo 192.168.1.1 -t filter -A FORWARD -j LOG --log-prefix foo
> > > ipset add foo 192.168.1.2 -t filter -A FORWARD -j LOG --log-prefix bar
> > > 
> > hoo now I understand.
> > but ipset was meant to be a "set match", no?
> > In iptables it's a module that match a rule if it matches a set...
> > it's kind of confusing from iptables idea point of view for me.
> 
> The SET target then would be extended as a "match and return the result of 
> the target(s) belonging to the element":
> 
> iptables -A FORWARD -j SET --match-set foo dst

Sounds very interesting to me!

We currently have long chains with in principle:

	-d a.b.c.d -j MARK --set-mark 0x4711
	-d a.b.c.e -j MARK --set-mark 0x4712
and in a seperate chain
	-s a.b.c.d -j MARK --set-mark 0x4711
	-s a.b.c.e -j MARK --set-mark 0x4712

sorting users into tc shaping queues, one queue per user to limit him to 
his personal bandwidth limit (limit not shared with other users). With 
sometimes 200-400 users it hurts quite a bit. Creating sub-chains helped,
but it is still bad, and did not make the iptables-restore input 
generating easier.

An ipset support with targets sounds very nice!

Looking forward to it,

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
