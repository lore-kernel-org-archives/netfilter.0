From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: Howto DNAT/SNAT existing TCP session (no SYN, only PUSH/ACK)
Date: Wed, 11 Aug 2010 16:01:10 +0200
Message-ID: <4C62AD26.1050200@aimvalley.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


We have a system that looks internally like this:

     eLAN
       |
       |
     --------------
     | ETH-switch |
     --------------
      |p1        |p2
      |          |
--------      --------
|HOST_1|------|HOST_2|
-------- iLAN --------
    ]
........
. APPs .
........

It is a simplified view, but in essence it offers a sort of traffic protection
and as a consequence it means our APPs should be accessible through the one external
IP LAN address (eLAN-IP-addr) no matter which switch port is active (p1 or p2).
A HOST has a full TCP/IP stack. The ETH-switch takes care
of the protection switch, the HOST_x<-->ETH-switch eth interface always
has the same MAC and IP address (eLAN-IP-addr).
Our APPs communicate through HOST_1.

On HOST_2 the below rule takes care of this:
iptables -t nat -A PREROUTING -d <eLAN-IP-addr> ! -i iLAN -j DNAT --to-destination <iLAN-HOST_1-IP-addr>

Here's my 1st problem/question.

Let's say HOST_2 is active and an ESTABLISHED TCP communication is present between
a system on the eLAN and an APP (of course for HOST_1 the TCP connection will be
administrated as iLAN-HOST_1-IP-addr/port<-->eLAN-system-IP-addr/port)
If the ETH-switch rapidly makes p1/HOST_1 active, is it possible to make sure outgoing
TCP data (that is sent by the APP/HOST_1) is somehow source NAT'ed ?
I ask this because currently the outgoing data (to the system on the eLAN carries
src-ip=iLAN-HOST_1-IP-addr while I want it to be eLAN-IP-addr.


Vice versa (p2/HOST_2 becomes active) the same problem applies.
So I tried the below rule on HOST_1:
iptables -t nat -A PREROUTING -d <eLAN-IP-addr> ! -i iLAN -m state --state INVALID,NEW,RELATED,ESTABLISHED -j DNAT --to-destination <iLAN-HOST_1-IP-addr>

This rule makes sure all traffic to the APPs have the internal LAN address of HOST_1 (iLAN-HOST_1-IP-addr).
So I tested with APP=telnetd. HOST_2 is active and the NAT rule on HOST_2 takes
care of NATting to HOST_1 with dst-addr=iLAN-HOST_1-IP-addr.
On HOST_1 the below telnet connection exists:
tcp        0      0 iLAN-HOST_1-IP-addr:23          eLAN-system-IP-addr:58119       ESTABLISHED

On a switch to p1/HOST_1 I would expect no impact for the telnet connection (as long as I do
not actively use it).
However after the switch has been completed, the TCP of HOST_1 sends a RST
This I do not understand, especially because the last mentioned NAT rule said it
did the translation:
iptables -t nat -L -v
Chain PREROUTING (policy ACCEPT 26 packets, 3052 bytes)
  pkts bytes target     prot opt in     out     source               destination
     1    54 DNAT       all  --  !iLAN  any     anywhere             eLAN-IP-addr       state INVALID,NEW,RELATED,ESTABLISHED to:iLAN-HOST_1-IP-addr

1 packet, 54 bytes corresponds with the <ENTER> I typed on the telnet client
on the eLAN system.

Anybody know why (TCP of) HOST_1 sends a ReSeT in this case ?

