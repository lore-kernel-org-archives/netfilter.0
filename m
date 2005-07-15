From: "Suzana Lojic-Skoric" <s_lojic@hotmail.com>
Subject: Re: DNS and NAT
Date: Fri, 15 Jul 2005 12:51:44 -0700
Message-ID: <BAY17-F311126D99E98F47CCF65D580D00@phx.gbl>
References: <42D805E2.4050004@fastwebnet.it>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42D805E2.4050004@fastwebnet.it>
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
To: primero@fastwebnet.it, netfilter@lists.netfilter.org



>From: Francesco Ciocchetti <primero@fastwebnet.it>
>To: netfilter@lists.netfilter.org
>Subject: Re: DNS and NAT
>Date: Fri, 15 Jul 2005 20:52:18 +0200
>
>Suzana Lojic-Skoric wrote:
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
>>
>with a *standard proxy* configured on the browser of client 10.0.0.1 your =

>request for 216.239.39.99 will be in the payload of the proxy request that=
=20
>has the IP address of your proxy machine in the destination address field =

>of the network layer ... it should be good for your nasty dropping box.
From there the HTTP request will be managed from your proxy wich will=20
>answer to your client with a connection completely inside the 10.x.x.x=20
>network.
>
>
>bye
><f>

Do you know if split DNS installed on the NAT gateway would do the trick=20
too?

Thanks,
Suzana


>

_________________________________________________________________
Take charge with a pop-up guard built on patented Microsoft=AE SmartScreen =

Technology.=20
http://join.msn.com/?pgmarket=3Den-ca&page=3Dbyoa/prem&xAPID=3D1994&DI=3D10=
34&SU=3Dhttp://hotmail.com/enca&HL=3DMarket_MSNIS_Taglines=20
  Start enjoying all the benefits of MSN=AE Premium right now and get the=20
first two months FREE*.


