From: "Suzana Lojic-Skoric" <s_lojic@hotmail.com>
Subject: Re: DNS and NAT
Date: Fri, 15 Jul 2005 10:04:26 -0700
Message-ID: <BAY17-F13DB42FDB5C06B2BC6348480D00@phx.gbl>
References: <Pine.LNX.4.60.0507151241110.19372@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0507151241110.19372@darkstar.sysinfo.com>
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
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: dufresne@sysinfo.com
Cc: netfilter@lists.netfilter.org



>From: "R. DuFresne" <dufresne@sysinfo.com>
>To: Suzana Lojic-Skoric <s_lojic@hotmail.com>
>CC: harmuth@mnemon.de, netfilter@lists.netfilter.org
>Subject: Re: DNS and NAT
>Date: Fri, 15 Jul 2005 12:45:10 -0400 (EDT)
>
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>
>
>Has anyone checked to see if beside pre/post routing rules this person has=
=20
>added the ip add majik to make NAT more seamless, I'm of course assuming a=
=20
>1:1 NAT setup for a network rahter than masq.  And if they are using masq,=
=20
>perhaps a 1:1 NAT setup would quell their troubles so that it's IP based=20
>NAT rather then port based PNAT that is working against em...?
>
I have implemented PNAT on inbound direction, means incoming traffic (from =

outside to the NAT box) is port forwarded to appropriate servers inside. Wh=
y=20
would PNAT work against me?

Thanks,

Suzana

>Thanks,
>
>Ron DuFresne
>
>
>On Fri, 15 Jul 2005, Suzana Lojic-Skoric wrote:
>
>>
>>
>>>From: J=F6rg Harmuth <harmuth@mnemon.de>
>>>To: netfilter@lists.netfilter.org
>>>Subject: Re: DNS and NAT
>>>Date: Fri, 15 Jul 2005 10:53:17 +0200
>>>
>>>Suzana Lojic-Skoric schrieb:
>>>
>>> > I don't think proxy can help because it is just caching the web pages,
>>> > it does not change the IP addresses. I'll check if tunneling can help,
>>> > if not then I'll have to change iptables to inspect DNS answer and
>>> > replace the IP in the payload.
>>>
>>>No. Introducing a proxy at the right location, is much more than just
>>>caching web sites. It means significant changes to at least to the IP
>>>headers.
>>>
>>>Wether a proxy helps you or not depends totally on where you place the
>>>proxy. If you place it on the nat box (like primero said) or between
>>>this nasty dropping box and the nat box, everything is probably fine.
>>>The requests will then go to 10.x.x.x and the answers will originate
>>>from 10.x.x.x. The e.g. google address of 216.239.39.99 is within the
>>>*data* part of the 4th packet - not in the headers (headers are
>>>src=3D10.y.y.y dst=3D10.x.x.x). As long as the nasty dropping box doesn't
>>>scan the packets payload for proxy requests and the like and drops them,
>>>everything should work.
>>
>>I can put the proxy on the NAT machine.
>>As I said, right now just with the NAT, if I send a DNS request for the=20
>>google.com from the client 10.0.0.1 behind the nasty dropping box, it wil=
l=20
>>go out through the nasty dropping box and the NAT gateway. NAT will chang=
e=20
>>its 10.x.x.x source and destination from 10.x.x.x to some outside=20
>>addresses e.g. 150.x.x.x. The DNS answer comes back to NAT, it's source=20
>>and destination gets translated back to 10.x.x.x and 10.0.0.1 destination=
,=20
>>and the google address 216.239.39.99 is within the *data* part. This goes=
=20
>>fine through the nasty dropping box back to the client 10.0.0.1. Client=20
>>then takes the answer from the data part of the message, which is=20
>>216.239.39.99 and tries to contact it. It sends an HTTP message to=20
>>destination 216.239.39.99. This gets dropped on the nasty dropping box=20
>>since it is not 10.x.x.x (This is what's happening when you type in=20
>>www.google.com in the browser on the client 10.0.0.1).
>>So the DNS request and answer can get through the internal network, but=20
>>what I need is to somehow replace the 216.239.39.99 that is embedded in=20
>>the DNS *data* with 10.z.z.z. Also my NAT needs to know that 10.z.z.z is =

>>actually 216.239.39.99. to be able to translate it for outside.
>>
>>Do you still think proxy can help?
>>>
>>>If, on the other side, it is only possible to place the proxy between
>>>the clients and this nasty dropping box, you're out of luck and a proxy
>>>helps nothing at all. But as far as I understood - and you provided
>>>information - you have access to the nat box. So, this should not be the
>>>case.
>>>
>>>BTW, would you please be so kind and provide sufficient information
>>>about your problem in the first posting (introducing this nasty box
>>>changes the whole situation) ? This way people who want to help you do
>>>not have to feel like the "Oracle of Delphi" ;) Thanks.
>>
>>I'll do it next time :) I was afraid it would be too long for anybody to =

>>read it. Thanks for your help.
>>
>>Suzana
>>
>>>
>>>Have a nice time,
>>>
>>>Joerg
>>>
>>>
>>
>>_________________________________________________________________
>>Take advantage of powerful junk e-mail filters built on patented=20
>>Microsoft=AE SmartScreen Technology.=20
>>http://join.msn.com/?pgmarket=3Den-ca&page=3Dbyoa/prem&xAPID=3D1994&DI=3D=
1034&SU=3Dhttp://hotmail.com/enca&HL=3DMarket_MSNIS_Taglines=20
>>Start enjoying all the benefits of MSN=AE Premium right now and get the=20
>>first two months FREE*.
>>
>>
>
>- -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         admin & senior security consultant:  sysinfo.com
>                         http://sysinfo.com
>Key fingerprint =3D 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
>
>...We waste time looking for the perfect lover
>instead of creating the perfect love.
>
>                 -Tom Robbins <Still Life With Woodpecker>
>-----BEGIN PGP SIGNATURE-----
>Version: GnuPG v1.2.4 (GNU/Linux)
>
>iD8DBQFC1+gast+vzJSwZikRAoIFAKCcx6voNEBSZNMlpZjTJIftXWUplwCcCV4K
>ETadeRA1YWhhsaNAASuZCsk=3D
>=3DPbUZ
>-----END PGP SIGNATURE-----

_________________________________________________________________
Take advantage of powerful junk e-mail filters built on patented Microsoft=
=AE=20
SmartScreen Technology.=20
http://join.msn.com/?pgmarket=3Den-ca&page=3Dbyoa/prem&xAPID=3D1994&DI=3D10=
34&SU=3Dhttp://hotmail.com/enca&HL=3DMarket_MSNIS_Taglines=20
  Start enjoying all the benefits of MSN=AE Premium right now and get the=20
first two months FREE*.


