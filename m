From: Alan Chandler <alan@chandlerfamily.org.uk>
Subject: Trying to understand a performance problem - help please.
Date: Sun, 15 Apr 2007 18:27:55 +0100
Message-ID: <200704151827.55457.alan@chandlerfamily.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I have a speed problem downloading from youtube.

I have a small lan at home, connected to the internet via a debian etch=20
based linux box which (amongst a whole range of other things) acts as a=20
route/nat gateway.

Downloading (using wget) from my desktop (another linux box - debian=20
sid) videos from youtube I get about 7Kbytes/sec

Downloading from the nat/gateway itself I get about 80kbytes/sec, more=20
than a 10 fold increase.

looking at detail at the network traffic, with downloading directly from=20
the gateway I get a smooth pattern of in-order traffic, like this ...

youtube->me =A0http continuation seq 189688 next seq 191136
youtube->me =A0http continuation seq 191136 next seq 192584
me->youtube tcp ack seq no 192584
youtube->me =A0http continuation seq 192584 next seq 194032
=2E..

looking at the traffic on the same interface when I initiate the request=20
from the desktop I get

youtube->me http cont seq 4344 next seq 5792
me->youtube tcp ack seq 5792
youtube->me http cont seq 7240 next seq 8688
me->youtube dup ack seq 5792
youtube->me http cont seq 10136 next seq 11584
me->youtube dup ack seq 5792
youtube->me http cont seq 5790 next seq 7240
me->youtube tcp ack seq 8688
youtube->me http cont seq 8688 next seq 10136


As you can see, in this case, it appears that some packets are being=20
lost and have to repeated via a dup ack.

I presume I can assume that youtube is actually sending the packets=20
since it is clear in the earlier case that it does so (and pretty=20
quickly too), so I think it might come down some reason that the=20
packets are getting dropped before wireshark sees them.

I have an IPTABLES firewall on the gateway, but I can't see why that=20
should effect things. =A0Can someone tell me

a) Whether wireshark sees the packets before they are processed by=20
IPTABLES? (I want to see if there is a possibility that they reach the=20
machine but iptables drops them)

b) is there anythink I might be doing in my firewall script that could=20
cause only some packets to be dropped.  Script follows

#!/bin/sh
#
#

INETIF=3Deth0
KANGER=3D"192.168.0.21"
POOH=3D"192.168.0.22"
RABBIT=3D"192.168.0.25"


test -x /sbin/iptables || exit 0

#set -e

#
#   Start up ensuring that the tables are all empty
#   (ignoring any errors because there is nothing there yet)
#
    iptables -F INPUT
    iptables -F OUTPUT
    iptables -F FORWARD
    iptables -t nat -F PREROUTING
    iptables -t nat -F POSTROUTING
    iptables -t mangle -F OUTPUT
    iptables -F inet-in
    iptables -X inet-in=20
    iptables -F inet-fwd=20
    iptables -X inet-fwd=20
    iptables -F from-inet
    iptables -X from-inet=20
    iptables -F to-inet
    iptables -X to-inet=20
    iptables -F i-estab
    iptables -X i-estab

#
#   This is for established communications coming in from the internet=20
just
#   so that I can get an idea what sort of packets they are.
#
    iptables -N i-estab
    iptables -A i-estab -p tcp --sport www -j ACCEPT
    iptables -A i-estab -p tcp --sport imap -j ACCEPT
    iptables -A i-estab -p tcp --sport nntp -j ACCEPT
    iptables -A i-estab -p tcp --sport domain -j ACCEPT
    iptables -A i-estab -p tcp --dport ssh -j ACCEPT
    iptables -A i-estab -p tcp --sport ftp -j ACCEPT
    iptables -A i-estab -p tcp --sport ftp-data -j ACCEPT
    iptables -A i-estab -p tcp --sport 9418 -j ACCEPT

#   Accept everything not so far accepted
    iptables -A i-estab -j ACCEPT
#
#   Route packets going out from here onto a new table so that we can do
#   things with them (logging etc)
#
    iptables -N to-inet
#
#   Just want to count a few things
#
    iptables -A to-inet -p tcp --dport www -j ACCEPT
    iptables -A to-inet -p tcp --dport imap -j ACCEPT
    iptables -A to-inet -p udp --dport domain -j ACCEPT
    iptables -A to-inet -p tcp --dport nntp -j ACCEPT
    iptables -A to-inet -p udp --dport 67:68 -j ACCEPT
    iptables -A to-inet -p tcp --dport iax -j ACCEPT
    iptables -A to-inet -p udp --dport iax -j ACCEPT
#
#    Note ICMP packets I am sending out
#=20
    iptables -A to-inet -p icmp --icmp-type destination-unreachable -j=20
ACCEPT
    iptables -A to-inet -p icmp --icmp-type source-quench -j ACCEPT
    iptables -A to-inet -p icmp --icmp-type time-exceeded -j ACCEPT
    iptables -A to-inet -p icmp --icmp-type parameter-problem -j ACCEPT
    iptables -A to-inet -p icmp --icmp-type echo-request -j ACCEPT
    iptables -A to-inet -p icmp --icmp-type echo-reply -j ACCEPT
#
#   Prevent any netbios stuff leaking out from here
#
    iptables -A to-inet -p tcp --dport netbios-ns:netbios-ssn -j LOG
    iptables -A to-inet -p tcp --dport netbios-ns:netbios-ssn -j DROP
    iptables -A to-inet -p udp --dport netbios-ns:netbios-ssn -j LOG
    iptables -A to-inet -p udp --dport netbios-ns:netbios-ssn -j DROP
#
#
#   Accept every thing else
#
    iptables -A to-inet -j ACCEPT
#
#   Now make the connection to the table
#
    iptables -A OUTPUT -o $INETIF -j to-inet
#
#   Common internet Stuff
#
    iptables -N from-inet
#
#   Stuff already established is allowed but jump to chain to count=20
things
#
    iptables -A from-inet -m state --state ESTABLISHED,RELATED -j=20
i-estab
#
#    Deal with ICMP packets
#=20
    iptables -A from-inet -p icmp --icmp-type destination-unreachable -j=20
ACCEPT
    iptables -A from-inet -p icmp --icmp-type source-quench -j ACCEPT
    iptables -A from-inet -p icmp --icmp-type time-exceeded -j ACCEPT
    iptables -A from-inet -p icmp --icmp-type parameter-problem -j=20
ACCEPT
    iptables -A from-inet -p icmp --icmp-type echo-request -j ACCEPT
#   Already accepted by related
    iptables -A from-inet -p icmp --icmp-type echo-reply -j ACCEPT
#
#   ftp-data started by mine  (already accepted in related)  =20
#
    iptables -A from-inet -m state --state NEW -p tcp --dport=20
ftp-data -j ACCEPT
#
#   Socks probes should be dropped so that IRC does not thing we are=20
screwwing them
#
    iptables -A from-inet -p tcp --dport socks -j DROP
#
#   Drop these before logging them (just collecting them to see what=20
they are)
#
    iptables -A from-inet -p tcp --dport 1635 -j DROP
    iptables -A from-inet -p tcp --dport 1370 -j DROP
#
#   seem to get these during boot - I don't think they matter
#
    iptables -A from-inet -p udp --dport 67:68 -j DROP
#
#   log and drop the rest (except 192.168 stuff which we silently loose)
#
    iptables -A from-inet -s 192.168.0.0/16 -j DROP
#   iptables -A from-inet -j LOG
    iptables -A from-inet -j DROP
#
#   Create a chain which protects gateway
#
    iptables -N inet-in
#
#   Allow DNS stuff
#
    iptables -A inet-in -p udp --dport domain -j ACCEPT
    iptables -A inet-in -p tcp --dport domain -j ACCEPT
#
#   Allow connections to my ssh port=20
#
    iptables -A inet-in -m state --state NEW -p tcp --dport ssh -j=20
ACCEPT
    iptables -A inet-in -p udp --dport ssh -j ACCEPT
#
#   Allow communication with the jabberd server (disabled for now as no=20
server installed)
#
#    iptables -A inet-in -m state --state NEW -p tcp --dport 5269 -j=20
ACCEPT=20
#
#   Allow git connections
#
    iptables -A inet-in -m state --state NEW -p tcp --dport 9418 -j=20
ACCEPT
    iptables -A inet-in -p udp --dport 9418 -j ACCEPT
   =20
#   Allow mail to get in to deliver on the SMTP port
#
    iptables -A inet-in -p tcp --dport smtp -j ACCEPT
#
#   Allow boot stuff so I can configure interface
#
    iptables -A inet-in -p udp --dport 67:68 -j ACCEPT

#
#   Allow stuff to the web site
#
    iptables -A inet-in -p tcp --dport www -j ACCEPT
    iptables -A inet-in -p tcp --dport https -j ACCEPT
#
#   Allow traffic in to Asterisk (iax,sip and a limited range of rtp)
#
    iptables -A inet-in -p udp --dport iax -j ACCEPT
    iptables -A inet-in -p udp --dport sip -j ACCEPT
    iptables -A inet-in -p udp --dport 14007:14096 -j ACCEPT

#
#   Explicitly drop 135 stuff
#
#    iptables -A inet-in -p tcp --dport 135 -j LOG
    iptables -A inet-in -p tcp --dport 135 -j DROP
#
#   Do Common Stuff
#
    iptables -A inet-in -j from-inet
#
#   Create table from forwarded stuff from Inet
#
    iptables -N inet-fwd
#
#   Following is for GPL and WinVROC and must be forwarded on
#
    iptables -A inet-fwd -p udp --dport 32766:32786 -j ACCEPT
    iptables -A inet-fwd -p udp --dport 6970:6971 -j ACCEPT
#   to see them seperately
    iptables -A inet-fwd -p udp --dport 6969 -j ACCEPT
    iptables -A inet-fwd -p tcp --dport auth -j ACCEPT
#
#   Allow bittorrent stuff
#
    iptables -A inet-fwd -p tcp --dport 6881:6899 -j ACCEPT
    iptables -A inet-fwd -p udp --dport 6881:6899 -j ACCEPT
#
#
#   allow Secure Remote stuff into my portable
#
#    iptables -A inet-fwd -p udp --dport 500 -j LOG
    iptables -A inet-fwd -p udp --dport 500 -j ACCEPT
#    iptables -A inet-fwd -p udp --dport 2746 -j LOG
    iptables -A inet-fwd -p udp --dport 2746 -j ACCEPT
#
#   Do common stuff
#
    iptables -A inet-fwd -j from-inet
#
#   Link new tables in
#
    iptables -A INPUT -i $INETIF -j inet-in

    iptables -A FORWARD -i $INETIF -j inet-fwd
#
#   Count some packets hitting the server from the LAN
#
    iptables -A INPUT -p tcp --dport iax -j ACCEPT
    iptables -A INPUT -p udp --dport iax -j ACCEPT


#
#   need to MASQUERADE outgoing stuff
#
#   normal internal network
#
    iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o $INETIF -j=20
MASQUERADE
#
#
#  Stuff comming in for GPL and WinVROC needs destination changing
#
    iptables -t nat -A PREROUTING -i $INETIF -p udp --dport=20
32766:32786 -j DNAT --to-destination $KANGER
    iptables -t nat -A PREROUTING -i $INETIF -p udp --dport 6970:6971 -j=20
DNAT --to-destination $KANGER
#   seperate out to see if used
    iptables -t nat -A PREROUTING -i $INETIF -p udp --dport 6969 -j=20
DNAT --to-destination $KANGER
    iptables -t nat -A PREROUTING -i $INETIF -p tcp --dport auth -j=20
DNAT --to-destination $KANGER
#
#   Allocate bittorrent channels
#
    iptables -t nat -A PREROUTING -i $INETIF -p tcp --dport 6881:6889 -j=20
DNAT --to-destination $KANGER
    iptables -t nat -A PREROUTING -i $INETIF -p udp --dport 6881:6889 -j=20
DNAT --to-destination $KANGER
    iptables -t nat -A PREROUTING -i $INETIF -p tcp --dport 6890:6899 -j=20
DNAT --to-destination $POOH
    iptables -t nat -A PREROUTING -i $INETIF -p udp --dport 6890:6899 -j=20
DNAT --to-destination $POOH
#
#   This should be the secure remote traffic for my portable
#
    iptables -t nat -A PREROUTING -i $INETIF -p udp --dport 500 -j=20
DNAT --to-destination $RABBIT
    iptables -t nat -A PREROUTING -i $INETIF -p udp --dport 2746 -j=20
DNAT --to-destination $RABBIT
#
#   Forward Napster Connections to that machine.
#
#    iptables -t nat -A PREROUTING -i $INETIF -p tcp --dport=20
6690:6700 -j DNAT --to-destination $POOH
#    iptables -t nat -A PREROUTING -i $INETIF -p tcp --dport 4983 -j=20
DNAT --to-destination $POOH
#
#   I want to mangle outgoing packets so that I can
#   take maximum benefit of different types of connection
#   in terms of priority
#
    iptables -t mangle -A OUTPUT -o $INETIF -p tcp --dport www -j=20
TOS --set-tos Minimize-Delay
    iptables -t mangle -A OUTPUT -o $INETIF -p tcp --dport ftp -j=20
TOS --set-tos Minimize-Delay
    iptables -t mangle -A OUTPUT -o $INETIF -p tcp --dport ftp-data -j=20
TOS --set-tos Maximize-Throughput
    iptables -t mangle -A OUTPUT -o $INETIF -p tcp --dport smtp -j=20
TOS --set-tos Maximize-Reliability
    iptables -t mangle -A OUTPUT -o $INETIF -p tcp --dport pop3 -j=20
TOS --set-tos Maximize-Reliability
    iptables -t mangle -A OUTPUT -o $INETIF -p tcp --dport nntp -j=20
TOS --set-tos Minimize-Cost
    iptables -t mangle -A OUTPUT -o $INETIF -p udp --dport domain -j=20
TOS --set-tos Maximize-Reliability
    iptables -t mangle -A OUTPUT -o $INETIF -p tcp --dport domain -j=20
TOS --set-tos Maximize-Reliability
#
#   Following is for GPL and should be sent fast
#
    iptables -t mangle -A OUTPUT -o $INETIF -p udp --dport=20
32766:32786 -j TOS --set-tos Minimize-Delay
    iptables -t mangle -A OUTPUT -o $INETIF -p udp --dport 6970:6971 -j=20
TOS --set-tos Minimize-Delay
    iptables -t mangle -A OUTPUT -o $INETIF -p udp --sport=20
32766:32786 -j TOS --set-tos Minimize-Delay
    iptables -t mangle -A OUTPUT -o $INETIF -p udp --sport 6970:6971 -j=20
TOS --set-tos Minimize-Delay
#
#   VOIP traffic - mainly RTP but also IAX needs to go fast
#
    iptables -t mangle -A OUTPUT -o $INETIF -p udp --dport iax -j=20
TOS --set-tos Minimize-Delay
    iptables -t mangle -A OUTPUT -o $INETIF -p udp --sport=20
14007:14096 -j TOS --set-tos Minimize-Delay
exit 0








=2D-=20
Alan Chandler
http://www.chandlerfamily.org.uk

