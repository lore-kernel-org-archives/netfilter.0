From: Cestonaro Thilo <C.Thilo@gmx.de>
Subject: forwarding Ports via VPN ??
Date: Tue, 23 Mar 2004 19:44:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080067446.2018.12.camel@ErrorL>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hey,

i have a vpn established and working via a Linux (Debian) Box and a
Windows with openvpn. 
The tap devices have the following ips:
linux 192.168.200.201
windows 192.168.200.202

My intern network address at linux net is 
192.168.1.0/24
and under windows it's
192.168.0.0/24

now my question:
I want to forward the ports 2005 2006 7064 from the Linux net into the
Windows net ( enough when the packets appear at the vpn endpoint in
Windows net)
I get at the Linux VPN box the packets via eth0 
these packets are send to 255.255.255.255:2005 for example.
Now I want them to go into the tap0 dev and appear at the windows box.

I tried following rules for iptable at the linux box:

iptables -A INPUT -i tap0 -j ACCEPT
iptables -A OUTPUT -o tap0 -j ACCEPT

iptables -t nat -A PREROUTING -p udp -i eth0 --dport 2005 -j DNAT --to
192.168.200.202:2005
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 2005 -j DNAT --to
192.168.200.202:2005
iptables -t nat -A PREROUTING -p udp -i eth0 --dport 2006 -j DNAT --to
192.168.200.202:2006
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 2006 -j DNAT --to
192.168.200.202:2006
iptables -t nat -A PREROUTING -p udp -i eth0 --dport 7064 -j DNAT --to
192.168.200.202:7064
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 7064 -j DNAT --to
192.168.200.202:7064

iptables -A FORWARD -p udp -i eth0 --dport 2005 -j ACCEPT
iptables -A FORWARD -p tcp -i eth0 --dport 2005 -j ACCEPT
iptables -A FORWARD -p udp -i eth0 --dport 2006 -j ACCEPT
iptables -A FORWARD -p tcp -i eth0 --dport 2006 -j ACCEPT
iptables -A FORWARD -p udp -i eth0 --dport 7064 -j ACCEPT
iptables -A FORWARD -p tcp -i eth0 --dport 7064 -j ACCEPT


Could anyone say why this is not working?
I looked at the tap0 dev for outgoing packets with "iptraf -i tap0 -u".
But there are nor outgoing neither incoming packets :(

Ciao Thilo


