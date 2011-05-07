From: James Lay <jlay@slave-tothe-box.net>
Subject: Blocking in NAT
Date: Sat, 07 May 2011 07:20:37 -0600
Message-ID: <C9EAA345.75ED%jlay@slave-tothe-box.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Netfilter <netfilter@vger.kernel.org>

Hey All,

So=8Aonce upon a time one could block using NAT, which was nice since I=
 run
a spamfilter that grabs everything coming in to port 25 with:

iptables -t nat -A PREROUTING -m physdev --physdev-in eth0 ! -s 10.0.0.=
0/8
-p tcp --dport 25 -j DNAT --to-destination 10.0.0.1:25

=46or some reason, filtering in the nat table was deemed bad, so now I =
can
no longer drop things there.  So my question is, how do I block say...a
spammer from sending to port 25 now?  I can't use:

iptables -t nat -i PREROUTING -m physdev --physdev-in eth0 -s naughty.i=
p
-j DROP
or
iptables -t nat -i PREROUTING -m physdev --physdev-in eth0 -s naughty.i=
p
-j REJECT

Am I going to have to do something silly like send to an ip that's not =
on
my network:

iptables -t nat -i PREROUTING -m physdev --physdev-in eth0 -s naughty.i=
p
-j DNAT --to-destiation 172.16.1.1

I have to admit...loosing the DROP functionality in nat was a real
bummer....I had a great script that would block ANYTHING from an IP
address with the INPUT, FORWARD, and PREROUTING tables..not so much now
though ;)  Thanks for any input you can provide.

James=20


