From: muhaimin <muhaimin.dzulfakar@extol.com.my>
Subject: Re: iptables and keepalived
Date: Thu, 28 Jul 2005 22:10:27 -0700
Message-ID: <42E9BA43.8070007@extol.com.my>
References: <42E8F8C8.5080609@extol.com.my> <42E8FADD.2000909@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42E8FADD.2000909@mnemon.de>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>, netfilter@lists.netfilter.org

J=F6rg Harmuth wrote:

>muhaimin schrieb:
> =20
>
>>I try keepalived on the firewall.With normal configuration, i could ping
>>internal machine to external network.The problem is when i use virtual
>>ip address (assigned by keepalived), i couldnt ping the external
>>network.Maybe the iptables cant identify the virtual ip.Is there any way
>>i can do to solve this ?
>>   =20
>>
>
>May be. It could be helpful to post your rules and the output of
>ifconfig and other things that might be involved.
>
>Have a nice time,
>
>Joerg
>
>
>
> =20
>
J=F6rg Harmuth wrote:

>muhaimin schrieb:
> =20
>
>>I try keepalived on the firewall.With normal configuration, i could ping
>>internal machine to external network.The problem is when i use virtual
>>ip address (assigned by keepalived), i couldnt ping the external
>>network.Maybe the iptables cant identify the virtual ip.Is there any way
>>i can do to solve this ?
>>   =20
>>
>
>May be. It could be helpful to post your rules and the output of
>ifconfig and other things that might be involved.
>
>Have a nice time,
>
>Joerg
> =20
>

You cant view your virtual interface with keepalived.It doesnt use=20
something like eth0:0.I can just see my real interface

eth0      Link encap:Ethernet  HWaddr 00:11:25:AB:3F:F4=20
          inet addr:10.1.1.102  Bcast:10.255.255.255  Mask:255.0.0.0
          inet6 addr: fe80::211:25ff:feab:3ff4/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:3179 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1107 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:333415 (325.6 KiB)  TX bytes:526997 (514.6 KiB)
          Base address:0x2000 Memory:d0120000-d0140000

eth1      Link encap:Ethernet  HWaddr 00:11:25:AB:3F:F5=20
          inet addr:192.168.1.33  Bcast:192.255.255.255  Mask:255.0.0.0
          inet6 addr: fe80::211:25ff:feab:3ff5/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:13 errors:0 dropped:0 overruns:0 frame:0
          TX packets:10 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:832 (832.0 b)  TX bytes:718 (718.0 b)
          Base address:0x4400 Memory:d0340000-d0360000

lo        Link encap:Local Loopback=20
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:8 errors:0 dropped:0 overruns:0 frame:0
          TX packets:8 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:560 (560.0 b)  TX bytes:560 (560.0 b)

But i can ping my virtual interface.But not the internal machine.In the=20
normal configuration, here is my architecture.


         pc1 ------------eth0 [firewall ] eth0---------------pc2


=20

>I use eth0 ip as gateway for pc1 and eth0 as a gateway for pc2.I can just =
ping until eth0 for pc1 until i do this in my iptables
> =20
>

$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

echo "   FWD: Allow all connections OUT and only existing and related=20
ones IN"
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state=20
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG

echo "   Enabling SNAT (MASQUERADE) functionality on $EXTIF"
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

Note that EXTIF=3D eth0.

Then, i can ping pc2 from pc1.

But when i change both gateway to virtual ip of eth0 and eth1.I cant=20
ping both machine.So i suspect iptables doesnt not recognise virtual ip=20
of eth0.



--=20
Muhaimin Dzulfakar
Security Engineer
Extol Corporation (M) Sdn Bhd


