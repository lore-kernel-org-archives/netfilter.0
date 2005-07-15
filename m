From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: DNS and NAT
Date: Fri, 15 Jul 2005 12:45:10 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0507151241110.19372@darkstar.sysinfo.com>
References: <BAY17-F18542F2DB3D75F41B0487580D00@phx.gbl>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1028002384-1546989819-1121445910=:19372"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY17-F18542F2DB3D75F41B0487580D00@phx.gbl>
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
To: Suzana Lojic-Skoric <s_lojic@hotmail.com>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1028002384-1546989819-1121445910=:19372
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	j6FGjEfp019470

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Has anyone checked to see if beside pre/post routing rules this person ha=
s=20
added the ip add majik to make NAT more seamless, I'm of course assuming =
a=20
1:1 NAT setup for a network rahter than masq.  And if they are using masq=
,=20
perhaps a 1:1 NAT setup would quell their troubles so that it's IP based=20
NAT rather then port based PNAT that is working against em...?

Thanks,

Ron DuFresne


On Fri, 15 Jul 2005, Suzana Lojic-Skoric wrote:

>
>
>> From: J=F6rg Harmuth <harmuth@mnemon.de>
>> To: netfilter@lists.netfilter.org
>> Subject: Re: DNS and NAT
>> Date: Fri, 15 Jul 2005 10:53:17 +0200
>>=20
>> Suzana Lojic-Skoric schrieb:
>>=20
>> > I don't think proxy can help because it is just caching the web page=
s,
>> > it does not change the IP addresses. I'll check if tunneling can hel=
p,
>> > if not then I'll have to change iptables to inspect DNS answer and
>> > replace the IP in the payload.
>>=20
>> No. Introducing a proxy at the right location, is much more than just
>> caching web sites. It means significant changes to at least to the IP
>> headers.
>>=20
>> Wether a proxy helps you or not depends totally on where you place the
>> proxy. If you place it on the nat box (like primero said) or between
>> this nasty dropping box and the nat box, everything is probably fine.
>> The requests will then go to 10.x.x.x and the answers will originate
>> from 10.x.x.x. The e.g. google address of 216.239.39.99 is within the
>> *data* part of the 4th packet - not in the headers (headers are
>> src=3D10.y.y.y dst=3D10.x.x.x). As long as the nasty dropping box does=
n't
>> scan the packets payload for proxy requests and the like and drops the=
m,
>> everything should work.
>
> I can put the proxy on the NAT machine.
> As I said, right now just with the NAT, if I send a DNS request for the=
=20
> google.com from the client 10.0.0.1 behind the nasty dropping box, it w=
ill go=20
> out through the nasty dropping box and the NAT gateway. NAT will change=
 its=20
> 10.x.x.x source and destination from 10.x.x.x to some outside addresses=
 e.g.=20
> 150.x.x.x. The DNS answer comes back to NAT, it's source and destinatio=
n gets=20
> translated back to 10.x.x.x and 10.0.0.1 destination, and the google ad=
dress=20
> 216.239.39.99 is within the *data* part. This goes fine through the nas=
ty=20
> dropping box back to the client 10.0.0.1. Client then takes the answer =
from=20
> the data part of the message, which is 216.239.39.99 and tries to conta=
ct it.=20
> It sends an HTTP message to destination 216.239.39.99. This gets droppe=
d on=20
> the nasty dropping box since it is not 10.x.x.x (This is what's happeni=
ng=20
> when you type in www.google.com in the browser on the client 10.0.0.1).
> So the DNS request and answer can get through the internal network, but=
 what=20
> I need is to somehow replace the 216.239.39.99 that is embedded in the =
DNS=20
> *data* with 10.z.z.z. Also my NAT needs to know that 10.z.z.z is actual=
ly=20
> 216.239.39.99. to be able to translate it for outside.
>
> Do you still think proxy can help?
>>=20
>> If, on the other side, it is only possible to place the proxy between
>> the clients and this nasty dropping box, you're out of luck and a prox=
y
>> helps nothing at all. But as far as I understood - and you provided
>> information - you have access to the nat box. So, this should not be t=
he
>> case.
>>=20
>> BTW, would you please be so kind and provide sufficient information
>> about your problem in the first posting (introducing this nasty box
>> changes the whole situation) ? This way people who want to help you do
>> not have to feel like the "Oracle of Delphi" ;) Thanks.
>
> I'll do it next time :) I was afraid it would be too long for anybody t=
o read=20
> it. Thanks for your help.
>
> Suzana
>
>>=20
>> Have a nice time,
>>=20
>> Joerg
>>=20
>>=20
>
> _________________________________________________________________
> Take advantage of powerful junk e-mail filters built on patented Micros=
oft=AE=20
> SmartScreen Technology.=20
> http://join.msn.com/?pgmarket=3Den-ca&page=3Dbyoa/prem&xAPID=3D1994&DI=3D=
1034&SU=3Dhttp://hotmail.com/enca&HL=3DMarket_MSNIS_Taglines=20
> Start enjoying all the benefits of MSN=AE Premium right now and get the=
 first=20
> two months FREE*.
>
>

- --=20
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint =3D 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFC1+gast+vzJSwZikRAoIFAKCcx6voNEBSZNMlpZjTJIftXWUplwCcCV4K
ETadeRA1YWhhsaNAASuZCsk=3D
=3DPbUZ
-----END PGP SIGNATURE-----
--1028002384-1546989819-1121445910=:19372--

