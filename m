From: John Lister <john.lister@kickstone.co.uk>
Subject: Re: Help with packet marking
Date: Thu, 29 Mar 2012 09:11:58 +0100
Message-ID: <4F74194E.9030608@kickstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: betolj@gmail.com, Mail List - Netfilter <netfilter@vger.kernel.org>

>Hi, i think that exist another way to do this (best).
>The linux kernel will select the routing tables according to the RPDB =
rules.

It seems to be selecting the correct route using the marks as iptables =
reports the correct interface in the log files.
However the packet then goes out of a different interface.

>You "cant" define a default gw into main table (for best routing treat=
ment).

This has always worked before, the default route is in the main table (=
maybe not clear before) and is used so that
the box can route local packets out. Your example (below) would do the =
same except skip the fwmark rules

>But, you can change your RPDB to select a default gw out of main table=
 (forced).
>
>For example:
>
>ip route del default
>
>ip rule flush
>ip rule add prio 10 table main
>ip rule add prio 50 fwmark 101 table 101
>ip rule add prio 51 fwmark 103 table 103
>ip rule add prio 100 table 101
>
>ip route flush cache
>
>Another thing is... the mangle table is processed per packet.
>So, i think you shouldnt use the NEW state to validate the netfilter m=
arks.
>Your netfilter MARKs shall be made =E2=80=8B=E2=80=8Bwith --set-mark 0=
x101 or 0x103

Yes, sorry when doing the example missed off the -m state --state NEW b=
it...
I still find it strange that recently packets I'd expect to be in the N=
EW state are ESTABLISHED. eg doing
ping blah
ping blah
results in the first outgoing packet being NEW, but the second ping is =
ESTABLISHED, surely this is a bug?

Thanks

John

>>  2012/3/28 John Lister<john.lister@kickstone.co.uk>:
>>  Hi, I've got a multi homed system which was all working fine until =
it was
>>  accidentally rebooted a couple of days ago and this is probably mor=
e LARTC
>>  but that list seems dead?
>>
>>  Anyway I'm now seeing bizarre behaviour running ubuntu 10.04 kernel
>>  2.6.32-40. Previously I would mark the packets in prerouting and th=
en have
>>  fwmark based rules in the routing table to send them out via a sepa=
rate
>>  custom routing table. =C2 I have the main routing table set up with=
 a default
>>  route via one of the interfaces
>>
>>  Now I can see when debugging iptables, that the interface is set co=
rrectly
>>  and the packet is marked, but sticking a sniffer onto the interface=
s shows
>>  me that the packets are coming out of the default interface. If i d=
isable
>>  the default route I get "unreachable host". Another wierd thing is =
that
>>  conntrack is showing separate new connections as established, for e=
xample if
>>  I ping 1 packet and repeat the command the second ping is labelled =
as
>>  established which I wouldn't expect... (I've posted this issue earl=
ier as
>>  restore-mark is working for what I'd expect to be new connections)
>>
>>  Anyway my setup
>>  interfaces
>>  eth0 : 192.168.2.7
>>  eth1 : x.37.63.74 =C2  =C2  =C2  =C2 gw=3Dx.37.63.73
>>  eth3 : x.45.115.81 =C2  =C2  =C2 gw=3Dx.45.115.86
>>
>>  # add extra routing tables
>>  ip route add x.37.63.72/29 dev eth1 table 101
>>  ip route add 192.168.2.0/24 dev eth0 table 101
>>  ip route add default via x.37.63.73 dev eth1 table 101
>>
>>  ip route add x.45.115.80/29 dev eth3 table 103
>>  ip route add 192.168.2.0/24 dev eth0 table 103
>>  ip route add default via x.45.115.86 dev eth3 table 103
>>
>>  # add rules
>>  ip rule add fwmark 101 table 101
>>  ip rule add fwmark 103 table 103
>>
>>  # route a specific ip out for testing sent from 192.168.2.x and for=
warded
>>  through this box.
>>  iptables -t mangle -A PREROUTING -d 98.207.221.49/32 -m state --sta=
te NEW -j
>>  MATCH1
>>  iptables -t mangle -A MATCH1 -j MARK --set-mark 0x1
>>
>>  iptables -t mangle -A MATCH1 -j CONNMARK --save-mark
>>
>>  iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to x.37.63.74
>>
>>
>>  The above is a simplified subset but covers the basics I think. Any=
way doing
>>  ping 98.207.221.49
>>  from an internal machine using this as its gateway fails. I can see=
 it marks
>>  the rule, does the routing which sets the outgoing interface correc=
tly but
>>  then the packet comes out of the default interface and is then lost=
=2E The
>>  following logs are generated (cropped for readability) from which y=
ou can
>>  see it getting marked and the interface set correctly
>>
>>  PREROUTING (NEW) IN=3Deth0 OUT=3D =C2 SRC=3D192.168.2.133 DST=3D98.=
207.221.49 LEN=3D60
>>  TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D9452 PROTO=3DICMP TYPE=3D8 CO=
DE=3D0 ID=3D1 SEQ=3D1354
>>  PREROUTING (MARK1) IN=3Deth0 OUT=3D =C2 SRC=3D192.168.2.133 DST=3D9=
8.207.221.49 LEN=3D60
>>  TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D9452 PROTO=3DICMP TYPE=3D8 CO=
DE=3D0 ID=3D1 SEQ=3D1354
>>  FORWARD IN=3Deth0 OUT=3Deth1 SRC=3D192.168.2.133 DST=3D98.207.221.4=
9 LEN=3D60 TOS=3D0x00
>>  PREC=3D0x00 TTL=3D127 ID=3D9452 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D=
1 SEQ=3D1354 MARK=3D0x1
>>  POSTROUTING IN=3D OUT=3Deth1 SRC=3D192.168.2.133 DST=3D98.207.221.4=
9 LEN=3D60 TOS=3D0x00
>>  PREC=3D0x00 TTL=3D127 ID=3D9452 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D=
1 SEQ=3D1354 MARK=3D0x1
>>  SNATTING IN=3D OUT=3Deth1 SRC=3D192.168.2.133 DST=3D98.207.221.49 L=
EN=3D60 TOS=3D0x00
>>  PREC=3D0x00 TTL=3D127 ID=3D9452 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D=
1 SEQ=3D1354 MARK=3D0x1


--=20
www.pricegoblin.co.uk

