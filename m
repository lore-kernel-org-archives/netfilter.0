From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: protocol 50 unreachable
Date: Wed, 01 Dec 2004 18:59:51 -0500
Message-ID: <1101945591.2032.105.camel@localhost>
References: <Pine.LNX.4.44.0412011448020.18751-100000@gollum.grajagan.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0412011448020.18751-100000@gollum.grajagan.net>
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
To: Helge Weissig <helgew@grajagan.org>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wed, 2004-12-01 at 17:51, Helge Weissig wrote:
> Sorry for the cross-post, but this problem is really nagging me. What I 
> did not put into the post below is the fact that it only occurred after a 
> reboot of my linux system due to a short power outage. Here is the routing 
> table, if that makes any difference:
> 
> Kernel IP routing table
> Destination  Gateway     Genmask         Flags Metric Ref    Use Iface
> 10.0.0.0     0.0.0.0     255.255.255.0   U     0      0        0 eth1
> xx.xx.xx.0   0.0.0.0     255.255.255.0   U     0      0        0 eth0
> 127.0.0.0    0.0.0.0     255.0.0.0       U     0      0        0 lo
> 0.0.0.0      xx.xx.xx.1  0.0.0.0         UG    0      0        0 eth0
> 
> the xx.xx.xx is the first part of my external ip address.
> 
> thanks for any advice or insight!
> h.
> 
> 
> 
> From: helgew@grajagan.org (Helge Weissig)
> Newsgroups: comp.security.firewalls
> Subject: protocol 50 unreachable
> NNTP-Posting-Host: 63.196.131.66
> Message-ID: <a1a4b233.0411301146.3c342dce@posting.google.com>
> 
> Hi,
> 
> I have been searching for information about this problem high and low
> but came up dry. Basically, I am trying to connect to a VPN server via
> ipsec from behind a NAT firewall set up on a Linux (kernel 2.4.x) box
> with iptables. I have no problem establishing the connection via port
> 500 as this is initiated by the client. However, I cannot seem to get
> protocol 50 (ESP) to work, independent of whether the ipsec tunnel is
> established or not. I have tried every incantation of iptables rules I
> could find, to no avail. When I set up tcdump on both interfaces on my
> server as well as on the client behind it, a port I have opened for
> forwarding responds as expected. If I run 'nmap -sO' from somewhere
> outside however, it will report protocol 50 as open although the
> external interface reports a 'icmp: xx.xx.xx.xx protocol 50
> unreachable' response and the two other interfaces never see the
> traffic.
> 
> Here is my current iptables configuration
> 
> $IPTABLES -P INPUT ACCEPT
> $IPTABLES -F INPUT 
> $IPTABLES -P OUTPUT ACCEPT
> $IPTABLES -F OUTPUT 
> $IPTABLES -P FORWARD DROP
> $IPTABLES -F FORWARD 
> $IPTABLES -t nat -F
> 
> echo "Enabling PORTFW Redirection on the external LAN.."
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p esp -j ACCEPT
> $IPTABLES -A PREROUTING -t nat -d $VPN_SERVER -p esp -j DNAT \
>  --to-destination $VPN_CLIENT
> 
> echo "   FWD: Allow all connections OUT and only existing and related
> ones IN"
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state \
>  --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> $IPTABLES -A FORWARD -j LOG
> 
> echo "   Enabling SNAT (MASQUERADE) functionality on $EXTIF"
> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
> 
> here is the tcpdump info I see on $EXTIF:
> 
> 10:23:09.234937 (vpn server ip) > (my ip): ESP(spi=0x00000000,seq=0x0)
> 10:23:09.235055 (my ip) > (vpn server ip): icmp: (my ip) protocol 50
> unreachable [tos 0xc0]
> 
> (these are empty packets sent by nmap but it looks the same for legit
> ones coming from the vpn server ip). FWIW, when the ipsec tunnel is
> established and I try to ping the a host behind the vpn server, I see
> the outgoing packets on all three interfaces, but not response.
> 
> thanks for any information or pointers in advance!
> h.
Silly question but, since the problem started after a reboot, are you
sure that ESP is running on your client? Are you using *swan or the
native 2.6 IPSec implementation on the client?
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


