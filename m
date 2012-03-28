From: John Lister <john.lister@kickstone.co.uk>
Subject: Help with packet marking
Date: Wed, 28 Mar 2012 15:56:57 +0100
Message-ID: <4F7326B9.2040705@kickstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kickstone.com; s=mail;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=4adUWp6Ty/6gS7eNw4NX08D015KNULJs+DE2i5EQh+M=;
	b=TCDlDeQEafe9JfosIbzlH99zfiuovVAvRl8MK92x343h8bPzb5Nl89+pTFguQB8/w9G2DncepwNfnrUp4gDyzn5W6o4lDHKasBcxgi3SiQCid9RbQzXdiXO0YseoFZ+j;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi, I've got a multi homed system which was all working fine until it 
was accidentally rebooted a couple of days ago and this is probably more 
LARTC but that list seems dead?

Anyway I'm now seeing bizarre behaviour running ubuntu 10.04 kernel 
2.6.32-40. Previously I would mark the packets in prerouting and then 
have fwmark based rules in the routing table to send them out via a 
separate custom routing table.  I have the main routing table set up 
with a default route via one of the interfaces

Now I can see when debugging iptables, that the interface is set 
correctly and the packet is marked, but sticking a sniffer onto the 
interfaces shows me that the packets are coming out of the default 
interface. If i disable the default route I get "unreachable host". 
Another wierd thing is that conntrack is showing separate new 
connections as established, for example if I ping 1 packet and repeat 
the command the second ping is labelled as established which I wouldn't 
expect... (I've posted this issue earlier as restore-mark is working for 
what I'd expect to be new connections)

Anyway my setup
interfaces
eth0 : 192.168.2.7
eth1 : x.37.63.74        gw=x.37.63.73
eth3 : x.45.115.81      gw=x.45.115.86

# add extra routing tables
ip route add x.37.63.72/29 dev eth1 table 101
ip route add 192.168.2.0/24 dev eth0 table 101
ip route add default via x.37.63.73 dev eth1 table 101

ip route add x.45.115.80/29 dev eth3 table 103
ip route add 192.168.2.0/24 dev eth0 table 103
ip route add default via x.45.115.86 dev eth3 table 103

# add rules
ip rule add fwmark 101 table 101
ip rule add fwmark 103 table 103

# route a specific ip out for testing sent from 192.168.2.x and 
forwarded through this box.
iptables -t mangle -A PREROUTING -d 98.207.221.49/32 -m state --state 
NEW -j MATCH1
iptables -t mangle -A MATCH1 -j MARK --set-mark 0x1
iptables -t mangle -A MATCH1 -j CONNMARK --save-mark

iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to x.37.63.74


The above is a simplified subset but covers the basics I think. Anyway 
doing
ping 98.207.221.49
from an internal machine using this as its gateway fails. I can see it 
marks the rule, does the routing which sets the outgoing interface 
correctly but then the packet comes out of the default interface and is 
then lost. The following logs are generated (cropped for readability) 
from which you can see it getting marked and the interface set correctly

PREROUTING (NEW) IN=eth0 OUT=  SRC=192.168.2.133 DST=98.207.221.49 
LEN=60 TOS=0x00 PREC=0x00 TTL=128 ID=9452 PROTO=ICMP TYPE=8 CODE=0 ID=1 
SEQ=1354
PREROUTING (MARK1) IN=eth0 OUT=  SRC=192.168.2.133 DST=98.207.221.49 
LEN=60 TOS=0x00 PREC=0x00 TTL=128 ID=9452 PROTO=ICMP TYPE=8 CODE=0 ID=1 
SEQ=1354
FORWARD IN=eth0 OUT=eth1 SRC=192.168.2.133 DST=98.207.221.49 LEN=60 
TOS=0x00 PREC=0x00 TTL=127 ID=9452 PROTO=ICMP TYPE=8 CODE=0 ID=1 
SEQ=1354 MARK=0x1
POSTROUTING IN= OUT=eth1 SRC=192.168.2.133 DST=98.207.221.49 LEN=60 
TOS=0x00 PREC=0x00 TTL=127 ID=9452 PROTO=ICMP TYPE=8 CODE=0 ID=1 
SEQ=1354 MARK=0x1
SNATTING IN= OUT=eth1 SRC=192.168.2.133 DST=98.207.221.49 LEN=60 
TOS=0x00 PREC=0x00 TTL=127 ID=9452 PROTO=ICMP TYPE=8 CODE=0 ID=1 
SEQ=1354 MARK=0x1

anyone got an idea what is going on?

Thanks

John










-- 
Get the PriceGoblin Browser Addon
www.pricegoblin.co.uk

