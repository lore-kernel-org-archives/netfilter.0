From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Possibilities and performance of conntrackd, NATing cluster
Date: Tue, 16 Sep 2008 13:42:34 -0500
Message-ID: <48CFFE1A.2070205@riverviewtech.net>
References: <fc69e1200809160716u3ce5a9e2wce6b0035b4f58cc3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fc69e1200809160716u3ce5a9e2wce6b0035b4f58cc3@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/16/08 09:16, icovnik wrote:
> I'd like to create high available and high performance router 
> cluster. Currently I use 1 router performing NAT running on 2.6 
> kernel. The router slowly reaches its capacity limit, so I'd like to 
> add another router (or two) and create a cluster from those routers. 
> I came accross conntrack-tools which seems to offer some 
> possibilities here - simply synchronize all router's stacks and 
> distribute traffic to all routers. Each router would know everything 
> about each connection, so each of them would "know" what to do witch 
> each packet. I would simply distribute the traffic to all routers and 
> they would do the job.
> 
> I saw this functionality in Checkpoint few years ago. Is it possible 
> to do this witch linux kernel and conntrackd? Does conntrackd do this 
> in real-time? With how many routers?

Purportedly this can be done with Linux using the help of conntrackd.

I know that you can do Active / Standby with conntrackd and I believe 
that you can do Active / Active as well.  It is my understanding that 
conntrackd broadcasts connection state on a separate network connection. 
  I believe that the routers participating in the conntrackd failover 
usually have three (or more) network cards on them, one internal and one 
external interface as well as an additional separate interface just for 
connection state information.  I /believe/ that conntrackd works by 
using multicast to advertise it's state changes to other systems that 
then decide what to do with the information.

I'm thinking that you could have three systems set up like this if you 
wanted to.  I'd expect that if you were using Active / Active you could 
have one system doing the inbound traffic and another doing outbound 
traffic with the third as a backup system in case one of the other two 
went down.

Remember that your traffic should (in an ideal world) pass through the 
same router (as far as IP is concerned) going both directions (symmetric 
routing) but is not required to.  With this in mind I'd recommend 
something like VRRP for the internal and external interfaces where one 
router is primary for the internal and outgoing interface and the other 
router is primary for the external and incoming interface.  Using VRRP 
will make things easier for upstream routers as well as down stream 
devices because even if things fail over to the other router the MAC 
address that they are communicating with will stay the same.  As an 
aside I'd recommend that you have an IP per system plus an IP for the 
logical VRRP router its self.  So if you are using three boxen plus the 
VRRP you will need four IPs per subnet to do this.

> If it is not possible, how would you solve my problem? I need to 
> route and NAT 500+ mbps in each direction. And the rate is increasing 
> :-)

Can you separate your routing from your NATing so that there is less load?

Can you do stateless NAT and / or firewalling?



Grant. . . .
