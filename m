From: "Stephan Lucas" <stephan.lucas@fhtw-berlin.de>
Subject: Fw: Re: trouble with masquerade
Date: Tue, 28 Jan 2003 21:42:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301282034.h0SKYvXJ017432@hermes.rz.fhtw-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hello,
 
=3D =3D =3D =3D =3D =3D This is a forward message =3D =3D =3D =3D =3D =3D =3D

Original serder's name:    Diego Sarasua 
Original serder's address: debian@sarasuasys.com.ar

>hi , i have the same config on my GW and i can acces to that=
 page , i know
>it doesn=B4t serve to U
>but maybe is a problem of client
>try to change MTU on eth0 and eth1 (ifconfig eth0 mtu=
 1472,ifconfig eth1 mtu
>1472)on GW to 1472 maybe its a MTU problem
>or cahnge the mtu on clients
>bye
>diego

thank. this didnt fix my problem, but with this info i have now=
 the solution. i mean its written in
the kernel sources:
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS=
 --clamp-mss-to-pmtu

and whoop.. it works

so thanks, for the hint
>
>----- Original Message -----
>From: "Stephan Lucas" <stephan.lucas@fhtw-berlin.de>
>To: <netfilter@lists.netfilter.org>
>Sent: Monday, January 27, 2003 8:50 AM
>Subject: trouble with masquerade
>
>
>> hello,
>> i have a big problem with my router.
>>
>> i installed a dsl-card into my linux-box and got the router to=
 run. i
>> use nat with masquerading like that:
>> # iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>>
>> all is wonderfully and i can access most of the sites /=
 services..
>> .but only most.
>>
>> i have many trouble with one big web page (gmx.de). i tryed to=
 access this
>> page once from my router and from my masqueraded client. i got=
 two
>statements.
>> on means that i can access the other means i can not.
>>
>> this is my router:
>> traceroute to www.gmx.de (213.165.65.100), 30 hops max, 40=
 byte packets
>>  1  217.5.98.178 (217.5.98.178)  51.24 ms  51.194 ms  78.382=
 ms
>>  2  217.237.157.130 (217.237.157.130)  49.83 ms  50.141 ms =
 49.827 ms
>>  3  INXS-gw20.M.net.DTAG.DE (194.25.6.14)  61.395 ms  59.688=
 ms  59.583 ms
>>  4  62.156.128.226 (62.156.128.226)  57.412 ms  57.86 ms =
 56.333 ms
>>  5  www.gmx.net (213.165.65.100)  60.417 ms  60.223 ms  61.81=
 ms
>>
>> this my client: (i've translated the statements, because i get=
 a german
>>                  output here)
>> Routenverfolgung zu www.gmx.net [213.165.65.100]  =FCber maximal=
 30
>Abschnitte:
>>   1    10 ms   <10 ms   <10 ms  xerxes.home [192.168.0.1]
>>   2    50 ms    70 ms    50 ms  217.5.98.178
>>   3    60 ms    61 ms    50 ms  217.237.157.130
>>   4    60 ms    80 ms    70 ms  INXS-gw20.M.net.DTAG.DE=
 [194.25.6.14]
>>   5     *        *        *     out of time.
>>   6  62.156.128.226  meldet (report): Network is unreachable.
>>
>> may it be that the network (gmx.de) is masqueraded, too. and=
 this is the
>> reason of unreachable??
>>
>> please help.
>>
>> thanks
>>
>>
>>

=3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D =3D 
  
Best regards. 
  
Stephan Lucas
stephan.lucas@fhtw-berlin.de
2003-01-28 



