From: Carlo Henrico <CarloH@perago.com>
Subject: NATing
Date: Tue, 7 Mar 2006 15:48:31 +0200
Message-ID: <2C3CB727B662D511889200508B4481F603D6A0BC@PERAGO_SERVER01>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi All

I am new to all this but here goes.

I have read the docs on NAT'ing etc but am still lost.

I have a linux box with 2 NIC's, one on the public network and one on the
LAN.

The public side has a public IP address but we also have 4 more IP addresses
routed by the ISP down that line.

I would like to "reroute" the traffic from one of those IP addresses to a
web server (port 80) on the LAN.

What I have tried is :

Iptables -t nat PREROUTING -I 1.2.3.4 -j DNAT --to 5.6.7.8

Where 1.2.3.4 is the public IP address and 5.6.7.8 is the LAN address of the
web server.

Please help, what am I doing wrong?

Thanks

Carlo

