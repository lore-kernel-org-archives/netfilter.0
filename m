From: Pedro Werneck <pedro.werneck@terra.com.br>
Subject: WAN DHCP for machines in LAN
Date: Mon, 13 Nov 2006 15:25:13 -0200
Message-ID: <20061113152513.5dc94410.pedro.werneck@terra.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org


Hi all


I have here a small network with a linux box working as router and
production too... I use a cable modem ISP with DHCP and have 4 IPs
available. Everything on the LAN is static, no DHCP; some machines and
the router itself runs virtual machines (VMware) too.


Currently I use only one of the IPs, with the router box, sharing it to
the LAN, but I want some machines on the LAN to have access to the ISP
ips, as well as virtual machines (VMware) running on the router box.


I have the same setup working fine with Windows and a linksys router
somewhere else, and just for testing I did it with a Windows VM on a
Windows box, so I guess there's no problem in doing the same with Linux.

But, it doesn't work... with tcpdump I can see DHCP packets can't get
past the gateway interface on the router box. It seems obvious it's
something wrong with routing, but the setup is something so simple I
really can't figure what's wrong with it.

These are the routes, where eth0 goes to the LAN, eth1 to the modem and
vmnet8 the virtual device used by the VM on the router box.

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
localnet        *               255.255.255.0   U     0      0        0 eth0
172.16.79.0     *               255.255.255.0   U     0      0        0 vmnet8
201.37.168.0    *               255.255.248.0   U     0      0        0 eth1
loopback        *               255.0.0.0       U     0      0        0 lo
default         c925a801.virtua 0.0.0.0         UG    0      0        0 eth1


On iptables, for testing, all policies set to accept, and the relevant
parts are:

iptables -A INPUT -j ACCEPT -s 192.168.1.0/24
iptables -A INPUT -j ACCEPT -i eth1 -m state --state ESTABLISHED,RELATED
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE
iptables -A FORWARD -j ACCEPT -i eth1
iptables -A FORWARD -j ACCEPT -s 192.168.1.0/24


Any ideas on what is wrong, missing or what can I do to help find the
problem ?


Thanks for your time... 

-- 
Pedro Werneck

