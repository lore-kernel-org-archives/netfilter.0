From: "Sez" <sezmillenium@yahoo.es>
Subject: Iptables do nat with Protocol 47 or GRE
Date: Fri, 14 May 2004 12:24:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1BOZqT-0001Ro-Vu@vishnu.netfilter.org>
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

Hi people,

I have a a vpn server in my Intranet. If i want access to this server i will
pass my firewall.

The diagram is

VPN_CLIENT(W2k box) ---- router ---- (192.168.55.94 eth0) FIREWALL
(192.168.55.95 eth1)-------- (192.168.55.92)VPN_SERVER

I create all iptables rules and VPN_CLIENT can connect to server. One client
go well. But if another client try to connect he has this error
		*** error  721: Remote server don't response. ***

I see in the log file that all packets from second client was dropped. And
first client go well his connection.

Here are my important iptables rules:

iptables -t nat -A PREROUTING -s 0.0.0.0/0  -d 192.168.55.94 -p TCP --dport
1723 -j DNAT --to 192.168.55.92:1723
iptables -t nat -A PREROUTING -s 0.0.0.0/0  -d 192.168.55.94 -p GRE -j DNAT
--to 192.168.55.92

iptables -t nat -A POSTROUTING -p TCP -s 0.0.0.0/0 -d 192.168.55.92 --dport
1723 -o eth1 -j MASQUERADE
iptables -t nat -A POSTROUTING -p GRE -s 0.0.0.0/0 -d 192.168.55.92 -o eth1
-j MASQUERADE

And other rules...

I receive packet
		
	 SOURCE --> IP_VPN_CLIENT 
	DESTINATION --> 192.168.55.94

	and I forward all packets and change ip source and ip destination.
Firewall out

	SOURCE --> 192.168.55.95
	DESTINATION--> 192.168.55.92
	
I also do the same to return de packet. I change the ip source, because
VPN_SERVER has another gateway, it don't have Firewall with GATEWAY.

Don't Iptables have nat with differents gre connections??? Or have I some
errors?
Thanks!

SERGI


