From: Jared Brick <jbrick@videotron.ca>
Subject: Chain traversal with multiple internal IP subnets.
Date: 22 Sep 2002 15:54:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <18421.089629601$1032730803@news.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello everybody,

I have (for various reasons) a LAN with two gateways that internally use
three different IP subnets (don't ask). Most nodes within the LAN have a
single IP address and use one of the two gateways.

One gateway is a router with an IP address in each subnet that does no
filtering. Most hosts use this as there default gateway, and it of
course has no problem routing between the three subnets.

However the other gateway is a Linux box with two IP addresses (it only
acts as a gateway for two of the subnets)  using Iptables. The gateway
itself has static routes so that it can route between the different
subnets, including the subnet for which it has no IP address. My
question in which chain will a packet traverse when it is traveling
between two different internal subnets. I think it is the FORWARD chain
but my colleague feels it would be the OUTPUT chain. I ask because I am
having trouble routing between the internal networks.

Also note that I am well aware that connection tracking is useless in
this environment (because of the different default gateways) and all the
chains are set up before any connection tracking is going on.

If anyone has any experience with a similar set up, any help would be
much appreciated.

Thanks,

Jared



