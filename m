From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Redirecting ports in a bridge
Date: Tue, 22 Apr 2008 14:24:13 -0500
Message-ID: <480E3B5D.3020103@riverviewtech.net>
References: <48086990.5060000@juntadeandalucia.es> <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr> <48087E17.8080902@juntadeandalucia.es> <alpine.LNX.1.10.0804181328560.26385@fbirervta.pbzchgretzou.qr> <480888CE.3080400@juntadeandalucia.es> <4808B26F.4060205@riverviewtech.net> <480C3A6A.3090206@juntadeandalucia.es> <480D3FA2.4050000@riverviewtech.net> <480D8272.1020200@juntadeandalucia.es> <480DF644.8010302@riverviewtech.net> <480DFFFF.7090807@juntadeandalucia.es>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480DFFFF.7090807@juntadeandalucia.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/22/08 10:10, Javier Prieto Mart=EDnez wrote:
> Well.. I don't speak English very well, so it's easy to misunderstand=
 my=20
> posts :-)

That's ok.  You are doing just fine.  :)

> In your graph, "S" is my LAN with my all my servers and local=20
> workstations. When I say that "I don't want to mess with the real IPs=
",=20
> I mean I don't want to make any change within my LAN.

*nod*

Just to make sure that I understand you correctly, you do not want to=20
have to re-configure IP addresses on servers when you add or remove the=
=20
appliance but you do not care if a given server sees the traffic as=20
being to its self rather than the original address.  I.e.

C -> S1 (client sends traffic)
C -> S1 (router routes traffic)
C -> S1 (appliance receives traffic)
C -> S2 (and changes it to S2      )
C -> S2 (server 2 receives traffic)
S2 -> C (server 2 replies to traffic)
S2 -> C (appliance receives traffic)
S1 -> C (and changes it to S1      )
S1 -> C (router routes traffic)
S1 -> C (client receives traffic)

The key point is that S2 sees the traffic as being to (destination IP)=20
its self, rather than to S1.

If this is ok with you, then DNATing / SNATing will work just fine.

> The point of the redirection is that, when I need to make a change in=
=20
> one of my servers, I'd like my appliance to redirect all the traffic=20
> coming from the extranet ("C") to another server. For example, if I h=
ave=20
> to stop the web server while upgrading, I'd like all the traffic comi=
ng=20
> from outside to reach another web server with a catched version of my=
=20
> web page.

*nod*

> The proccess should be something like that:
>=20
> * C starts a connection to S1, port 80
> * R routes that packet to my LAN
> * A captures that packet, and changes the destintation to S2, port 80
> * S2 generates a response to C
> * A captures that packet, and changes its source to S1, port 80
> * R routes that packet to the outside network
> * C gets a packet from S1, port 80

*nod*

> I'm making some tests with EBTables in my lab enviroment.=20
> I'll tell you the results.

Ok.  Let me know if you need any thing else.

Remember that you will need to DNAT the inbound traffic and SNAT the=20
outbound traffic too.

Also, if you are redirecting the traffic (originally to the downed=20
server) to another up and functioning server, you have to be careful no=
t=20
to interfere with the other servers normally functioning traffic.

You can very simply write an EBTables rule to SNAT the traffic as it=20
passes through the appliance.  However you have to make sure that you=20
only SNAT the traffic that was originally DNATed and not all the traffi=
c=20
from S2.

> Thanks a lot.

You are welcome.



Grant. . . .
