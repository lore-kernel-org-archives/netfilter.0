From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: fail in the connmark load-balancing
Date: Mon, 13 Feb 2012 20:03:01 -0200
Message-ID: <CAMTjHrxzWaCx6Vp9r-x1JXBkMcdFz7gLEKYrwq5CQgveDhmshg@mail.gmail.com>
References: <CAMTjHrw9SY99jV9iwVH2CaSX2s4s=m7wzSjYii_k_D8fmJrDzA@mail.gmail.com>
	<1329084658.18690.375.camel@andrew-desktop>
	<CAMTjHrx9EPdrBYPDSbo03wYxd8BGcqbwe3Ns3rxkK=wMOm8EUA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHrx9EPdrBYPDSbo03wYxd8BGcqbwe3Ns3rxkK=wMOm8EUA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Beverley <andy@andybev.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Andrew, I have done new test but my load-balance itsn't work!

follow what you asked me in the last message:

[root@mtjve sbin]# ip ro
192.168.215.0/24 dev eth1  proto kernel  scope link  src 192.168.215.1
192.168.217.0/24 dev eth2  proto kernel  scope link  src 192.168.217.25=
4
192.168.216.0/24 dev eth0  proto kernel  scope link  src 192.168.216.25=
4
default via 192.168.216.1 dev eth0


[root@mtjve sbin]# ip rule show
0:	from all lookup 255
32763:	from all fwmark 0x2 lookup gvttelecom
32764:	from all fwmark 0x1 lookup oitelecom
32765:	from 192.168.217.254 lookup oitelecom
32766:	from all lookup main
32767:	from all lookup default

[root@mtjve sbin]# ip ro show table oitelecom
192.168.217.0 via 192.168.217.1 dev eth2
192.168.217.254 via 192.168.217.1 dev eth2
default via 192.168.217.1 dev eth2

[root@mtjve sbin]# ip ro show table gvttelecom
192.168.216.0 via 192.168.216.1 dev eth0
default via 192.168.216.1 dev eth0


I think here is the issue! there are two PREROUTING rule that they
should do the load-balance but I wonder when the socond rule (
CONNMARK2 ) coming use it ?? I think never because data flows always
going to into at the first rule ( CONNMARK1 ). so...the second rule
never is using! today I have done a test download from three diferente
sites and the load-balance it wasn't work.


eth1: is my lan interface

iptables -t mangle -A PREROUTING -i eth1 -s 0/0 -d 0/0 -m state
--state NEW -m statistic --mode nth --every 2 --packet 0 -j CONNMARK1
iptables -t mangle -A PREROUTING -i eth1 -s 0/0 -d 0/0 -m state
--state NEW -m statistic --mode nth --every 2 --packet 1 -j CONNMARK2


any tips are welcome!

thanks




















Em 13 de fevereiro de 2012 09:19, Usu=E1rio do Sistema
<maiconlp@ig.com.br> escreveu:
> Hi, current I'm unable access my firewall but follow my main part of
> configuration script. does the =A0main table routing has have the two
> Gateways ?? because my main table has only one as follow.
>
>
> [root@mtjve ~]# ip ro
> 192.168.215.0/24 dev eth1 =A0proto kernel =A0scope link =A0src 192.16=
8.215.1
> 192.168.217.0/24 dev eth2 =A0proto kernel =A0scope link =A0src 192.16=
8.217.254
> 192.168.216.0/24 dev eth0 =A0proto kernel =A0scope link =A0src 192.16=
8.216.254
> default via 192.168.216.1 dev eth0
>
>
> My script:
>
> iptables -t mangle -N CONNMARK1
> iptables -t mangle -A CONNMARK1 -j MARK --set-mark 1
> iptables -t mangle -A CONNMARK1 -j CONNMARK --save-mark
>
> iptables -t mangle -N CONNMARK2
> iptables -t mangle -A CONNMARK2 -j MARK --set-mark 2
> iptables -t mangle -A CONNMARK2 -j CONNMARK --save-mark
>
> Wan Interfaces:
> eth2:192.168.217.254
> eth0:192.168.216.254
>
> Lan Interface:
> eth1:192.168.215.1
>
> iptables -t nat -N SNAT1
> iptables -t nat -A SNAT1 -j SNAT --to-source 192.168.217.254
>
> iptables -t nat -N SNAT2
> iptables -t nat -A SNAT2 -j SNAT --to-source 192.168.216.254
>
>
> iptables -t mangle -A PREROUTING -i eth1 -s 0/0 -d 0/0 -m state
> --state NEW -m statistic --mode nth --every 2 --packet 0 -j CONNMARK1
>
> iptables -t mangle -A PREROUTING -i eth1 -s 0/0 -d 0/0 -m state
> --state NEW -m statistic --mode nth --every 2 --packet 1 -j CONNMARK2
>
> iptables -t mangle -A PREROUTING -i eth1 -s 0/0 -d 0/0 -m state
> --state ESTABLISHED,RELATED -j RESTOREMARK
>
> iptables -t nat -A POSTROUTING -o eth2 -j SNAT1
>
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT2
>
>
> ip rule del fwmark 2
> ip rule del fwmark 1
>
> ip route add default via 192.168.217.1 table 1
> ip route add default via 192.168.216.1 table 2
>
> ip rule add fwmark 1 table 1
> ip rule add fwmark 2 table 2
>
> ip route flush cache
>
>
>
> thanks!
>
>
>
>
> Em 12 de fevereiro de 2012 20:10, Andrew Beverley <andy@andybev.com> =
escreveu:
>> On Sat, 2012-02-11 at 18:19 -0200, Usu=E1rio do Sistema wrote:
>>> Hello,
>>>
>>> I've just deployed the load balance in the my firewall iptables
>>> 1.4.3.1 as How to below:
>>>
>>> http://www.sysresccd.org/Sysresccd-Networking-EN-Iptables-and-netfi=
lter-load-balancing-using-connmark
>>
>>> I need add follow line to occur the load balance ??
>>
>> [...]
>>
>>> ip route add default scope global equalize nexthop via x.y.t.z1 wei=
ght
>>> 2 =A0nexthop via x.y.t.z2 weight 2
>>
>> No, you don't need that line when doing load sharing with the method
>> described above. That will break the sharing per-connection, which i=
s
>> obviously what you are trying to achieve.
>>
>> If it's not working, there must be another problem. Please show the
>> output of "ip rule show", "ip ro" and "ip ro show table <table>" for
>> each of your tables where <table> is the name of the tables.
>>
>> Andy
>>
>>
>>
