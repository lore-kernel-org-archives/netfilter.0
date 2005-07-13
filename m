From: "Suzana Lojic-Skoric" <s_lojic@hotmail.com>
Subject: Re: DNS and NAT
Date: Wed, 13 Jul 2005 10:10:34 -0700
Message-ID: <BAY17-F38777EAEDFBB8C87681F8C80DE0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org



>From: /dev/rob0 <rob0@gmx.co.uk>
>To: netfilter@lists.netfilter.org
>Subject: Re: DNS and NAT
>Date: Mon, 11 Jul 2005 16:25:20 -0500
>
>Please don't top-post. Thank you.
>
>Suzana Lojic-Skoric wrote:
>>OK, thanks I was not sure what is the proper behavior regarding
>>iptables and DNS.
>
>The usual situation is that clients are NAT'ed out, like what you're=20
>describing.
>
>>If answer is not translated then how do I get DNS to work with two way=20
>>NAT?
>
>What does not work? Two-way NAT is fine. You go on to say you're not reall=
y=20
>talking about two-way NAT:
>
>>My internal network does not understand any of the ip addresses that=20
>>belong to outside. So if the request for a page that is sent from interna=
l=20
>>network comes back from outside with an answer (ip address) that is not=20
>>getting translated then I can't resolve the page since my internal networ=
k=20
>>doesn't understand it and can't route to it.
>
>Clients need to have a default route through the NAT gateway, which does=20
>SNAT or MASQUERADE. How is it two-way if the clients can't route out?
>
I have an internal network that has one set of addresses and outside networ=
k=20
that has
a different set of addresses. I am using NAT for the sole purpose of=20
translation. Both inside and outside network have DNS servers, mail=20
servers,.... Both networks need to talk to each other, send mail and reques=
t=20
web pages... I have a control of inside network but not the outside ntw.

When the client from outside sends a DNS query to the inside ntw I guess I =

can implement split DNS as Jason Opperisano suggested and get it working=20
that way. The outside world will get a web page from external view and will=
=20
have answer from global outside address, the inside world will get answer=20
from internal view with inside global ip.

The problem is I don't understand how it is supposed to work when the clien=
t=20
is inside and sending a request for a page whose server happens to be=20
outside...
I have a default route through the NAT, so when a client on the inside=20
network
sends a DNS query it goes out through the NAT, in my case both source
and destination gets translated and forwarded to outside DNS server.( I hav=
e=20
to translate the destination as well because the clients on internal networ=
k=20
send a request to an internal DNS server with the internal IP address as=20
destination. So the request gets forwarded to the outside world through the=
=20
NAT and both SNAT-ed and DNAT-ed.) When the answer comes back to NAT, the=20
outside source and destination IP gets translated back to the internal=20
addresses, but the actual IP that resolves the requested page is embedded i=
n=20
the message, and it does not get translated ( it is outside IP) When the=20
client gets the answer, it processes it, gets the outside IP from the=20
message and try talk to it. But this is outside IP and inside clients can't=
=20
route to it.

I am trying to understand how is this supposed to work. I can't quite use=20
the wisdom from masquerade because masquerade is simpler, masquerade=20
messages are only SNAT-ed, meaning only source address is translated and=20
when the request comes back it is then DNAT-ed to internal network, meaning=
=20
destination is translated so the message can find your machine. But you=20
don't care that google.com resolved as 216.239.39.99 because your NAT is on=
e=20
way NAT in you can talk to 216.239.39.99. In my case, I have to translate=20
the 216.239.39.99 to something else (for example 10.1.1.1) so that the=20
inside network can talk to it. And then on the exit through the nat 10.1.1.=
1=20
will be translated back to 216.239.39.99. The problem is I have no way of=20
translating the 216.239.39.99 to 10.1.1.1 because iptables NAT does not=20
inspect the payload of the DNS answer and does not translate it. ... and=20
this is how iptables is supposed to work.

I have both DNAT and SNAT happening both ways, when the message goes out an=
d=20
comes back in. All messages on inside network mast have both source and=20
destination from the inside IP address range. Also I can't advertise my=20
inside addresses to the outside world.


>>Is there a way around this problem? How do I get DNS to work in the type =

>>of environment I described?
>
>If you don't want to allow NAT clients out for some reason, you might chec=
k=20
>into running proxy servers, such as squid for HTTP/FTP. Only the services =

>you are proxying can be used by internal clients. SOCKS proxy servers can =

>handle multiple protocols, but I don't know anything more about it than=20
>just that fact.
>
>Proxy servers are a good choice in some circumstances; you maintain maximu=
m=20
>control over what clients can and cannot do (unless users have shell acces=
s=20
>to the proxy server, perhaps.) But proxying is far more resource-intensive=
=20
>than NAT.
>--
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header
>

_________________________________________________________________
Take charge with a pop-up guard built on patented Microsoft=AE SmartScreen =

Technology =20
http://join.msn.com/?pgmarket=3Den-ca&page=3Dbyoa/prem&xAPID=3D1994&DI=3D10=
34&SU=3Dhttp://hotmail.com/enca&HL=3DMarket_MSNIS_Taglines=20
  Start enjoying all the benefits of MSN=AE Premium right now and get the=20
first two months FREE*.


