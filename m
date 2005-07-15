From: "Suzana Lojic-Skoric" <s_lojic@hotmail.com>
Subject: Re: DNS and NAT
Date: Fri, 15 Jul 2005 09:30:57 -0700
Message-ID: <BAY17-F18542F2DB3D75F41B0487580D00@phx.gbl>
References: <42D7797D.2050203@mnemon.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42D7797D.2050203@mnemon.de>
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
To: harmuth@mnemon.de, netfilter@lists.netfilter.org



>From: J=F6rg Harmuth <harmuth@mnemon.de>
>To: netfilter@lists.netfilter.org
>Subject: Re: DNS and NAT
>Date: Fri, 15 Jul 2005 10:53:17 +0200
>
>Suzana Lojic-Skoric schrieb:
>
> > I don't think proxy can help because it is just caching the web pages,
> > it does not change the IP addresses. I'll check if tunneling can help,
> > if not then I'll have to change iptables to inspect DNS answer and
> > replace the IP in the payload.
>
>No. Introducing a proxy at the right location, is much more than just
>caching web sites. It means significant changes to at least to the IP
>headers.
>
>Wether a proxy helps you or not depends totally on where you place the
>proxy. If you place it on the nat box (like primero said) or between
>this nasty dropping box and the nat box, everything is probably fine.
>The requests will then go to 10.x.x.x and the answers will originate
>from 10.x.x.x. The e.g. google address of 216.239.39.99 is within the
>*data* part of the 4th packet - not in the headers (headers are
>src=3D10.y.y.y dst=3D10.x.x.x). As long as the nasty dropping box doesn't
>scan the packets payload for proxy requests and the like and drops them,
>everything should work.

I can put the proxy on the NAT machine.
As I said, right now just with the NAT, if I send a DNS request for the=20
google.com from the client 10.0.0.1 behind the nasty dropping box, it will =

go out through the nasty dropping box and the NAT gateway. NAT will change =

its 10.x.x.x source and destination from 10.x.x.x to some outside addresses=
=20
e.g. 150.x.x.x. The DNS answer comes back to NAT, it's source and=20
destination gets translated back to 10.x.x.x and 10.0.0.1 destination, and =

the google address 216.239.39.99 is within the *data* part. This goes fine =

through the nasty dropping box back to the client 10.0.0.1. Client then=20
takes the answer from the data part of the message, which is 216.239.39.99 =

and tries to contact it. It sends an HTTP message to destination=20
216.239.39.99. This gets dropped on the nasty dropping box since it is not =

10.x.x.x (This is what's happening when you type in www.google.com in the=20
browser on the client 10.0.0.1).
So the DNS request and answer can get through the internal network, but wha=
t=20
I need is to somehow replace the 216.239.39.99 that is embedded in the DNS =

*data* with 10.z.z.z. Also my NAT needs to know that 10.z.z.z is actually=20
216.239.39.99. to be able to translate it for outside.

Do you still think proxy can help?
>
>If, on the other side, it is only possible to place the proxy between
>the clients and this nasty dropping box, you're out of luck and a proxy
>helps nothing at all. But as far as I understood - and you provided
>information - you have access to the nat box. So, this should not be the
>case.
>
>BTW, would you please be so kind and provide sufficient information
>about your problem in the first posting (introducing this nasty box
>changes the whole situation) ? This way people who want to help you do
>not have to feel like the "Oracle of Delphi" ;) Thanks.

I'll do it next time :) I was afraid it would be too long for anybody to=20
read it. Thanks for your help.

Suzana

>
>Have a nice time,
>
>Joerg
>
>

_________________________________________________________________
Take advantage of powerful junk e-mail filters built on patented Microsoft=
=AE=20
SmartScreen Technology.=20
http://join.msn.com/?pgmarket=3Den-ca&page=3Dbyoa/prem&xAPID=3D1994&DI=3D10=
34&SU=3Dhttp://hotmail.com/enca&HL=3DMarket_MSNIS_Taglines=20
  Start enjoying all the benefits of MSN=AE Premium right now and get the=20
first two months FREE*.


