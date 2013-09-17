From: Nikolaus Rath <Nikolaus@rath.org>
Subject: Re: Wrong routing when combining ip rule with SNAT
Date: Mon, 16 Sep 2013 17:58:40 -0700
Message-ID: <87li2w9scf.fsf@vostro.rath.org>
References: <8761u59uit.fsf@vostro.rath.org> <52379693.80707@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi Eliezer,

I have a VPN connection, and I want to tunnel everything through the VP=
N
node -- except, of course, the VPN connection itself.

The hard part is to also tunnel non-VPN connections to the VPN node
itself. In other words how do I make sure that every connection to the
external ip of the VPN node is tunneled through its internal ip --
except for the packets that form the tunnel itself?

My idea was install a default route to the internal ip of the VPN node,
use iptables to mark the VPN connections and then set up a special
routing table for those. But maybe there's an easier way?

Best,
Nikolaus

Eliezer Croitoru <eliezer@ngtech.co.il> writes:
> Hey there,
>
> What are you trying to achieve exactly?
> I tried to understand the network topology and the network issues but
> since you did not marked a target to what you want to actually get.
> There is an option to actually understand the situation you are in by
> just describing the need and the situation and then continue from the=
re.
>
> Hope for the best
> Eliezer
>
> On 09/13/2013 08:10 AM, Nikolaus Rath wrote:
>> Hello,
>>=20
>> Thanks for working on this great networking stack!
>>=20
>> I'm trying to set up a configuration with SNAT and routing rules, bu=
t
>> I'm having weird problems that I do not understand:
>>=20
>> I've enabled packet forwarding and SNAT on the "ebox" computer as
>> follows:
>>=20
>> root@ebox:~# ip route
>> default via 23.92.25.1 dev eth0=20
>> 23.92.25.0/24 dev eth0  proto kernel  scope link  src 23.92.25.96=20
>> 192.168.12.0/24 dev rath  proto kernel  scope link  src 192.168.12.1=
=20
>>=20
>> root@ebox:~# iptables  -L -n -v
>> Chain INPUT (policy ACCEPT 1314 packets, 1736K bytes)
>>  pkts bytes target     prot opt in     out     source               =
destination        =20
>>=20
>> Chain FORWARD (policy DROP 0 packets, 0 bytes)
>>  pkts bytes target     prot opt in     out     source               =
destination        =20
>>  150K   62M ACCEPT     all  --  rath   eth0    0.0.0.0/0            =
0.0.0.0/0          =20
>> 86746  200M ACCEPT     all  --  eth0   rath    0.0.0.0/0            =
0.0.0.0/0            state RELATED,ESTABLISHED
>>   319 22076 LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0            limit: avg 1/min burst 30 LOG flags 0 level 4 pref=
ix "Rejected forwarding: "
>>   393 26172 REJECT     all  --  *      *       0.0.0.0/0            =
0.0.0.0/0            reject-with icmp-net-prohibited
>>=20
>> Chain OUTPUT (policy ACCEPT 1142 packets, 2412K bytes)
>>  pkts bytes target     prot opt in     out     source destination
>> =20
>> root@ebox:~# iptables -t nat -L -n -v
>> Chain PREROUTING (policy ACCEPT 36378 packets, 2383K bytes)
>>=20
>> Chain INPUT (policy ACCEPT 19982 packets, 1334K bytes)
>>  pkts bytes target     prot opt in     out     source               =
destination        =20
>>=20
>> Chain OUTPUT (policy ACCEPT 61430 packets, 4601K bytes)
>>  pkts bytes target     prot opt in     out     source               =
destination        =20
>>=20
>> Chain POSTROUTING (policy ACCEPT 8333 packets, 564K bytes)
>>  pkts bytes target     prot opt in     out     source               =
destination        =20
>> 69488 5081K SNAT       all  --  *      eth0    0.0.0.0/0            =
0.0.0.0/0            to:23.92.25.96
>>=20
>>   =20
>> From a second computer "vostro", I can now use ebox as a gateway:
>>=20
>> root@vostro:~# ip route add 190.93.249.164 via 192.168.12.1
>>=20
>> This works fine, now connections to whatismyip.com (190.93.249.164) =
go
>> through ebox.
>>=20
>> However, when I try to be a bit more selective on vostro and use a
>> special routing table, things don't work anymore:
>>=20
>> root@vostro:~# iptables -t mangle -L -n
>> Chain PREROUTING (policy ACCEPT)
>> target     prot opt source               destination        =20
>>=20
>> Chain INPUT (policy ACCEPT)
>> target     prot opt source               destination        =20
>>=20
>> Chain FORWARD (policy ACCEPT)
>> target     prot opt source               destination        =20
>>=20
>> Chain OUTPUT (policy ACCEPT)
>> target     prot opt source               destination        =20
>> MARK       tcp  --  0.0.0.0/0            190.93.249.164       tcp dp=
t:80 MARK set 0x1
>> LOG        tcp  --  0.0.0.0/0            190.93.249.164       tcp dp=
t:80 LOG flags 0 level 4 prefix "marked: "
>>=20
>> Chain POSTROUTING (policy ACCEPT)
>> target     prot opt source               destination        =20
>>=20
>> root@vostro:~# ip route del 190.93.249.164 via 192.168.12.1
>> root@vostro:~# ip route add default via 192.168.12.1 table tovpn
>> root@vostro:~# ip rule add fwmark 0x1 table tovpn
>>=20
>> Now connections from vostro to 190.93.249.164 still make it to ebox,=
 and
>> from ebox to 190.93.249.164, but the answers get stuck on ebox:
>>=20
>> Sep 13 04:47:53 ebox kernel: Rejected forwarding: IN=3Deth0 OUT=3Det=
h0 MAC=3Df2:3c:91:69:db:07:84:78:ac:0d:79:c1:08:00 SRC=3D190.93.249.164=
 DST=3D192.168.17.47 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D58 ID=3D0 DF=
 PROTO=3DTCP SPT=3D80 DPT=3D39024 WINDOW=3D14480 RES=3D0x00 ACK SYN URG=
P=3D0=20
>>=20
>> It seems that ebox tries to send the packet destined to go trough th=
e
>> rath to eth0 instead, and consequency rejects them because forwardin=
g is
>> only enabled from eth0 to rath.
>>=20
>> However, this only happens when vostro has the gateway route set in =
a
>> special routing table rather than the default table -- but how does =
ebox
>> even know about that?
>>=20
>> Can someone explain to me what is happening here and why?
>>=20
>>=20
>>=20
>> Best,
>>=20
>>    -Nikolaus
>>=20
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


   -Nikolaus

--=20
 =C2=BBTime flies like an arrow, fruit flies like a Banana.=C2=AB

  PGP fingerprint: 5B93 61F8 4EA2 E279 ABF6  02CF A9AD B7F8 AE4E 425C

