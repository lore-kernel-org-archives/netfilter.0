From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Brouting VNC
Date: Tue, 04 May 2010 11:02:21 -0500
Message-ID: <4BE0450D.4030701@riverviewtech.net>
References: <003601caeb9e$35bb2de0$a13189a0$@info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <003601caeb9e$35bb2de0$a13189a0$@info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/04/10 10:26, Pavel Mikulka wrote:
> I have topology with virtual machines running on KVM like this:
> 
> eth0 (ip 1.1.1.1)
> eth1 --\
> 	  > --> bond0 (ip 1.1.1.2) --> br0 --> Virtual Machine with ip 1.1.1.3
> eth2 --/

Hum...

I'm (mis)interpreting that to be that you have 1.1.1.1 on eth0 and 
1.1.1.2 & 1.1.1.3 on bond0.  Thus, you have the same IP subnet on two 
(or more) network interfaces (as reported by the output of ifconfig).

Can I see the output of brctl?  (So that I'm clear on your topology.)

> I would have a RDP available from outside at the ip address of virtual 
> machine. I try to configure ebtables/iptables to redirect VNC from ebtables 
> to iptables and then to ip address of host 1.1.1.1(or localhost) with no 
> luck. 

If you have the IP networking / routing set up properly, you shouldn't 
need to do any redirecting (NATing).

> ebtables -t broute -A BROUTING -i bond0 -p IPv4 --ip-protocol 6 --ip-destination-port 5900 -j redirect --redirect-target DROP

Just to confirm, you are wanting to cause the EBTables BROUTING chain to 
DROP TCP traffic destined to port 5900 to be routed by the kernel, 
rather than bridged?

> iptables -t nat -A PREROUTING -p tcp  -d 1.1.1.3 --dport 5900 -j DNAT --to 1.1.1.1:5900

This looks like a basic DNATing (a.k.a. port forwarding) rule for 
traffic that was going to 1.1.1.3:5900 to be redirected to 1.1.1.1:5900.

> Any help will be appreciated. Thanks

I feel like you have a duplicate IP subnet that is causing problems for you.

Are you sure that you don't want eth0 to be included in your bridge 
(br0) too?  -  Doing that will prevent a duplicate subnet problem and 
allow IPTables (layer 3) to function like you are expecting it to.



Grant. . . .
