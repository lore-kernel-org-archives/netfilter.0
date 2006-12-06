From: Danny <dineshg@hostway.com>
Subject: Re: Multihoming problem
Date: Wed, 06 Dec 2006 11:52:08 +0530
Message-ID: <45766190.8040607@hostway.com>
References: <b06b831a0612051527p15895c7yd0b1d9bb813c4105@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b06b831a0612051527p15895c7yd0b1d9bb813c4105@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Javier A Toledano <jatoledano@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi,

Well, I have  done this !
What does route -n say ?

You would just need one iptable rule for masquerading outgoing requests 
through eth1. Do you have anything else ?

At 10.0.0.X host, do route -n : [ from where you are not able to ping to 
192.168.0.X ]


- Danny

Javier A Toledano wrote:
> Hello To everyone:
>
> I've setup a linux box with 3 ethernet cards.
> One in the 10.0.0.0/8 net in the eth0,
> the other in the 192.168.10.0/24 in the eth2 and
> the other is connected to dsl modemwith with eth1.
>
> I've setup forwarding with, net.ipv4.ip_forward = 1.
> A strange phenomenon happens that I don't understantd. When I make an
> echo request from a host in the net 10.0.0.0 to a host in the
> 192.168.10.0 the packet arrives to the eth0 interface but it seems
> that it doesn't traverse the linux because with tcpdump I see no icmp
> packet in eth2
> But when a make an echo request from the 192.168.10.0 to a host in
> 10.0.0.0 , I receive the echo reply and, inmediatley the echo request
> originated in 10.0.0.0 receives the echo replies from 192.168.10.0.
>
> If would appreciate any idea, Sorry for my poor English.
>
> Thanks in advance
>
>


