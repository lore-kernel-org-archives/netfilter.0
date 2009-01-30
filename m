From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Subject: Re: icmp forward
Date: Fri, 30 Jan 2009 12:24:19 +0100
Message-ID: <4982E363.6070005@cetrtapot.si>
References: <4982B7F3.4020603@cetrtapot.si> <200901300949.39955.christoph.paasch@gmail.com> <4982C494.50505@cetrtapot.si> <4982DC10.6020903@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4982DC10.6020903@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Pascal Hambourg wrote:
> Hello,
>=20
> Hinko Kocevar a =C3=A9crit :
>> Christoph Paasch wrote:
>>>
>>> On Fri January 30 2009, Hinko Kocevar wrote:
>>>>
>>>> Is it possible to 'port forward' ICMP requests?
>>>
>>> You can match the protocol on ICMP packets with -p icmp and let the
>>> port-
>>> specific stuff out of it, as ICMP doesn't uses portnumbers. But the
>>> problem will be, that your external machine won't be reachable for
>>> icmp packets. (as every icmp packets will get forwarded) It may be
>>> ennoying if MTU or ping packets doesn't reach anymore your machine.
>>> That depends on the usage of your gateway.
>>
>> Yes, that is what I was afraid of. I think that gateway should still
>> remain
>> available for ICMP echo-reply from external network.
>=20
> You must not be afraid of redirecting incoming ICMP replies or error
> messages originally destined to the gateway to the mobile device. The=
se
> messages have the state ESTABLISHED or RELATED, while NAT rules see o=
nly
> packets creating a new "connection", which have the state NEW. Even
> though, you could have your DNAT rule match only the echo-request typ=
e
> with the --icmp-type option. However, if you redirect ICMP echo reque=
st
> to the device, indeed you cannot ping the gateway any more on the sam=
e
> external address. You need a separate address.

Not quite sure what it is all about, but is it doing something like:
# ifconfig eth0:1 172.31.64.121 netmask 255.255.254.0 up

And later..
# iptables -A FORWARD -p icmp --icmp-type echo-request -j ACCEPT
# iptables -t nat -A PREROUTING -i eth0 -p icmp -j DNAT --to-destinatio=
n 10.1.1.2


=2E. looking at the ping replies on both external gateway IPs the resul=
ts seem
to indicate that ICMP on both IPs is reaching mobile device, instead of=
 gateway
on interface eth0:1 (172.31.64.121):
# ifconfig eth0
eth0      Link encap:Ethernet  HWaddr 00:16:F9:12:33:33 =20
          inet addr:172.31.64.126  Bcast:172.31.65.255  Mask:255.255.25=
4.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:20407 errors:0 dropped:0 overruns:35 frame:0
          TX packets:5630 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000=20
          RX bytes:1991148 (1.8 MiB)  TX bytes:554003 (541.0 KiB)
          Interrupt:17 DMA chan:1=20

# ifconfig eth0:1
eth0:1    Link encap:Ethernet  HWaddr 00:16:F9:12:33:33 =20
          inet addr:172.31.64.121  Bcast:172.31.65.255  Mask:255.255.25=
4.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          Interrupt:17 DMA chan:1=20

pinging both IP addresses from another LAN host produces:

64 bytes from 172.31.64.121: icmp_seq=3D54 ttl=3D64 time=3D1.24 ms
64 bytes from 172.31.64.121: icmp_seq=3D55 ttl=3D64 time=3D1.38 ms
64 bytes from 172.31.64.121: icmp_seq=3D56 ttl=3D64 time=3D1.29 ms
64 bytes from 172.31.64.121: icmp_seq=3D57 ttl=3D64 time=3D1.27 ms
^^^ here iptables rule for ICMP kick in ^^^
64 bytes from 172.31.64.121: icmp_seq=3D58 ttl=3D127 time=3D51.8 ms
64 bytes from 172.31.64.121: icmp_seq=3D59 ttl=3D127 time=3D21.4 ms
64 bytes from 172.31.64.121: icmp_seq=3D60 ttl=3D127 time=3D50.5 ms
64 bytes from 172.31.64.121: icmp_seq=3D61 ttl=3D127 time=3D20.6 ms

64 bytes from 172.31.64.126: icmp_seq=3D5318 ttl=3D64 time=3D1.30 ms
64 bytes from 172.31.64.126: icmp_seq=3D5319 ttl=3D64 time=3D1.35 ms
64 bytes from 172.31.64.126: icmp_seq=3D5320 ttl=3D64 time=3D1.30 ms
64 bytes from 172.31.64.126: icmp_seq=3D5321 ttl=3D64 time=3D1.41 ms
64 bytes from 172.31.64.126: icmp_seq=3D5322 ttl=3D64 time=3D1.31 ms
^^^ here iptables rule for ICMP kick in ^^^
64 bytes from 172.31.64.126: icmp_seq=3D5323 ttl=3D127 time=3D37.2 ms
64 bytes from 172.31.64.126: icmp_seq=3D5324 ttl=3D127 time=3D63.4 ms
64 bytes from 172.31.64.126: icmp_seq=3D5325 ttl=3D127 time=3D28.7 ms
64 bytes from 172.31.64.126: icmp_seq=3D5326 ttl=3D127 time=3D61.4 ms
64 bytes from 172.31.64.126: icmp_seq=3D5327 ttl=3D127 time=3D35.0 ms

This is not what I expected - shouldn't the request destined for eth0:1=
 be
answered by the gateway device?

Thank you,
Hinko

--=20
Hinko Ko=C4=8Devar, OSS developer
=C4=8CETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar@cetrtapot.si
http    www.cetrtapot.si

