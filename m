From: Jim Sifferle <jimsiff@brownsun.net>
Subject: Problems with PPTP Server behind iptables
Date: Wed, 19 Feb 2003 14:51:10 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302192251.h1JMpAr0004988@mbuna.brownsun.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I have a Poptop PPTP server running on RH8, behind my RH8 iptables firewall.
The firewall PC DNATs ssh, smtp, http, sftp, pop3s, and pptp to the PPTP 
server.  All services work except for PPTP.  The firewall also acts as a 
FreeSWAN gateway for some LAN-to-LAN connections.  I am able to make a PPTP
connection using 2K and XP clients when the traffic isn't DNATed to the
server.  When I try to connect from outside the firewall, I get error
651.  I know this is probably a firewall configuration error, but I'm  
stumped.

I am running iptables 1.6a (stock) and fwbuilder 1.07 as my GUI tool.
My iptables is not patched for pptp conntrack, because I read in the VPN
Masq HOWTO that it was only necessary for outbound client connections.
Is this correct or not?  I originally was monitoring state on all inbound 
connections, but I have it turned off for testing.  Still no change.  
I also simplified my NAT rules as a test, but that didn't help either 
so I put it back the way it was before.  

Any help would be appreciated... I'm sure it's something obvious, but
I'm presently clueless.

Thanks,

Jim

 
Here's the relevant iptables rules:

# Inbound DNAT rule for services forwarded to server.
# Traffic from trusted FreeSWAN LANs are not DNATed.

$IPTABLES -t nat -N ntmp000
$IPTABLES -t nat -A PREROUTING  -p tcp -m multiport   -d $EXTIP
--destination-ports 22,25,80,115,995,1723 -j ntmp000
$IPTABLES -t nat -A PREROUTING  -p 47   -d $EXTIP -j ntmp000
$IPTABLES -t nat -A ntmp000   -s $TRUST1 -j RETURN
$IPTABLES -t nat -A ntmp000   -s $TRUST2 -j RETURN
$IPTABLES -t nat -A ntmp000   -s $TRUST3 -j RETURN
$IPTABLES -t nat -A ntmp000   -s $TRUST4 -j RETURN
$IPTABLES -t nat -A ntmp000   -s $TRUST5 -j RETURN
$IPTABLES -t nat -A ntmp000   -s $TRUST6 -j RETURN
$IPTABLES -t nat -A ntmp000   -s $TRUST7 -j RETURN
$IPTABLES -t nat -A ntmp000   -s $TRUST8 -j RETURN
$IPTABLES -t nat -A ntmp000   -s $TRUST9 -j RETURN
$IPTABLES -t nat -A ntmp000  -p tcp -m multiport   --destination-ports
22,25,80,115,995,1723 -j DNAT --to-destination $SERVER
$IPTABLES -t nat -A ntmp000  -p 47   -j DNAT --to-destination $SERVER

# Forward and Output Rules allowing DNATed services to the server

$IPTABLES -A OUTPUT -p tcp -m multiport  -d $SERVER --destination-ports
22,25,80,115,995,1723 -j ACCEPT
$IPTABLES -A OUTPUT -p 47  -d $SERVER -j ACCEPT
$IPTABLES -A FORWARD -p tcp -m multiport  -d $SERVER --destination-ports
22,25,80,115,995,1723 -j ACCEPT
$IPTABLES -A FORWARD -p 47  -d $SERVER -j ACCEPT

# Outbound SNAT Rule for traffic from Internal LAN (includes server)
# Traffic to trusted FreeSWAN LANs are not SNATed

$IPTABLES -t nat -N ntmp001
$IPTABLES -t nat -A POSTROUTING -o eth0  -s $INTLAN -j ntmp001
$IPTABLES -t nat -A ntmp001   -d $TRUST1 -j RETURN
$IPTABLES -t nat -A ntmp001   -d $TRUST2 -j RETURN
$IPTABLES -t nat -A ntmp001   -d $TRUST3 -j RETURN
$IPTABLES -t nat -A ntmp001   -d $TRUST4 -j RETURN
$IPTABLES -t nat -A ntmp001   -d $TRUST5 -j RETURN
$IPTABLES -t nat -A ntmp001   -d $TRUST6 -j RETURN
$IPTABLES -t nat -A ntmp001   -d $TRUST7 -j RETURN
$IPTABLES -t nat -A ntmp001   -d $TRUST8 -j RETURN
$IPTABLES -t nat -A ntmp001   -d $TRUST9 -j RETURN
$IPTABLES -t nat -A ntmp001 -o eth0  -j SNAT --to-source $EXTIP

I also allow all traffic from $INTLAN to anywhere.

If I run tcpdump on the PPTP server to watch a new connection, I see the
tcp handshake to start the control connection, then after 4 packets back
and forth, the server sends a tcp reset packet and the connection ends
with an error 651 on the client.  I'm not sure if the server isn't
liking the DNATed packets or what because the same client can connect
just fine if it's on the LAN.  Here's tcpdump output for a connection
attempt by an XP client PC.  I didn't do tcpdump -n so I replaced the
hostname with client and server to make things more readable.

11:40:08.934886 client.2327 > server.1723: S 859303937:859303937(0) win
7560 <mss 1260,nop,nop,sackOK> (DF)
11:40:08.934993 server.1723 > client.2327: S 2642678970:2642678970(0)
ack 859303938 win 5840 <mss 1460,nop,nop,sackOK> (DF)
11:40:09.110352 client.2327 > server.1723: P 1:157(156) ack 1 win 7560
(DF)
11:40:09.110495 server.1723 > client.2327: . ack 157 win 5840 (DF)
11:40:09.111276 server.1723 > client.2327: R 1:1(0) ack 157 win 5840
(DF)




