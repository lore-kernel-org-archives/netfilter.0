From: Christophe SUIRE <christophe.suire@adelux.fr>
Subject: Re: NAT performance
Date: Fri, 13 May 2005 10:33:05 +0200
Message-ID: <A1364254-5C3D-48E2-A68C-2445EBA486D1@adelux.fr>
References: <80E06785-6636-4481-ABD1-6C6C28D52629@adelux.fr>
	<4283EEB7.7010207@riverviewtech.net>
	<02A7CEB4-AD81-4D92-BD1A-A2A5EB00AFF9@adelux.fr>
	<Pine.LNX.4.60.0505130423320.5558@darkstar.sysinfo.com>
Mime-Version: 1.0 (Apple Message framework v728)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0505130423320.5558@darkstar.sysinfo.com>
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
Content-Type: text/plain; charset="iso-8859-1"; delsp="yes"; format="flowed"
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: netfilter@lists.netfilter.org

Hi,

This not a problem with the network card, because when i do the test =20
with only firewall routing i have a total bandwidth used near to =20
500Mbit/s.
But when i add an SNAT translation for each network (10) the total =20
bandwidth used is near 170Mbit/s.
So why this important difference without an with NAT ??

Thx.
--=20
Christophe Suire


Le 13 mai 05 =E0 10:24, R. DuFresne a =E9crit :

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On Fri, 13 May 2005, Christophe SUIRE wrote:
>
>
>> Hi,
>>
>> The hardware is :
>>    Xeon 3,4Ghz
>>    1Go of RAM
>>    Intel Giga cards for public an private network (e1000 driver)
>>    2 SCSI U320 Raid 1 hard drives
>>
>> The system is :
>>    Debian Sarge
>>    Kernel 2.6.8
>>    iptables 1.2.11
>>
>> Thanks a lot.
>> -- Christophe
>>
>> Le 13 mai 05 =E0 02:03, Taylor, Grant a =E9crit :
>>
>>
>>> Christophe SUIRE wrote:
>>>
>>>> Hi,
>>>> I have done some tests, and i'm surprise with the poor result =20
>>>> with NAT.
>>>> I have a linux firewall, 2.6.8 kernel, one card for public =20
>>>> network,  and one card for the lan.
>>>> All cards are giga bit cards.
>>>> I have 10 PC which are each in a VLAN, and with a gateway which =20
>>>> is  the virtual VLAN interface under the firewall link with the =20
>>>> lan card.
>>>> I have 5 switch with a 100Mbit/s uplink to the firewall (with a =20
>>>> giga bit backbone switch). I have 2PC under each switch. So in =20
>>>> theory each PC have 50Mbit/s of bandwidth.
>>>> Each PC have 10 alias ip, so i have 10 networks with 10 virtuals =20=

>>>> clients under each network.
>>>> So each virtual client (100) have 5Mbit/s of bandwidth.
>>>> On the firewall each vlan network is SNAT to go out to the =20
>>>> internet.
>>>> My bandwidth test is done with TPTEST, and a TPTEST server under =20=

>>>> the public network of the firewall.
>>>> My procedure is : tcp-receive of 50Mo
>>>>     launch the test for 1 virtual client and get the time
>>>>     launch the test for 2 virtuals clients together and get the =20
>>>> time for each
>>>>     ....
>>>>     launch the test for 100 virtuals ...
>>>> When i do my test without NAT, just routing, the total bandwidth =20=

>>>> used is near to 500Mbit/s, which is great !
>>>> But when i do my test with NAT, the total bandwidth used is near =20=

>>>> to 170Mbit/s !!! So i have an import drop of the performance !
>>>> And this bandwidth is the same from 20 virtuals clients to 100  =20
>>>> virtuals clients.
>>>> So i understand that NAT need to rewrite all packets .. but here =20=

>>>> the performance is very poor.
>>>> If someone can explain me why ??
>>>>
>
>
> If you are doing this all at once, you are likely saturating the =20
> choke points <firewalls> network interface.  All traffic is passing =20=

> there, unless of course you have multi interfaces.
>
>
> Thanks,
>
>
> Ron DuFresne
> - -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         admin & senior security consultant:  sysinfo.com
>                         http://sysinfo.com
> Key fingerprint =3D 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
>
> ...We waste time looking for the perfect lover
> instead of creating the perfect love.
>
>                 -Tom Robbins <Still Life With Woodpecker>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
>
> iD8DBQFChGRUst+vzJSwZikRAuN4AKCKNvvsHiK5f6bH7i5R47n7Ha2KRACfae+y
> xBwrHTBFFkRA+uEM1wTHkXA=3D
> =3D+THk
> -----END PGP SIGNATURE-----


