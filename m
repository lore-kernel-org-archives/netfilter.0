From: "Suzana Lojic-Skoric" <s_lojic@hotmail.com>
Subject: Re: DNS and NAT
Date: Thu, 14 Jul 2005 13:33:32 -0700
Message-ID: <BAY17-F66FBC4C2BEA443DA8F48A80D10@phx.gbl>
References: <42D68C3B.30002@fastwebnet.it>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42D68C3B.30002@fastwebnet.it>
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
To: primero@fastwebnet.it
Cc: netfilter@lists.netfilter.org



>From: primero <primero@fastwebnet.it>
>To: Suzana Lojic-Skoric <s_lojic@hotmail.com>
>CC: harmuth@mnemon.de, netfilter@lists.netfilter.org
>Subject: Re: DNS and NAT
>Date: Thu, 14 Jul 2005 18:00:59 +0200
>
>Suzana Lojic-Skoric wrote:
>
>>>iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>>>
>>>and everything is as described.
>>>
>>Yes, you are right, but the problem is between my inside client and the=20
>>NAT gateway I have a machine that drops everything that is not 10.x.x.x. =
I=20
>>know, I know, it is insane... but my job is to find a solution for DNS in=
=20
>>such network.
>>
>>So basically, my inside network can only route 10.x.x.x and everything=20
>>else is dropped.
>>
>>>As /dev/rob0 pointed out, if you don't want your clients to talk with
>>>google directly use proxies.
>>>
>>
>>I'll check out the proxy idea. Thanks for your input.
>>
>>Suzana
>>
>You could use a Proxy but this would not solve your problem of 'have a=20
>machine that drops everything that is not 10.x.x.x' ... even with a proxy =

>you would need that at least that machine would be able to access Public=20
>Big Internet.
>
>Maybe i missed the point ... but if you can not access anything else then =

>10.x.x.x because something beetween clients and DefaultGW would drop it i =

>don't see any escape other then configuring the proxy on your NAT Device=20
>because it should have not problem accessing the Public Internet.
>
>Bye
>Francesco

I don't think proxy can help because it is just caching the web pages, it=20
does not change the IP addresses. I'll check if tunneling can help, if not =

then I'll have to change iptables to inspect DNS answer and replace the IP =

in the payload.

Thanks for help,
Suzana

_________________________________________________________________
Take advantage of powerful junk e-mail filters built on patented Microsoft=
=AE=20
SmartScreen Technology.=20
http://join.msn.com/?pgmarket=3Den-ca&page=3Dbyoa/prem&xAPID=3D1994&DI=3D10=
34&SU=3Dhttp://hotmail.com/enca&HL=3DMarket_MSNIS_Taglines=20
  Start enjoying all the benefits of MSN=AE Premium right now and get the=20
first two months FREE*.


