From: Piotr Holubniak <piotr.holubniak@neostrada.pl>
Subject: Re: iptables spof address problem
Date: Thu, 29 Sep 2005 07:22:15 +0200
Message-ID: <433B7A07.4070008@neostrada.pl>
References: <E656E2CC1C5AEB42ACB00EB83122C7742E2EBE@farmer.vikus.com>
Reply-To: piotr.holubniak@neostrada.pl
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E656E2CC1C5AEB42ACB00EB83122C7742E2EBE@farmer.vikus.com>
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@lists.netfilter.org

Derick Anderson napisa=C5=82(a):

>=20
>Responses inline.
>
> =20
>
>>Hello everyone
>>
>>I have simple question.
>>
>>Lets assume that we have Linux with IP=3D10.0.0.2 with iptables=20
>>and it is logging all incomming ssh connection. Log file=20
>>contains both IP and MAC addresses of the computers which=20
>>bind to this service.
>>Lets assume that we have another PC connected into LAN with=20
>>IP=3D10.0.0.100.
>>
>>Attacker with IP  =3D 10.0.0.200 runs:
>>hping2  -S --spoof  10.0.0.100 -p 22 --faster 10.0.0.2  -=20
>>which will cause DoS of SSH service on 10.0.0.2
>>
>>Netfilter logs all incomming on 22 port traffic. It shows=20
>>that connections come from IP 10.0.0.100 and it shows real=20
>>MAC address of this computer (10.0.0.100) instead of MAC=20
>>address of attackers computer (IP 10.0.0.200).
>>
>>So result is that we think that real attacker is computer=20
>>with IP 10.0.0.100
>>   =20
>>
>
>I've never used hping before, but I believe when an IP address is
>spoofed correctly this is the expected behavior. Bits are bits.=20
>
> =20
>
>>Moreover.
>>
>>Lest assume that spoofed  address is IP which is not assignet=20
>>in the local network. Netfilter logs incomming traffic but it=20
>>shows MAC address unknown or completely unpredictable=20
>>(Windows shows all 0-ros, Linux 12 bytes long MAC address).
>>
>>Result is that we completely don't know who is the attacker,=20
>>cannot track him down even we have registered MAC addresses=20
>>of all computers in local network. =20
>>   =20
>>
>
> =20
>

This is not a question of routing Layer 2. All computers are in one
local network in the same subnet, so there is no need to route pakets.
This seems to me that even if data arrives to NIC of Linux computer with
netfilter, from computer with MAC address, this MAC address is unseen to
netfilter, because before it is passed to netfilter, TCP/IP stack tries
to resolve MAC sending ARP lookup. Sa finally netfilter gets wrong MAC.
Not sender but ARP lookup.

Tell me if I am wrong.

Regards

PiotrH

>MAC addresses are Layer 2. Layer 2 does not route, so at best you see
>the MAC address of the router. I'm not sure what you mean by all
>"0-ros"... I believe 00:00:00:00:00:00 is the "nothing" MAC address
>similar to 0.0.0.0 for IP (generally seen when a computer is requesting
>DHCP). ff:ff:ff:ff:ff:ff is used in ARP queries but I don't recall all
>0's being used.
>
> =20
>
>>It works like this with FC4, also have this problem on RedHat 3.0.
>>
>>How can I make netfilter to log MAC address of the attackers=20
>>computer, not this one which is resolved by TCP/IP stack ? Is=20
>>it possible?
>>
>>Regards
>>
>>PiotrH
>>   =20
>>
>
>You can't. Netfilter uses the kernel stack like every other program
>(someone correct me if I'm wrong). You could try using ARPWatch to help
>you monitor your network but even then I believe a successful MAC/IP
>spoof will go unnoticed.
>
>Derick Anderson
>
>
>
> =20
>



