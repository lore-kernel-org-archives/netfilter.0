From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Possibilities and performance of conntrackd, NATing cluster
Date: Tue, 23 Sep 2008 15:25:43 -0500
Message-ID: <48D950C7.1000402@riverviewtech.net>
References: <fc69e1200809160716u3ce5a9e2wce6b0035b4f58cc3@mail.gmail.com>	 <48CFFE1A.2070205@riverviewtech.net> <48D0DD27.70109@netfilter.org> <fc69e1200809230305p267126cbgadfa5fb67a11296c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fc69e1200809230305p267126cbgadfa5fb67a11296c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/23/08 05:05, icovnik wrote:
> Now only to clarify that I understand it correctly:
> 
> Asymmetric setup: Any router receives any of packets. All routers 
> have the same information about all connections in cluster, so it 
> doesn't matter which of them handles which connection.
> 
> Symmetric setup: Once the connection is setup on RouterX, the whole 
> connection should be handled by that very same router.
> 
> Is this correct?

Eh, close.

Symmetric is where all the traffic passes through the same firewall 
going both inbound and outbound, much like symmetric routes.

Where as asymmetric is where traffic passes through different firewalls 
going inbound and outbound, much like asymmetric routes.

As far as which firewalls know about the connection or not depends on 
how replication is set up.  However the symmetric verses asymmetric 
firewalling still applies.

> How is it possible to have only one firewall to handle packets in 
> cluster? Is it like in the setup in the testcase 
> (http://conntrack-tools.netfilter.org/testcase.html)? If I understand 
> it correctly, it means to have only one active firewall/router and 
> one passive waiting for failure. How is ti possible to scale to 
> higher loads?

Active / passive does not scale. A/P is only meant for redundancy / 
protection against one node failing.

> Hm this is interresting - split incoming/outgoing traffic to separate 
> routers. Maybe the conntrackd can be used in this scenario. I would 
> test it.

According to Pablo's reply to my earlier post, this is apparently not a 
good idea to do.  Though it sounds like it /may/ work, with some likely 
undesired side effects.



Grant. . . .
