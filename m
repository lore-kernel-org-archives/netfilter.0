From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: routing within same nic card
Date: Tue, 31 May 2005 01:31:13 -0500
Message-ID: <429C04B1.60208@riverviewtech.net>
References: <000a01c565a0$867deee0$d40aa8c0@winxp>	<429BFAE6.90200@riverviewtech.net>
	<00ca01c565a7$759eeaa0$d40aa8c0@winxp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00ca01c565a7$759eeaa0$d40aa8c0@winxp>
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
To: netfilter@lists.netfilter.org

> Presently I have 2 NIC cards;
> eth1 = 212.119.xxx.98/30  directly connected to internet
> eth0 = 212.119.xxx.105/29 connected to LAN, with this setup everything 
> is working fine
> 
> now I need to add another network, since I cannot Add another NIC card, 
> my solution is like this
> eth1 = 212.119.xxx.98/30 directly connected to internet
> eth0 = 212.119.xxx.105/29 connected to LAN1
> eth0:1 = 192.168.3.0/26 connected to LAN2

This seems reasonable enough.

> I already done the 3 lines below
> sysctl -w net.ipv4.ip_forward=1
> iptables -A FORWARD  -s 192.168.3.0/26 -d 212.119.xxx.104/29 -j ACCEPT
> iptables -A FORWARD  -s 212.119.xxx.104/29 -d 192.168.3.0/26 -j ACCEPT

This should also work as it allows traffic between the 192.168.3.0/26 212.119.xxx.104/29 networks.  I would need to see the contents of your nat table POSTROUTING chain to make sure that you would not be NATing traffic that you would not want.  Other than that I don't think you would have any problems.  Seeing as how you are not filtering based on interface I don't think you will have any issues with it.



Grant. . . .

