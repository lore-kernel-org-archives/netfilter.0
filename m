From: Giacomo Bernardi <mino@minux.it>
Subject: Awkward scenario: 3 interfaces and 3 devices with same ip/subnet.
Date: Tue, 31 Aug 2010 12:34:00 +0100
Message-ID: <AANLkTik15tix2nxCQfeD=W+t10NuiYLBeSCuYZ8R_2s+@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,
want to solve a very awkward scenario?

There's a linux box with three interfaces (eth0, eth1, eth2) each
directly connected to an embedded device that has configuration:
- IP: 10.0.0.1
- Mask: 255.255.255.0
(in other words: all three devices answer to 10.0.0.1/24 and their
configuration can't be changed)

I need to send and receive snmp packets to an arbitrary given device
among these three ...how?

--- My proposed idea:

I think a solution would be to configure the three interfaces like following:
- eth0: 10.1.0.100/24
- eth1: 10.2.0.100/24
- eth2: 10.3.0.100/24

Then a set of rules like:
iptables -t mangle -A OUTPUT -d 10.3.0.1 -j MARK --set-mark 103     #
mark outgoing packets for 10.3.0.1
ip rule add fwmark 103 table 103                                    #
create an iproute table
ip route add table 103 default dev eth3                             #
send out marked packets on eth3
iptables -t nat -A POSTROUTING -m mark --mark 103 -j SNAT --to
10.0.0.100 # rewrite source ip
iptables -t nat -A OUTPUT -m mark --mark 103 -j DNAT --to 10.0.0.1  #
rewrite dest ip

And then send snmp queries to 'fake' addresses 10.1.0.1, 10.2.0.1 and 10.3.0.1.

Result:
- the device gets the packets and sends back the results (with
srcip=10.0.0.1 and dstip=10.0.0.100)
- but when the linux box gets them back, they are obviously discarded.

How can I do this?

Thanks very much for your help.
mino
