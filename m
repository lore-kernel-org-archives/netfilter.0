From: Nikolaus Rath <Nikolaus@rath.org>
Subject: Re: Wrong routing when combining ip rule with SNAT
Date: Tue, 17 Sep 2013 17:58:13 -0700
Message-ID: <87hadjymhm.fsf@vostro.rath.org>
References: <8761u59uit.fsf@vostro.rath.org> <52379693.80707@ngtech.co.il>
	<87li2w9scf.fsf@vostro.rath.org> <5238D07A.2020509@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi Eliezer,

Thanks for all the explanations, but my VPN is all set up and running,
and routing through it works just fine. The question is just how to
gateway non-VPN packets to the external ip of the VPN through the VPN
connection as well.

Best,
Nikolaus

Eliezer Croitoru <eliezer@ngtech.co.il> writes:
> Hey Nokolaus,
>
> it really depends on the vpn tunnel software.
> Some adds another interface per each session and others know that the
> vpn is for a specific subnet.
> From the kernel point of view since there is an endpoint to the tunne=
l
> there should be a route either detected automatically by the kernel o=
r
> added when creating the tunnel device like in openvpn case.
>
> the basic issue is not tunneling non-VPN connections to the VPN node
> since most of the nodes should be routed by a single GW host that can
> have a keep-alived or any other method to just verify that this host =
is
> indeed up and running to prevent network outage.
>
> A basic network setup should have on GW and only one.
>
> If you do have a loaded network in hands make sure you study a bit fi=
rst
> on network infrastructure maintenance and not just "by the book" but
> also hands-on experience that will give you much more power in hands
> when handling a small blinking light.
>
> In pptpd it works in another way which in not stricktly routing but a=
lso
> masquerading in many cases unless you are using a default route and a=
lso
> a range of dedicated addreses.
> the basic setup should be in many cases:
> gw <--<>--> network.
>
> the GW has access to the network and also to the internet or any
> external network.
> when the network only GW is also the VPN server and NAT(MASQUERADE) a=
ll
> other issues are smaller to handle.
> Install a GW once or twice and you will see how that magic of the ker=
nel
> works fine.
> the only main rule in this case that should be on is the MAQUERADE on
> the external interface and the allow rules for the VPN.
> Else then that just be creative on how much access you need to the ne=
twork.
> monowall was a nice firewall but pfsense is a much more sensible
> solution for most networks.
>
> If you want to use strictly Linux and not any BSD OpenSUSE, CentOS,
> UBUNTU are great options but depends on your clients you will need to
> choose the Distro.
>
> (if you need more help just ask)
>
> Eliezer
>
> On 09/17/2013 03:58 AM, Nikolaus Rath wrote:
>> Hi Eliezer,
>>=20
>> I have a VPN connection, and I want to tunnel everything through the=
 VPN
>> node -- except, of course, the VPN connection itself.
>>=20
>> The hard part is to also tunnel non-VPN connections to the VPN node
>> itself. In other words how do I make sure that every connection to t=
he
>> external ip of the VPN node is tunneled through its internal ip --
>> except for the packets that form the tunnel itself?
>>=20
>> My idea was install a default route to the internal ip of the VPN no=
de,
>> use iptables to mark the VPN connections and then set up a special
>> routing table for those. But maybe there's an easier way?
>>=20
>> Best,
>> Nikolaus
>>=20
>> Eliezer Croitoru <eliezer@ngtech.co.il> writes:
>>> Hey there,
>>>
>>> What are you trying to achieve exactly?
>>> I tried to understand the network topology and the network issues b=
ut
>>> since you did not marked a target to what you want to actually get.
>>> There is an option to actually understand the situation you are in =
by
>>> just describing the need and the situation and then continue from t=
here.
>>>
>>> Hope for the best
>>> Eliezer
>>>
>>> On 09/13/2013 08:10 AM, Nikolaus Rath wrote:
>>>> Hello,
>>>>
>>>> Thanks for working on this great networking stack!
>>>>
>>>> I'm trying to set up a configuration with SNAT and routing rules, =
but
>>>> I'm having weird problems that I do not understand:
>>>>
>>>> I've enabled packet forwarding and SNAT on the "ebox" computer as
>>>> follows:
>>>>
>>>> root@ebox:~# ip route
>>>> default via 23.92.25.1 dev eth0=20
>>>> 23.92.25.0/24 dev eth0  proto kernel  scope link  src 23.92.25.96=20
>>>> 192.168.12.0/24 dev rath  proto kernel  scope link  src 192.168.12=
=2E1=20
>>>>
>>>> root@ebox:~# iptables  -L -n -v
>>>> Chain INPUT (policy ACCEPT 1314 packets, 1736K bytes)
>>>>  pkts bytes target     prot opt in     out     source             =
  destination        =20
>>>>
>>>> Chain FORWARD (policy DROP 0 packets, 0 bytes)
>>>>  pkts bytes target     prot opt in     out     source             =
  destination        =20
>>>>  150K   62M ACCEPT     all  --  rath   eth0    0.0.0.0/0          =
  0.0.0.0/0          =20
>>>> 86746  200M ACCEPT     all  --  eth0   rath    0.0.0.0/0          =
  0.0.0.0/0            state RELATED,ESTABLISHED
>>>>   319 22076 LOG        all  --  *      *       0.0.0.0/0          =
  0.0.0.0/0            limit: avg 1/min burst 30 LOG flags 0 level 4 pr=
efix "Rejected forwarding: "
>>>>   393 26172 REJECT     all  --  *      *       0.0.0.0/0          =
  0.0.0.0/0            reject-with icmp-net-prohibited
>>>>
>>>> Chain OUTPUT (policy ACCEPT 1142 packets, 2412K bytes)
>>>>  pkts bytes target     prot opt in     out     source destination
>>>> =20
>>>> root@ebox:~# iptables -t nat -L -n -v
>>>> Chain PREROUTING (policy ACCEPT 36378 packets, 2383K bytes)
>>>>
>>>> Chain INPUT (policy ACCEPT 19982 packets, 1334K bytes)
>>>>  pkts bytes target     prot opt in     out     source             =
  destination        =20
>>>>
>>>> Chain OUTPUT (policy ACCEPT 61430 packets, 4601K bytes)
>>>>  pkts bytes target     prot opt in     out     source             =
  destination        =20
>>>>
>>>> Chain POSTROUTING (policy ACCEPT 8333 packets, 564K bytes)
>>>>  pkts bytes target     prot opt in     out     source             =
  destination        =20
>>>> 69488 5081K SNAT       all  --  *      eth0    0.0.0.0/0          =
  0.0.0.0/0            to:23.92.25.96
>>>>
>>>>   =20
>>>> From a second computer "vostro", I can now use ebox as a gateway:
>>>>
>>>> root@vostro:~# ip route add 190.93.249.164 via 192.168.12.1
>>>>
>>>> This works fine, now connections to whatismyip.com (190.93.249.164=
) go
>>>> through ebox.
>>>>
>>>> However, when I try to be a bit more selective on vostro and use a
>>>> special routing table, things don't work anymore:
>>>>
>>>> root@vostro:~# iptables -t mangle -L -n
>>>> Chain PREROUTING (policy ACCEPT)
>>>> target     prot opt source               destination        =20
>>>>
>>>> Chain INPUT (policy ACCEPT)
>>>> target     prot opt source               destination        =20
>>>>
>>>> Chain FORWARD (policy ACCEPT)
>>>> target     prot opt source               destination        =20
>>>>
>>>> Chain OUTPUT (policy ACCEPT)
>>>> target     prot opt source               destination        =20
>>>> MARK       tcp  --  0.0.0.0/0            190.93.249.164       tcp =
dpt:80 MARK set 0x1
>>>> LOG        tcp  --  0.0.0.0/0            190.93.249.164       tcp =
dpt:80 LOG flags 0 level 4 prefix "marked: "
>>>>
>>>> Chain POSTROUTING (policy ACCEPT)
>>>> target     prot opt source               destination        =20
>>>>
>>>> root@vostro:~# ip route del 190.93.249.164 via 192.168.12.1
>>>> root@vostro:~# ip route add default via 192.168.12.1 table tovpn
>>>> root@vostro:~# ip rule add fwmark 0x1 table tovpn
>>>>
>>>> Now connections from vostro to 190.93.249.164 still make it to ebo=
x, and
>>>> from ebox to 190.93.249.164, but the answers get stuck on ebox:
>>>>
>>>> Sep 13 04:47:53 ebox kernel: Rejected forwarding: IN=3Deth0 OUT=3D=
eth0 MAC=3Df2:3c:91:69:db:07:84:78:ac:0d:79:c1:08:00 SRC=3D190.93.249.1=
64 DST=3D192.168.17.47 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D58 ID=3D0 =
DF PROTO=3DTCP SPT=3D80 DPT=3D39024 WINDOW=3D14480 RES=3D0x00 ACK SYN U=
RGP=3D0=20
>>>>
>>>> It seems that ebox tries to send the packet destined to go trough =
the
>>>> rath to eth0 instead, and consequency rejects them because forward=
ing is
>>>> only enabled from eth0 to rath.
>>>>
>>>> However, this only happens when vostro has the gateway route set i=
n a
>>>> special routing table rather than the default table -- but how doe=
s ebox
>>>> even know about that?
>>>>
>>>> Can someone explain to me what is happening here and why?
>>>>
>>>>
>>>>
>>>> Best,
>>>>
>>>>    -Nikolaus
>>>>
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>=20
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

