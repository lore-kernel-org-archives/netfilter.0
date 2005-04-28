From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: How to stop the flood?
Date: Thu, 28 Apr 2005 15:16:20 -0500
Message-ID: <42714494.9080008@riverviewtech.net>
References: <007501c54bf7$1c0f0980$3b3429c4@rp>	<20050428141623.GA29844@bender.817west.com>
	<00c701c54c01$3ba1b9a0$3b3429c4@rp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00c701c54c01$3ba1b9a0$3b3429c4@rp>
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
To: Rikunj <rikunj@raha.com>
Cc: netfilter@lists.netfilter.org

> This was the log from one of my client who was attacked from a client on
> other subnet.

How many different subnets are you serving?  What interfaces are they on on your router?  Do you have each client on a different subnet, or are there multiple clients on one subnet?  What type of network setup do you have, both physical and logical?

> My network consist of clients from different subnets of /24.

Are these /24 subnets independently controlled by your clients such that you don't have any control on them sort of saying stop or you will stop their internet access?

> The attacks from one subnet travels through my linux router and hits the
> client on other subnet.

Assuming that each of your clients is on a different subnet and they are connected to an aliased interface on your router you could very easily set up your firewall script to filter based on inbound and outbound interface.  This also assumes that one client of yours will never need to communicate with another directly.  If one client needs to communicate with another directly you will need to explicitly allow the traffic to pass through your router.

(This is presuming that your FORWARD policy is set to DROP which IMHO it should *ALWAYS* be.)
# Client_1
iptables -t filter -A FORWARD -i $Client_1 -o $INet -s $Client_1_Subnet -j ACCEPT
iptables -t filter -A FORWARD -i $INet -o $Client_1 -d $Client_1_Subnet -j ACCEPT
# Client_2
iptables -t filter -A FORWARD -i $Client_2 -o $INet -s $Client_2_Subnet -j ACCEPT
iptables -t filter -A FORWARD -i $INet -o $Client_2 -d $Client_2_Subnet -j ACCEPT
# Client_3
iptables -t filter -A FORWARD -i $Client_3 -o $INet -s $Client_3_Subnet -j ACCEPT
iptables -t filter -A FORWARD -i $INet -o $Client_3 -d $Client_3_Subnet -j ACCEPT

(This is presuming that your FORWARD policy is set to ACCEPT which IMHO it should *NEVER* be.)
# Client_1
iptables -t filter -A FORWARD -i $Client_1 -o ! $INet -s $Client_1_Subnet -j DROP
iptables -t filter -A FORWARD -i ! $INet -o $Client_1 -d $Client_1_Subnet -j DROP
# Client_2
iptables -t filter -A FORWARD -i $Client_2 -o ! $INet -s $Client_2_Subnet -j DROP
iptables -t filter -A FORWARD -i ! $INet -o $Client_2 -d $Client_2_Subnet -j DROP
# Client_3
iptables -t filter -A FORWARD -i $Client_3 -o ! $INet -s $Client_3_Subnet -j DROP
iptables -t filter -A FORWARD -i ! $INet -o $Client_3 -d $Client_3_Subnet -j DROP

(Any one care to double check my logic?  Please?)

> I tried few rules as below but seems not to be working.

Your rules look like they are designed to do more quality assurance (making sure the traffic is not blatantly invalid) on any traffic passing through the FORWARD chain than filtering based on the source and destination address and interface.



Grant. . . .

