From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Help with multiple IP networks over an ethernet one
Date: Tue, 09 Sep 2008 16:49:15 -0500
Message-ID: <48C6EF5B.3030005@riverviewtech.net>
References: <ef6cbd7b0cc8d867f0702b0494896b60.squirrel@www.arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ef6cbd7b0cc8d867f0702b0494896b60.squirrel@www.arcoscom.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/09/08 03:29, ArcosCom Linux User wrote:
> Physically there are 3 ethernet networks, one for the uplink 1, other 
> for uplink 2, and the third is for the lans and the uplink 3. I 
> forced to share the ethernet for the LANs and uplink 3.

Ok...

> The router has 4 interfaces, eth1 for uplink 1, eth2 for uplink 2, 
> eth3 for uplink 3 and eth0 for the LANs.

Just so I understand you correctly.  You have four physical ethernet 
interfaces in the system, but eth3 and eth0 are connected to the same 
ethernet network (broadcast domain)?

(Presuming that the above understanding is correct.)  Why do you have 
eth0 (LANs) and eth3 (uplink 3) connected to the same ethernet network? 
  Rather why not have them be different networks from each other?

> The problem I have is that, without a constant time or reason, 
> sometimes I detect latences between uplink 3 and the router, and 
> other times between the router and LAN hosts.

Ok...

Can we have some information about the IP addresses used for each 
network?  Do all four networks have IP addresses in different subnets / 
networks?  Can we ask what they are (sanitized if need be) for the sake 
of discussion?

> I think that I need to configure something in eth3 config files 
> (/proc/sys/net/ipv4/conf/eth3) to disallow local frames and allow 
> only the router and uplink 3 gateway comunication, but I don't found 
> anything that help me.

I can't say one way or the other for sure until I know what IP addresses 
you have where.  However as a general rule of thumb you don't need to do 
that.  I'd be wondering if you don't have a hardware resource / IRQ 
conflict depending on how much data (amount and / or size of packets).

> I tried with arp_filter, rp_filter, and many of them, but without 
> success (I don't found many documentation about it, and I review 
> lartc and googled about that parameters).
> 
> I think that only allowing arp traffic betwen eth3 and uplink 3 
> gateway (using arptables) will solve this, but I don't know if 
> arptables will be the solution or not.

With out knowing your IP addressing scheme better it's hard to say.



Grant. . . .
