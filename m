From: <peter.gehle@sbgit.com>
Subject: Re-5: Still having problems with forwarding
Date: 15 Mar 2004 10:44:51 UT
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DIIE.000000E900002A78@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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


> > > Since i have made some changes i don't get an connection to my VPN Server,
> > > it seems that iptables don't forwards the vpn tunnel to my internet vpn
> > > server.

Now i have changed my script for the VPN connection like this:
// $LAN_IP = Is my internal LAN IP of my Firewall

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 1723 -j DNAT --to-destination 192.168.1.2
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 1723 -j LOG --log-prefix "VPN 1723 prerouting "

iptables -t nat -A POSTROUTING -o eth1 -p tcp --dport 1723 -j SNAT --to-source $LAN_IP
iptables -t nat -A POSTROUTING -o eth1 -p tcp --dport 1723 -j LOG --log-prefix "VPN 1723 postouting "

iptables -A FORWARD -i eth0 -m state --state NEW -p tcp -d 192.168.1.2 --dport 1723 -j ACCEPT
iptables -A FORWARD -i eth0 -m state --state NEW -p tcp -d 192.168.1.2 LOG --log-prefix "VPN 1723 forward "


iptables -t nat -A PREROUTING -i eth0 -p 47 -j DNAT --to-destination 192.168.1.2
iptables -t nat -A PREROUTING -i eth0 -p 47 -j LOG --log-prefix "VPN GRE forward "

iptables -t nat -A POSTROUTING -o eth1 -p 47 -j SNAT --to-source $LAN_IP
iptables -t nat -A POSTROUTING -o eth1 -p 47 -j LOG --log-prefix "VPN GRE forward "

iptables -A FORWARD -i eth0 -m state --state NEW -p 47 -d 192.168.1.2 -j ACCEPT
iptables -A FORWARD -i eth0 -m state --state NEW -p 47 -d 192.168.1.2 -j LOG --log-prefix "VPN GRE forward "


iptables -t nat -A PREROUTING -i eth0 -p 37 -j DNAT --to-destination 192.168.1.2
iptables -t nat -A PREROUTING -i eth0 -p 37 -j LOG --log-prefix "VPN 37 forward "

iptables -t nat -A POSTROUTING -o eth1 -p 37 -j SNAT --to-source $LAN_IP
iptables -t nat -A POSTROUTING -o eth1 -p 37 -j LOG --log-prefix "VPN 37 forward "

iptables -A FORWARD -i eth0 -m state --state NEW -p 37 -d 192.168.1.2 -j ACCEPT
iptables -A FORWARD -i eth0 -m state --state NEW -p 37 -d 192.168.1.2 -j LOG --log-prefix "VPN 37 forward "

The logging works, this stay in the syslog after i tried to connect:605  Mar 15 10:37:54 fw-sbg kernel: VPN 1723 PREROUTINGIN=eth0 OUT= MAC=00:10:4b:3e:5f:4a:00:a0:57:05:70:c9:08:00 SRC=217.229.106.108 DST=10.0.0.2 LEN=48 TOS=0x00 PREC=0x00 TTL=125 ID=46158 DF PROTO=TCP SPT=2919 DPT=1723 WINDOW=65535 RES=0x00 SYN URGP=0


With this script i get connected to the VPN Server (i see it at the vpn server) but the server can't answer
to my client? 
Whats wrong?

Thanx Peter








To: Antony@Soft-Solutions.co.uk
Cc: netfilter@lists.netfilter.org


