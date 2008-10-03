From: "Michel Benoit" <michel.benoit@sepab.se>
Subject: IP forwarding with MASQUERADE
Date: Fri, 3 Oct 2008 14:07:24 +0200
Message-ID: <c88e466f0810030507x7e601d09q1034c7cc18be9b57@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:mime-version:content-type:content-transfer-encoding
         :content-disposition:x-google-sender-auth;
        bh=v5/PXFNE31TiEN8+xHBlKPPTuwMLjYntVohUdBKhYIU=;
        b=eX9RD42bQQ6xZObmOPIu8Gd9zdmOkGbGGVoNQDaHzv0scgQhtrY/zJHwTT9+D0CvgM
         vr5O5J7vUkPUDRPd3Dk0qRBpQYKeL0fZ+oNa24XWj+vdVw2ILnFpLiH6oVS0YflPZIf1
         4cssAlSuLsMul7JebQtCVOab5Er+PdX1/JIf8=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm trying to set up an embedded arm linux box to do IP forwarding
with the help of iptables.

The first box (1) is connected to the internet with ppp and thus gets
a new dynamic address with every connection.
The second box (2) is connected to the first box on an 192.168.0.x
ethernet network.

I can ping from (1) to (2) on the 192.168.0.x network.
I can ping from (2) to (1) on the 192.168.0.x network.
I can ping from (2) to (1) on the 10.x.x.x network.
However pinging from (2) to a machine on the internet fails.

The following log is produced on (1) by netfilter for the unsuccessful ping:

fwd:IN=eth0 OUT=ppp0 SRC=192.168.0.183 DST=10.0.0.1 LEN=84 TOS=0x00
PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=3
msk:IN= OUT=ppp0 SRC=192.168.0.183 DST=10.0.0.1 LEN=84 TOS=0x00
PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=3613 SE
in:IN=ppp0 OUT= MAC= SRC=10.0.0.1 DST=10.146.88.212 LEN=84 TOS=0x08
PREC=0x80 TTL=57 ID=46016 PROTO=ICMP TYPE=0 CODE=0 ID=36

It appears that the ping is succesfully being masqueraded on the way
out (SRC swapped from 192.168.0.183 to 10.146.88.212).
It even looks like 10.0.0.1 is responding to the ping.
However, it seems that the packet is not de-masqueraded and ends up
being processed by (1) instead of being forwarded to (2) with the SRC
swapped back to 192.168.0.183 to 10.146.88.212.


I set up (1) with the following script:

#!/bin/sh

IPTABLES="/usr/sbin/iptables"

EXTIF="ppp0"
INTIF="eth0"
echo "   External Interface:  $EXTIF"
echo "   Internal Interface:  $INTIF"

echo "   Enabling forwarding.."
echo "1" > /proc/sys/net/ipv4/ip_forward

echo "   Enabling DynamicAddr.."
echo "1" > /proc/sys/net/ipv4/ip_dynaddr

echo "   Clearing any existing rules and setting default policy.."
$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

echo "   FWD: Allow all connections OUT and only existing and related ones IN"
$IPTABLES -A FORWARD -j LOG --log-prefix fwd:
$IPTABLES -A FORWARD -i $EXTIF -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -j ACCEPT

echo "   Logging all INPUT/OUTPUT"
$IPTABLES -A INPUT -j LOG --log-prefix in:
$IPTABLES -A OUTPUT -j LOG --log-prefix out:

echo "   Enabling SNAT (MASQUERADE) functionality on $EXTIF"
$IPTABLES -t nat -A POSTROUTING -j LOG --log-prefix msk:
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE


I then make a ppp connection and  (1) is setup as follows:

# ifconfig
eth0      Link encap:Ethernet  HWaddr 3A:1F:34:08:54:54
          inet addr:192.168.0.1  Bcast:192.168.0.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:175 errors:0 dropped:0 overruns:0 frame:0
          TX packets:68 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:21964 (21.4 KiB)  TX bytes:4760 (4.6 KiB)
          Interrupt:21 Base address:0x4000

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:16 errors:0 dropped:0 overruns:0 frame:0
          TX packets:16 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:1624 (1.5 KiB)  TX bytes:1624 (1.5 KiB)

ppp0      Link encap:Point-to-Point Protocol
          inet addr:10.146.88.212  P-t-P:10.0.0.1  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:50 errors:0 dropped:0 overruns:0 frame:0
          TX packets:55 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:4627 (4.5 KiB)  TX bytes:4271 (4.1 KiB)

# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
10.0.0.1        *               255.255.255.255 UH    0      0        0 ppp0
192.168.0.0     *               255.255.255.0   U     0      0        0 eth0
127.0.0.0       *               255.0.0.0       U     0      0        0 lo
default         *               0.0.0.0         U     0      0        0 ppp0



(2) is set up as follows:

# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.0.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
0.0.0.0         192.168.0.1     0.0.0.0         UG    0      0        0 eth0


Does anyone have any idea why this is happening?
Should there be a netfilter rule somewhere for de-masquerading?
How can I debug the problem?  Is there a table or a file somewhere I
can look at.
How does netfilter recognise a packet that needs to be de-masqueraded?

I've been searching the web/newsgroups and reading FAQs and HOWTOs for
two days to no avail.

I'm using iptables v1.3.8 and linux kernel v2.6.25.

Thanks in advance,

Michel
