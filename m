From: John Duke <johnyduke@yahoo.com>
Subject: Transparent broadband network connectivity (Internet PnP)
Date: Thu, 13 Mar 2003 11:04:42 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.2.20030313105124.022b25a8@216.136.173.10>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,

Can someone let me know if current netfilter can allow clients inside
Internal network (can be any different ip) access Internet? There are some
commercial products such as Reliaware
(http://www.demarctech.com/products/reliawave-rwh/reliawave-ipnpsg.html)
(see Address Translate Function section), WayPort (http://www.wayport.net),
IP PnP (http://www.infino.co.kr/infino/eng/softpackage_e.php) provide that
feature but I'm looking for an opensource solution.

The main point of this system is that the client just only need to plug
into the net then he can surf internet without changing his ip
configuration. So clients inside internal network can have any IP address
(different subnet, netmask, gateway, dns ... and even thought clients have
the same IP)

For example

Client 1 -----------|
192.168.10.5        |
		     |	172.16.1.1  PublicIP
Client 2 -----------|	     eth0    eth1
DHCP(172.16.1.90)   |-------- [ GW ] ----- [ router ] --- Internet
		     |  DefaultGW=RouterIP
Client 3 -----------|
200.192.16.10       |
		     |
Client 4 -----------|
64.12.5.12

I can set the eth0 into proxy arp mode (net.ipv4.conf.eth0.proxy_arp = 1)
to set it as the gateway for all clients, and use iptables SNAT target
inside nat POSTROUTING chain of eth1.

iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source <eth1 ip>

When client send a packet out, the packet goes into eth0, goes through
forward chain after routing decision routine, get nat'd on eth1 then send
to the router. The problem is that when the reply packet from router goes
back eth1, after de-nat'd, the packet will be sent to the eth1 following
the default route on gateway box instead of eth0 (since client can have any
ip, so we can't set the routing table; default gateway is router's ip via
eth1).

Do anyone have idea to solve this? Do current netfilter can do it or I need
to hack some netfilter code?

Best Regards,

JD


