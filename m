From: "Umar Qureshey" <umar.qureshey@lantronix.com>
Subject: RE: CONFIG_BRIDGE_NETFILTER stops any traffic on wireless interface
Date: Wed, 9 Jun 2010 09:56:38 -0700
Message-ID: <F24C979D1AFD4E4292B911441CBA242407FD13@2putt.int.lantronix.com>
References: <F24C979D1AFD4E4292B911441CBA242407FCFB@2putt.int.lantronix.com> <AANLkTikBjPz7zSp7KpAsnhbyfP94TwsGrbIcXdjP2r6z@mail.gmail.com> <F24C979D1AFD4E4292B911441CBA242407FCFE@2putt.int.lantronix.com> <alpine.LSU.2.01.1006040850570.19959@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: agashi shipora <gashipo@gmail.com>, netfilter@vger.kernel.org

*brctl showstp br0: I am using busybox version of brctl and it doesn't
support the showstp parameter.  
Besides, the wireless connection is dead before I create any bridge.

*ebtables-save: No perl in this tiny system to run this script.
However:
# ./ebtables -L
Bridge table: filter

Bridge chain: INPUT, entries: 0, policy: ACCEPT

Bridge chain: FORWARD, entries: 0, policy: ACCEPT

Bridge chain: OUTPUT, entries: 0, policy: ACCEPT

# ./ebtables -t nat -L
Bridge table: nat

Bridge chain: PREROUTING, entries: 0, policy: ACCEPT

Bridge chain: OUTPUT, entries: 0, policy: ACCEPT

Bridge chain: POSTROUTING, entries: 0, policy: ACCEPT

# ./ebtables -t broute -L
Bridge table: broute

Bridge chain: BROUTING, entries: 0, policy: ACCEPT

*ip addr:
# ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
2: eth0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop qlen 1000
    link/ether 00:20:4a:9d:00:8b brd ff:ff:ff:ff:ff:ff
3: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
qlen 1000
    link/ether 00:20:4a:9d:00:94 brd ff:ff:ff:ff:ff:ff

*ip route show table all:
# ip route show table all
broadcast 127.255.255.255 dev lo  src 127.0.0.1
broadcast 127.0.0.0 dev lo  src 127.0.0.1
local 127.0.0.1 dev lo  src 127.0.0.1
local 127.0.0.0/8 dev lo  src 127.0.0.1
127.0.0.0/8 dev lo



So the wireless is unable to get DHCP before any bridging is done.  
iwconfig shows proper association with the AP.  
Manually assigning IP address doesn't help: cannot ping or send/receive
any data.
This pathology is triggered by enabling CONFIG_BRIDGE_NETFILTER.

Thanks.

-----Original Message-----
From: Jan Engelhardt [mailto:jengelh@medozas.de] 
Sent: Thursday, June 03, 2010 11:54 PM
To: Umar Qureshey
Cc: agashi shipora; netfilter@vger.kernel.org
Subject: RE: CONFIG_BRIDGE_NETFILTER stops any traffic on wireless
interface


On Friday 2010-06-04 00:31, Umar Qureshey wrote:

>My research has narrowed down the issue to the
>br_filter.c code (this is included in the build by the
CONFIG_BRIDGE_NETFILTER
>define). When I remove this object code from my build, radio is fine
(but to
>remove this br_filter.c's code, I had to modify Kconfig as stated above
so
>I'll still have ebtables support). My guess is maybe some default
setting of
>this bridge code is rejecting all packets on the radio interface.

You have not yet posted

 * brctl showstp br0
 * ebtables-save
 * ip addr
 * ip route show table all
..
 
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the person or entity to which it is addressed and may contain information that is privileged, confidential, or otherwise protected from disclosure. Distribution or copying of this e-mail, or the information contained herein, to anyone other than the intended recipient is prohibited.
