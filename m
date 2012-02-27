From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: fail in the connmark load-balancing
Date: Mon, 27 Feb 2012 13:40:56 -0300
Message-ID: <CAMTjHrza5-dZM=2+XLsW4jU7nwNGNzXCLzqEkEZjhnMmmj=baQ@mail.gmail.com>
References: <CAMTjHrw9SY99jV9iwVH2CaSX2s4s=m7wzSjYii_k_D8fmJrDzA@mail.gmail.com>
	<1329084658.18690.375.camel@andrew-desktop>
	<CAMTjHrx9EPdrBYPDSbo03wYxd8BGcqbwe3Ns3rxkK=wMOm8EUA@mail.gmail.com>
	<CAMTjHrxzWaCx6Vp9r-x1JXBkMcdFz7gLEKYrwq5CQgveDhmshg@mail.gmail.com>
	<1330167236.30413.175.camel@andrew-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1330167236.30413.175.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Beverley <andy@andybev.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Thank you Andy, really I have figure out this issue.....go ahead


I forgotten include my CONNMARK RESTORE rule at the last message....
so follow my whole script.

there are two PREROUTING rule for new connections that they should do
the load-balance but I wonder when the socond rule CONNMARK2 coming
use it ?? I think never because data flows always going to into at the
first rule ( CONNMARK1 ). so the second rule never is using! I think
the statistc module could do that rotate at the use rules...but
doesn't work!



eth1: LAN Interface
eth0: WAN1
eth2: WAN2


#!/bin/bash

# flush all iptables entries
iptables -t filter -F
iptables -t filter -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -t filter -P INPUT ACCEPT
iptables -t filter -P OUTPUT ACCEPT
iptables -t filter -P FORWARD ACCEPT

iptables -t mangle -N CONNMARK1
iptables -t mangle -A CONNMARK1 -j MARK --set-mark 1
iptables -t mangle -A CONNMARK1 -j CONNMARK --save-mark


iptables -t mangle -N CONNMARK2
iptables -t mangle -A CONNMARK2 -j MARK --set-mark 2
iptables -t mangle -A CONNMARK2 -j CONNMARK --save-mark

iptables -t mangle -N RESTOREMARK
iptables -t mangle -A RESTOREMARK -j CONNMARK --restore-mark


iptables -t nat -N SNAT1
iptables -t nat -A SNAT1 -j SNAT --to-source 192.168.217.254

iptables -t nat -N SNAT2
iptables -t nat -A SNAT2 -j SNAT --to-source 192.168.216.254


iptables -t mangle -A PREROUTING -i eth1 -s 0/0 -d 0/0 -m state
--state ESTABLISHED,RELATED -j RESTOREMARK
iptables -t mangle -A PREROUTING -p tcp -m state --state NEW -m
statistic --mode nth --every 2 --packet 0 -j CONNMARK1
iptables -t mangle -A PREROUTING -p tcp -m state --state NEW -m
statistic --mode nth --every 2 --packet 1 -j CONNMARK2

iptables -t nat -A POSTROUTING -o eth2 -j SNAT1
iptables -t nat -A POSTROUTING -o eth0 -j SNAT2

ip route add 192.168.217.0 via 192.168.217.1 table oitelecom
ip route add 192.168.216.0 via 192.168.216.1 table gvttelecom
ip route add default via 192.168.217.1 table oitelecom
ip route add default via 192.168.216.1 table gvttelecom

ip rule del from 192.168.217.254 table oitelecom
ip rule add from 192.168.217.254 table oitelecom

ip rule del fwmark 1 table oitelecom
ip rule del fwmark 2 table gvttelecom

ip rule add fwmark 1 table oitelecom
ip rule add fwmark 2 table gvttelecom
ip route flush cache


thanks....any tips is welcome.














Em 25 de fevereiro de 2012 08:53, Andrew Beverley <andy@andybev.com> es=
creveu:
>> >> If it's not working, there must be another problem. Please show t=
he
>> >> output of "ip rule show", "ip ro" and "ip ro show table <table>" =
for
>> >> each of your tables where <table> is the name of the tables.
>
>>
>> [root@mtjve sbin]# ip ro
>> 192.168.215.0/24 dev eth1 =A0proto kernel =A0scope link =A0src 192.1=
68.215.1
>> 192.168.217.0/24 dev eth2 =A0proto kernel =A0scope link =A0src 192.1=
68.217.254
>> 192.168.216.0/24 dev eth0 =A0proto kernel =A0scope link =A0src 192.1=
68.216.254
>> default via 192.168.216.1 dev eth0
>>
>>
>> [root@mtjve sbin]# ip rule show
>> 0: =A0 =A0from all lookup 255
>> 32763: =A0 =A0 =A0 =A0from all fwmark 0x2 lookup gvttelecom
>> 32764: =A0 =A0 =A0 =A0from all fwmark 0x1 lookup oitelecom
>> 32765: =A0 =A0 =A0 =A0from 192.168.217.254 lookup oitelecom
>> 32766: =A0 =A0 =A0 =A0from all lookup main
>> 32767: =A0 =A0 =A0 =A0from all lookup default
>>
>> [root@mtjve sbin]# ip ro show table oitelecom
>> 192.168.217.0 via 192.168.217.1 dev eth2
>> 192.168.217.254 via 192.168.217.1 dev eth2
>> default via 192.168.217.1 dev eth2
>>
>> [root@mtjve sbin]# ip ro show table gvttelecom
>> 192.168.216.0 via 192.168.216.1 dev eth0
>> default via 192.168.216.1 dev eth0
>>
>>
>> I think here is the issue! there are two PREROUTING rule that they
>> should do the load-balance but I wonder when the socond rule (
>> CONNMARK2 ) coming use it ?? I think never because data flows always
>> going to into at the first rule ( CONNMARK1 ). so...the second rule
>> never is using! today I have done a test download from three diferen=
te
>> sites and the load-balance it wasn't work.
>>
>>
>> eth1: is my lan interface
>>
>> iptables -t mangle -A PREROUTING -i eth1 -s 0/0 -d 0/0 -m state
>> --state NEW -m statistic --mode nth --every 2 --packet 0 -j CONNMARK=
1
>> iptables -t mangle -A PREROUTING -i eth1 -s 0/0 -d 0/0 -m state
>> --state NEW -m statistic --mode nth --every 2 --packet 1 -j CONNMARK=
2
>
> I can't see any restoration of the marks. You are marking the connect=
ion
> when it is NEW, but "ip rule fwmark" will match on the packet's mark,=
 so
> you need to copy the connection mark to the packet mark with "-j
> CONNMARK --restore-mark".
>
> Andy
>
>
