From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Chain traversal with multiple internal IP subnets.
Date: Mon, 23 Sep 2002 08:23:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8EB34B.7080401@fugmann.dhs.org>
References: <1032724445.1352.22.camel@neo.matrix.ca.>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jared Brick <jbrick@videotron.ca>
Cc: netfilter@lists.netfilter.org

Jared Brick wrote:
> Hello everybody,
> 
> However the other gateway is a Linux box with two IP addresses (it only
> acts as a gateway for two of the subnets)  using Iptables. 
I'm not sure of your setup. Do you have one network interface per ip, or 
two ip's for the same interface?

> The gateway
> itself has static routes so that it can route between the different
> subnets, including the subnet for which it has no IP address. My
> question in which chain will a packet traverse when it is traveling
> between two different internal subnets. I think it is the FORWARD chain
> but my colleague feels it would be the OUTPUT chain. I ask because I am
> having trouble routing between the internal networks.
If you hare only using one network interface, then you will have 
troubles routing between the two subnets. Please see the recent thread 
in which this was discussed:
"Internal ip exiting network on firewall external nic despight rule" 
(http://lists.netfilter.org/pipermail/netfilter/2002-September/038510.html)

> If anyone has any experience with a similar set up, any help would be
> much appreciated.
It seems to me that you do not need netfilter at all, as netfilter does 
not route packets. I recommend that you setup your linux router and make 
it work without netfilter. Then, if you want to restrict communication 
between the subnets, use netfilter.

Hope it helps.
Anders Fugmann


