From: Nikolaus Rath <Nikolaus@rath.org>
Subject: Re: Wrong routing when combining ip rule with SNAT
Date: Fri, 13 Sep 2013 15:03:32 -0700
Message-ID: <874n9ofkgb.fsf@rath.org>
References: <8761u59uit.fsf@vostro.rath.org> <5232B01B.2030007@atc.tcs.com>
	<87mwng66vd.fsf@rath.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87mwng66vd.fsf@rath.org> (Nikolaus Rath's message of "Fri, 13
	Sep 2013 09:09:26 -0700")
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Nikolaus Rath <Nikolaus@rath.org> writes:
> Vigneswaran R <vignesh@atc.tcs.com> writes:
>> On 09/13/2013 10:40 AM, Nikolaus Rath wrote:
>>> I've enabled packet forwarding and SNAT on the "ebox" computer as
>>> follows:
>>>
>>> root@ebox:~# ip route
>>> default via 23.92.25.1 dev eth0
>>> 23.92.25.0/24 dev eth0  proto kernel  scope link  src 23.92.25.96
>>> 192.168.12.0/24 dev rath  proto kernel  scope link  src 192.168.12.=
1
>>>
>>> root@ebox:~# iptables  -L -n -v
>>> Chain INPUT (policy ACCEPT 1314 packets, 1736K bytes)
>>>   pkts bytes target     prot opt in     out     source             =
  destination
>>>
>>> Chain FORWARD (policy DROP 0 packets, 0 bytes)
>>>   pkts bytes target     prot opt in     out     source             =
  destination
>>>   150K   62M ACCEPT     all  --  rath   eth0    0.0.0.0/0          =
  0.0.0.0/0
>>> 86746  200M ACCEPT     all  --  eth0   rath    0.0.0.0/0           =
 0.0.0.0/0            state RELATED,ESTABLISHED
>>>    319 22076 LOG        all  --  *      *       0.0.0.0/0          =
  0.0.0.0/0            limit: avg 1/min burst 30 LOG flags 0 level 4 pr=
efix "Rejected forwarding: "
>>>    393 26172 REJECT     all  --  *      *       0.0.0.0/0          =
  0.0.0.0/0            reject-with icmp-net-prohibited
>>>
>>> Chain OUTPUT (policy ACCEPT 1142 packets, 2412K bytes)
>>>   pkts bytes target     prot opt in     out     source destination
>>>   root@ebox:~# iptables -t nat -L -n -v
>>> Chain PREROUTING (policy ACCEPT 36378 packets, 2383K bytes)
>>>
>>> Chain INPUT (policy ACCEPT 19982 packets, 1334K bytes)
>>>   pkts bytes target     prot opt in     out     source             =
  destination
>>>
>>> Chain OUTPUT (policy ACCEPT 61430 packets, 4601K bytes)
>>>   pkts bytes target     prot opt in     out     source             =
  destination
>>>
>>> Chain POSTROUTING (policy ACCEPT 8333 packets, 564K bytes)
>>>   pkts bytes target     prot opt in     out     source             =
  destination
>>> 69488 5081K SNAT       all  --  *      eth0    0.0.0.0/0           =
 0.0.0.0/0            to:23.92.25.96
>>>
>>>     >From a second computer "vostro", I can now use ebox as a
>>> gateway:
>>>
>>> root@vostro:~# ip route add 190.93.249.164 via 192.168.12.1
>>>
>>> This works fine, now connections to whatismyip.com (190.93.249.164)=
 go
>>> through ebox.
>>>
>>> However, when I try to be a bit more selective on vostro and use a
>>> special routing table, things don't work anymore:
>>>
>>> root@vostro:~# iptables -t mangle -L -n
>>> Chain PREROUTING (policy ACCEPT)
>>> target     prot opt source               destination
>>>
>>> Chain INPUT (policy ACCEPT)
>>> target     prot opt source               destination
>>>
>>> Chain FORWARD (policy ACCEPT)
>>> target     prot opt source               destination
>>>
>>> Chain OUTPUT (policy ACCEPT)
>>> target     prot opt source               destination
>>> MARK       tcp  --  0.0.0.0/0            190.93.249.164       tcp d=
pt:80 MARK set 0x1
>>> LOG        tcp  --  0.0.0.0/0            190.93.249.164       tcp d=
pt:80 LOG flags 0 level 4 prefix "marked: "
>>>
>>> Chain POSTROUTING (policy ACCEPT)
>>> target     prot opt source               destination
>>>
>>> root@vostro:~# ip route del 190.93.249.164 via 192.168.12.1
>>> root@vostro:~# ip route add default via 192.168.12.1 table tovpn
>>> root@vostro:~# ip rule add fwmark 0x1 table tovpn
>>>
>>> Now connections from vostro to 190.93.249.164 still make it to ebox=
, and
>>> from ebox to 190.93.249.164, but the answers get stuck on ebox:
>>>
>>> Sep 13 04:47:53 ebox kernel: Rejected forwarding: IN=3Deth0 OUT=3De=
th0 MAC=3Df2:3c:91:69:db:07:84:78:ac:0d:79:c1:08:00 SRC=3D190.93.249.16=
4 DST=3D192.168.17.47 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D58 ID=3D0 D=
=46 PROTO=3DTCP SPT=3D80 DPT=3D39024 WINDOW=3D14480 RES=3D0x00 ACK SYN =
URGP=3D0
>>>
>>> It seems that ebox tries to send the packet destined to go trough t=
he
>>> rath to eth0 instead, and consequency rejects them because forwardi=
ng is
>>> only enabled from eth0 to rath.
>>>
>>> However, this only happens when vostro has the gateway route set in=
 a
>>> special routing table rather than the default table -- but how does=
 ebox
>>> even know about that?
>>>
>>> Can someone explain to me what is happening here and why?
>>
>> I have a doubt. It seems, rath of ebox is assigned with IP address i=
n
>> the range 192.168.12.0/24.
>> However, IP address of vostro seems to be
>> 192.168.17.47 (assuming /24). Ebox doesn't have any route to this
>> range. So it try to use default route via eth0.
>>
>> What I assume is, 'vostro' has IP addresses in (atleast) two ranges
>> (192.168.12.0/24, 192.168.17.0/24).
>
> That's correct.
>
> nikratio@vostro:~$ ip addr
> 5: br0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue stat=
e UP=20
>     link/ether c8:60:00:bf:a2:7f brd ff:ff:ff:ff:ff:ff
>     inet 192.168.17.47/24 brd 192.168.17.255 scope global br0
>        valid_lft forever preferred_lft forever
>     inet6 fe80::ca60:ff:febf:a27f/64 scope link=20
>        valid_lft forever preferred_lft forever
> 6: rath: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc pfi=
fo_fast state UNKNOWN qlen 500
>     link/none=20
>     inet 192.168.12.4/24 scope global rath
>        valid_lft forever preferred_lft forever
>
>> In the default routing table, the src IP is set to 192.168.12.x (for
>> the packets originating from vostro). However, the 'tovpn' table
>> didn't specify the src IP. So, when the 'tovpn' table is being used,
>> the packets may have got the src IP as 192.168.17.x.
>
> Hmm. This would make sense, but looking at the default table, the sou=
rce
> address for the route via 192.168.12.x is actually also not set:
>
> nikratio@vostro:~$ ip route
> default via 192.168.17.1 dev br0=20
> 190.93.249.164 via 192.168.12.1 dev rath=20
> 192.168.12.0/24 dev rath  proto kernel  scope link  src 192.168.12.4=20
> 192.168.17.0/24 dev br0  proto kernel  scope link  src 192.168.17.47=20
>
> This works just fine, despite the entry having no source address. So =
why
> is it working in the default table, but not in the tovpn table?
>
>
>> I think, you can avoid this by explicitly specifying the src IP when
>> adding the route to 'tovpn' table,
>>
>>     ip route add default via 192.168.12.1 src 192.168.12.x table tov=
pn
>
>
> I'll of course try this nevertheless, thanks!

Nope, this doesn't help. It's still going out with the wrong src:

root@vostro:~# ip route list table tovpn
190.93.249.164 via 192.168.12.1 dev rath  src 192.168.12.2

root@ebox:~# tail /var/log/kern.log
Sep 13 21:28:57 ebox kernel: Rejected forwarding: IN=3Deth0 OUT=3Deth0 =
MAC=3Df2:3c:91:69:db:07:84:78:ac:0d:79:c1:08:00 SRC=3D91.189.89.199 DST=
=3D192.168.17.47 LEN=3D76 TOS=3D0x00 PREC=3D0x00 TTL=3D47 ID=3D0 DF PRO=
TO=3DUDP SPT=3D123 DPT=3D123 LEN=3D56=20


Any ideas?

Best,
Nikolaus

--=20
Encrypted emails preferred.
PGP fingerprint: 5B93 61F8 4EA2 E279 ABF6  02CF A9AD B7F8 AE4E 425C

             =C2=BBTime flies like an arrow, fruit flies like a Banana.=
=C2=AB
