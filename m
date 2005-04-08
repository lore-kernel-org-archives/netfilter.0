From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Linux firewall + NAT Traversal + IPsec
Date: Fri, 8 Apr 2005 14:39:08 +0200
Message-ID: <200504081239.j38Cd8Gb011881@smtp26.wxs.nl>
References: <425572C6.2040007@attglobal.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425572C6.2040007@attglobal.net>
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
To: netfilter@lists.netfilter.org

 As far as I know, you would not need anything on the Linux box.

It will all depend on whether the clients and server IPSEC implementation
support IPSEC NAT T(raversal).

Microsofts IPSEC implementation does. But has some drawbacks.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of John Mok
Sent: 07 April 2005 19:50
To: netfilter@lists.netfilter.org
Subject: Linux firewall + NAT Traversal + IPsec

Hi,

I'm new to Linux. Is it possible make a Linux box with firewall + NAT, such
that client PC(s) from the NATed internal network could connect to a VPN
gateway on the Internet :-

 client PC ----- Linux iptables firewall + NAT ---- Internet ---- IPsec VPN
gateway
192.168.x.x/16                                              (e.g. 
Checkpoint FW-1)
(VPN client)

I hope someone could help to advise what software / kernel patch is required
on the Linux box to NAT traversal work and where to get the HOWTO(s)?

Thanks a lot.

John Mok




