From: Andrew Stone <andrew@stonie.net>
Subject: NAT WAN IP to internal range?
Date: Mon, 19 Dec 2011 14:20:04 +1100
Message-ID: <CANSq30tB6vk90gORs+bcLFvF3a8iwZcw8CbUpJFZJOH2YN-SXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hello,

I am having a bit of trouble following the documentation on assigning
a range of NATed IPs.
My router has a several External IP=92s assigned to the WAN interface:

WANIF=3D`get_wanface`
ifconfig $WANIF:1 a.b.c.241 netmask 255.255.255.248 broadcast a.b.c.247
ifconfig $WANIF:2 a.b.c.242 netmask 255.255.255.248 broadcast a.b.c.247
ifconfig $WANIF:3 a.b.c.243 netmask 255.255.255.248 broadcast a.b.c.247

Then I have successfully configured a single internal machine natted
with the 241 address like so:

iptables -t nat -I PREROUTING -d a.b.c.241 -j DNAT --to-destination 192=
=2E168.1.69
iptables -t nat -I POSTROUTING -s 192.168.1.69 -j SNAT --to-source a.b.=
c.241

That works great, but I need the second IP (242) to be the external IP
for a _range_ of internal IPs

I have tried this however it does not appear to work:

iptables -t nat -A PREROUTING -d a.b.c.242 -j DNAT --to-destination
192.168.1.100-192.168.1.150
iptables -t nat -A POSTROUTING -s 192.168.1.100-192.168.1.150 -j SNAT
--to-source 150.101.194.242

This article suggests (at least to me) that this is possible:
http://www.cyberciti.biz/tips/linux-iptables-how-to-specify-a-range-of-=
ip-addresses-or-ports.html

The =91Nat how to docs=92 seem to suggest that a range can be specified=
,
but I suspect my usage is wrong?
http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-6.html#ss6.2


How do I NAT a WAN IP to a range of internal IPs?

Thanks and kind regards,
Andrew Stone.
