From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: fail in the connmark load-balancing
Date: Fri, 2 Mar 2012 18:24:39 -0300
Message-ID: <CAMTjHrwpNfbA-a6WUh1OV8G=-BHAX3ONHYtsBT3apM-f-pGsmg@mail.gmail.com>
References: <CAMTjHrw9SY99jV9iwVH2CaSX2s4s=m7wzSjYii_k_D8fmJrDzA@mail.gmail.com>
	<1329084658.18690.375.camel@andrew-desktop>
	<CAMTjHrx9EPdrBYPDSbo03wYxd8BGcqbwe3Ns3rxkK=wMOm8EUA@mail.gmail.com>
	<CAMTjHrxzWaCx6Vp9r-x1JXBkMcdFz7gLEKYrwq5CQgveDhmshg@mail.gmail.com>
	<1330167236.30413.175.camel@andrew-desktop>
	<CAMTjHryS-nWPExfpprHeQ2UmW5O0bEthL+34p3RSqgAfHtk=4A@mail.gmail.com>
	<4F4CB793.9080105@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F4CB793.9080105@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?B?R+FzcOFyIExham9z?= <swifty@freemail.hu>
Cc: Andrew Beverley <andy@andybev.com>, Mail List - Netfilter <netfilter@vger.kernel.org>

Hi,

iptables -t mangle -N MARKS
iptables -t mangle -A MARKS - RETURN -m mark ! --mark 0/3
iptables -t mangle -A MARKS -j MARK --set-mark 3/3 -m state --state
ESTABLISED,RELATED
iptables -t mangle -A MARKS -j MARK --set-mark 1/3 -m mark --mark 0/3
-m mode statistic --mode nth --every 2
iptables -t mangle -A MARKS -j MARK --set-mark 2/3 -m mark --mark 0/3

sorry, but I did understand the mark x/y as you wrote above. why did
you use --set-mark 1 or --set-mark 2 ??

I think when it's use the mark x/y  y is an mask but I'dont know what
is the match ?!?! with someone has a doc about that please post here.

I haven't done test yet with your suggested Swifty. I'll tell you when =
I do.

thanks







Em 28 de fevereiro de 2012 08:16, G=E1sp=E1r Lajos <swifty@freemail.hu>=
 escreveu:
> Hi,
>
> A few comments...
>
> 2012-02-27 19:15 keltez=E9ssel, Usu=E1rio do Sistema =EDrta:
>
>> eth1: LAN Interface
>> eth0: WAN1
>> eth2: WAN2
>>
>> #!/bin/bash
>>
>> # flush all iptables entries
>> iptables -t filter -F
>> iptables -t filter -X
>> iptables -t nat -F
>> iptables -t nat -X
>> iptables -t mangle -F
>> iptables -t mangle -X
>> iptables -t filter -P INPUT ACCEPT
>> iptables -t filter -P OUTPUT ACCEPT
>> iptables -t filter -P FORWARD ACCEPT
>
> By default the policies are set to ACCEPT...
> I would set them to DROP and I would write my own "ACCEPT-ing" rules.=
=2E.
>
> iptables -t filter -P INPUT DROP
> iptables -t filter -P OUTPUT DROP
> iptables -t filter -P FORWARD DROP
>
> iptables -t filter -A INPUT -j ACCEPT -i lo
> iptables -t filter -A INPUT -j ACCEPT -s {trusted newtork}
>
> iptables -t filter -A OUTPUT -j ACCEPT -o lo
>
> But don't change them if you don't want to filter the connections... =
:D
>
> I would ACCEPT every packet (as the first rule) that comes/goes on th=
e lo
> interface... (in the PREROUTING/INPUT/OUTPUT/POSTROUTING chains in th=
e
> raw/mangle/filter tables)
>
>
>> iptables -t mangle -N CONNMARK1
>> iptables -t mangle -A CONNMARK1 -j MARK --set-mark 1
>> iptables -t mangle -A CONNMARK1 -j CONNMARK --save-mark
>>
>> iptables -t mangle -N CONNMARK2
>> iptables -t mangle -A CONNMARK2 -j MARK --set-mark 2
>> iptables -t mangle -A CONNMARK2 -j CONNMARK --save-mark
>>
>> iptables -t mangle -N RESTOREMARK
>> iptables -t mangle -A RESTOREMARK -j CONNMARK --restore-mark
>
>
>> iptables -t mangle -A PREROUTING -i eth1 -s 0/0 -d 0/0 -m state
>> --state ESTABLISHED,RELATED -j RESTOREMARK
>> iptables -t mangle -A PREROUTING -p tcp -m state --state NEW -m
>> statistic --mode nth --every 2 --packet 0 -j CONNMARK1
>> iptables -t mangle -A PREROUTING -p tcp -m state --state NEW -m
>> statistic --mode nth --every 2 --packet 1 -j CONNMARK2
>
> Hmm... :D
>
> iptables -t mangle -N MARKS
> iptables -t mangle -A MARKS - RETURN -m mark ! --mark 0/3
> iptables -t mangle -A MARKS -j MARK --set-mark 3/3 -m state --state
> ESTABLISED,RELATED
> iptables -t mangle -A MARKS -j MARK --set-mark 1/3 -m mark --mark 0/3=
 -m
> mode statistic --mode nth --every 2
> iptables -t mangle -A MARKS -j MARK --set-mark 2/3 -m mark --mark 0/3
>
> iptables -t mangle -A PREROUTING -j ACCEPT -i lo
> iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
> iptables -t mangle -A PREROUTING -j MARKS
>
> iptables -t mangle -A INPUT -j ACCEPT -i lo (put this as the first ru=
le in
> the INPUT...)
> iptables -t mangle -A INPUT -j CONNMARK --save-mark (put this as the =
last
> rule in the INPUT...)
>
> iptables -t mangle -A OUTPUT -j ACCEPT -o lo
> iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark
> iptables -t mangle -A OUTPUT -j MARKS (use this if you want to load-b=
alance
> the traffic that originates from you firewall)
>
> iptables -t mangle -A POSTROUTING -j ACCEPT -o lo (put this as the fi=
rst
> rule in the POSTROUTING...)
> iptables -t mangle -A POSTROUTING -j CONNMARK --save-mark (put this a=
s the
> last rule in the POSTROUTING...)
>
>
>> iptables -t nat -N SNAT1
>> iptables -t nat -A SNAT1 -j SNAT --to-source 192.168.217.254
>>
>> iptables -t nat -N SNAT2
>> iptables -t nat -A SNAT2 -j SNAT --to-source 192.168.216.254
>
>
>> iptables -t nat -A POSTROUTING -o eth2 -j SNAT1
>> iptables -t nat -A POSTROUTING -o eth0 -j SNAT2
>
> How do you like these "one-liners"?
> iptables -t nat -A POSTROUTING -j SNAT -o eth0 ! -s 192.168.216.254
> --to-source 192.168.216.254
> iptables -t nat -A POSTROUTING -j SNAT -o eth2 ! -s 192.168.217.254
> --to-source 192.168.217.254
>
>
>> ip route add 192.168.217.0 via 192.168.217.1 table oitelecom
>> ip route add 192.168.216.0 via 192.168.216.1 table gvttelecom
>> ip route add default via 192.168.217.1 table oitelecom
>> ip route add default via 192.168.216.1 table gvttelecom
>
> Maybe it is better:
> ip route add default via 192.168.216.1 src 192.168.216.254 dev eth0 t=
able
> gvttelecom
> ip route add default via 192.168.217.1 src 192.168.217.254 dev eth2 t=
able
> oitelecom
>
>
>> ip rule del from 192.168.217.254 table oitelecom
>> ip rule add from 192.168.217.254 table oitelecom
>>
>> ip rule del fwmark 1 table oitelecom
>> ip rule del fwmark 2 table gvttelecom
>>
>> ip rule add fwmark 1 table oitelecom
>> ip rule add fwmark 2 table gvttelecom
>
> Use mask in marks:
> ip rule add fwmark 1/3 table oitelecom
> ip rule add fwmark 2/3 table gvttelecom
>
> Maybe you need to copy other local routes:
> ip route show table main | grep -E
> '(^10\.|^172\.1[6-9]\.|^172\.2[0-9]\.|^172\.3[01]\.|^192\.168\.)' | w=
hile
> read ROUTE
> =A0do
> =A0ip route add table ovtelecom ${ROUTE} 2>/dev/null
> =A0ip route add table gvttelecom ${ROUTE} 2>/dev/null
> =A0done
>
> Be carefull with this last one, as it copies the 192.168.x.x routes t=
oo!!!!!
>
>> ip route flush cache
>>
>>
>> thanks....any tips is welcome.
>
>
> Swifty
>
