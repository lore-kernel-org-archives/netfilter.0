From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: More ethernet port same ip address
Date: Sat, 19 Jul 2008 09:34:25 +0200
Message-ID: <48819901.6030604@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,
this is a very strange ask (I don't find any other on the net)...

I need to setup a linux box with more than one ethernet ports and every
one must have the same ip address. I, of course :), already tried to do it
with a lot of solutions that linux offer (iptables+mark+ip route, bonding,
a vlan every port), but with the same result... Packet come into
the right port but go out through the "last" that I have set, so it will
never arrive.
An iptables rule that are something like (-t mangle -A OUTPUT -j LOG) says:


IN= OUT=eth2 SRC=172.16.0.1 DST=172.16.0.10 LEN=84 TOS=0x00 PREC=0x00
TTL=64 ID=19468 PROTO=ICMP TYPE=0 CODE=0 ID=41003 SEQ=902
IN= OUT=eth2 SRC=172.16.0.1 DST=172.16.0.3 LEN=60 TOS=0x00 PREC=0x00
TTL=64 ID=8117 PROTO=ICMP TYPE=0 CODE=0 ID=512 SEQ=37888
IN= OUT=lo SRC=172.16.0.1 DST=172.16.0.1 LEN=88 TOS=0x00 PREC=0xC0
TTL=64 ID=8112 PROTO=ICMP TYPE=3 CODE=1 [SRC=172.16.0.1 DST=172.16.0.3
LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=8117 PROTO=ICMP TYPE=0 CODE=0 ID=512
SEQ=37888 ]

Here the server have the two ports with 172.16.0.1 and two clients,
connected into the two others has 172.16.0.3 and 172.16.0.10

It's there a solution for achieve this?

Thanks,
Michele

