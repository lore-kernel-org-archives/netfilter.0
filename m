From: "pigi" <pigi@pigi.org>
Subject: Can't DROP spoofed packet. Bug or feature ?
Date: Mon, 6 Oct 2003 15:35:13 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <52208.212.239.118.101.1065447313.squirrel@www.frumar.it>
Reply-To: pigi@pigi.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi all,
 I've read through the last months, but I can' t find an answer to my
problems.

I receive continuously a lot of packets, obviously spoofed, that has
127.0.0.1  port 80 as source, and my exposed ip, multiple ports, as
destination, and the tcp flag is "R" ( reset ).
My configuration is really simple:

    Modem ADSL Ethernet
           |
           | ppp0
        Firewall ( Linux 2.4.22, iptables 1.2.8 no pom)
           | eth0
           |
           |
   --------+-------- internal net.

(I know, I know, it's not a good thing to have pppoe on the same eth used
for the network, but it works ;-) )

Let' see the problem
As soon as I' ve seen the strange packet, and double-checked that the
arrival side is the ADSL modem.
So, I decided to add a rule on my iptables script, to remove this packet.
Simple, eh ?

Here the first row of my script:

#!/bin/sh
#
$PPP0=62.XXX.XXX.XXX

$iptables=/usr/sbin/iptables

$iptables -P INPUT ACCEPT
$iptables -P FORWARD ACCEPT
$iptables -P OUTPUT ACCEPT
(I prefer to have a catchall rule at the end of the scripts, to log
everything at my convenience, rather than use the DROP policy default )

$iptables -F
$iptables -t nat -F
$iptables -X

#Loopback/loopback traffic, no problem.
$iptables -A INPUT  -i lo -j ACCEPT
$iptables -A OUTPUT -o lo -j ACCEPT

$iptables -A INPUT  -s 127.0.0.0/8 -i ppp0 -d $PPP0 -j LOG --log-level
debug --log-prefix "Spoof ALL "
$iptables -A INPUT  -s 127.0.0.0/8 -i ppp0 -d $PPP0 -j DROP

...
...
...

$iptables -A INPUT -p all -s $Any -d $Any -j LOG --log-level debug
--log-prefix "BLOCKED"
$iptables -A INPUT -p all -s $Any -d $Any -j DROP

I thought this could be enough to block it, but no packet where logged
into the first line and no packet where shown in iptables -L -v -n.

Searching the 'Net I've found a guy that had a different approach:
It used the PREROUTING chain to stop the packet:

$iptables -t nat -A PREROUTING -s 127.0.0.0/8 -i ppp0 -j LOG --log-level
debug --log-prefix "Spoof PREROUTING"
$iptables -t nat -A PREROUTING -s 127.0.0.0/8 -i ppp0  -j DROP

this other it's working.
My question is: why do the prerouting chain is able to catch the spoofed
packet, while the INPUT one isn't ?.
The destination address IS on my ppp0 interface, so it should be caught
also in the INPUT chain.

Here the frame captured with a tcpdump -i ppp0 port 80:
Frame 1 (56 bytes on wire, 56 bytes captured)
    Arrival Time: Oct  5, 2003 22:33:13.267618000
    Time delta from previous packet: 0.000000000 seconds
    Time relative to first packet: 0.000000000 seconds
    Frame Number: 1
    Packet Length: 56 bytes
    Capture Length: 56 bytes
Linux cooked capture
    Packet type: Unicast to us (0)
    Link-layer address type: 512
    Link-layer address length: 0
    Source: <MISSING>
    Protocol: IP (0x0800)
Internet Protocol, Src Addr: 127.0.0.1 (127.0.0.1), Dst Addr:
62.XXX.XXX.XXX (62.XXX.XXX.XXX)
    Version: 4
    Header length: 20 bytes
    Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
        0000 00.. = Differentiated Services Codepoint: Default (0x00)
        .... ..0. = ECN-Capable Transport (ECT): 0
        .... ...0 = ECN-CE: 0
    Total Length: 40
    Identification: 0x154c
    Flags: 0x00
        .0.. = Don't fragment: Not set
        ..0. = More fragments: Not set
    Fragment offset: 0
    Time to live: 122
    Protocol: TCP (0x06)
    Header checksum: 0x2e4c (correct)
    Source: 127.0.0.1 (127.0.0.1)
    Destination: 62.XXX.XXX.XXX (62.XXX.XXX.XXX)
Transmission Control Protocol, Src Port: www (80), Dst Port: 1388 (1388),
Seq: 0, Ack: 1487142913, Len: 0
    Source port: www (80)
    Destination port: 1388 (1388)
    Sequence number: 0
    Acknowledgement number: 1487142913
    Header length: 20 bytes
    Flags: 0x0014 (RST, ACK)
        0... .... = Congestion Window Reduced (CWR): Not set
        .0.. .... = ECN-Echo: Not set
        ..0. .... = Urgent: Not set
        ...1 .... = Acknowledgment: Set
        .... 0... = Push: Not set
        .... .1.. = Reset: Set
        .... ..0. = Syn: Not set
        .... ...0 = Fin: Not set
    Window size: 0
    Checksum: 0x5437 (correct)



