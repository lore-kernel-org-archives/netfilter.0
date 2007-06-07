From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Combining rules
Date: Thu, 07 Jun 2007 11:22:58 -0500
Message-ID: <466830E2.3000204@riverviewtech.net>
References: <2B31733C-BA34-44B8-AB44-FBBFA81BE9B0@ianmoyce.co.uk>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2B31733C-BA34-44B8-AB44-FBBFA81BE9B0@ianmoyce.co.uk>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 06/07/07 04:18, Ian Moyce wrote:
> I am trying to combine a load of ip rules, but I am having problems=20
> fathoming it out.
>=20
> I run a VPS with openVPN. I have the following rules:
>=20
> iptables -t nat -A POSTROUTING -s 192.168.2.3 -j SNAT --to 85.234.144.2=
36
> iptables -t nat -A POSTROUTING -s 192.168.2.4 -j SNAT --to 85.234.144.2=
36
> iptables -t nat -A POSTROUTING -s 192.168.2.5 -j SNAT --to 85.234.144.2=
36
> iptables -t nat -A POSTROUTING -s 192.168.2.6 -j SNAT --to 85.234.144.2=
36
> iptables -t nat -A POSTROUTING -s 192.168.2.7 -j SNAT --to 85.234.144.2=
36
> iptables -t nat -A POSTROUTING -s 192.168.2.8 -j SNAT --to 85.234.144.2=
36
> iptables -t nat -A POSTROUTING -s 192.168.2.9 -j SNAT --to 85.234.144.2=
36
> iptables -t nat -A POSTROUTING -s 192.168.2.10 -j SNAT --to 85.234.144.=
236

I'm not sure why you would be wanting to SNAT 8 systems to the same IP, b=
ut hey, it's your script.  The rules them selves look good enough.

> Which works great. However, I am wanting to pass any IP traffic from=20
> the 192.168.2.x range to be passed through a socks proxy on a specific=20
> port, which I have been told can work with:

(Comments in line below)

> #!/bin/sh
>=20
> LOCAL_NET=3D192.168.2.0/24
> /sbin/iptables -F
> /sbin/iptables -t nat -F
> /sbin/iptables -P INPUT ACCEPT
> /sbin/iptables -P FORWARD DROP
> /sbin/iptables -P OUTPUT DROP

A default of DROP in the OUTPUT can catch you on a LOT of things.

> /sbin/iptables -t nat -P OUTPUT ACCEPT
> /sbin/iptables -t nat -A OUTPUT -p udp --dport 53 -j DNAT --to-destinat=
ion 127.0.0.1:5353
> /sbin/iptables -t nat -A OUTPUT -o lo -j RETURN
> /sbin/iptables -t nat -A OUTPUT -d 127.0.0.1 -j RETURN
> /sbin/iptables -t nat -A OUTPUT -d $LOCAL_NET -j RETURN
> /sbin/iptables -t nat -A OUTPUT -m owner --uid-owner 103 -j RETURN
> /sbin/iptables -t nat -A OUTPUT -p tcp --syn -j DNAT --to-destination 1=
27.0.0.1:1211

So you are wanting to block all outbound traffic except for the following=
 conditions:
 - Loop back traffic
 - Local host network traffic
 - Local network traffic
 - Any thing sent by uid 103

Is this really what you are wanting to do?

Loop back and local host network are really about the same unless you hav=
e other subnets bound to your loop back interface or for some strange rea=
son the 127.0.0.0/8 subnet bound to something other than loop back.

It looks like you are using a local DNS (proxy?) server and redirecting a=
ny DNS queries to it.

Then there is the main critter where you are redirecting any new TCP traf=
fic to a service on the local host.  I'm not quite sure what will happen =
to the destination IP and port of the request traffic.  I'm afraid that t=
hey will be translated to be the local host and port you are DNATing to, =
not the original destination.  If the original destination is lost, how i=
s your proxy going to work?  I guess I should as, are you trying to trans=
parent proxy or are you really telling your client systems that they are =
using a proxy?

> /sbin/iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> /sbin/iptables -A OUTPUT -o lo -j ACCEPT
> /sbin/iptables -A OUTPUT -d 127.0.0.1 -j ACCEPT
> /sbin/iptables -A OUTPUT -d $LOCAL_NET -j ACCEPT
> /sbin/iptables -A OUTPUT -m owner --uid-owner 103 -j ACCEPT
> /sbin/iptables -A OUTPUT -j LOG
> /sbin/iptables -A OUTPUT -j REJECT=20

Again, you are wanting to block all outbound traffic except for the follo=
wing conditions:
 - Loop back traffic
 - Local host network traffic
 - Local network traffic
 - Any thing sent by uid 103

Any thing that is not allowed out is logged and rejected.

The state rule is the normal short cut to by pass the rules for previousl=
y seen traffic.

As an aside:  Why are you filtering in your nat table?  Filtering really =
is better done in the filter table.

> If someone is able to help me figure this out, I am offering a=20
> reward of =A350 (about $100) as it is driving me insane!!!

I don't see any thing to out standing other than the fact, which may be m=
y unfamiliarity with Socks, that any traffic not explicitly allowed TCP t=
raffic is being redirected in to one port on the system.  I'm not sure th=
at this will work.  However like I have said, I do not use Socks so I am =
not familiar with it.  To me, when you are DNATing to the local port, you=
 are going to loose your destination IP and port.  Thus, how will your se=
rvice know where to send the traffic to unless there is some sort of indi=
cator in what is coming in to the service.  If there is data coming in to=
 the service telling it where to connect to, then you have obviously conf=
igured the clients to talk to the service.  If you have configured the cl=
ient to talk to the service, why are you having to redirect the traffic? =
 Why did you not configure the client to talk directly to the correct por=
t of the service?

It almost sounds like you are wanting to do transparent proxy with Squid.=
  Squid is an entirely different prosy than Socks.  Socks (to my knowledg=
e) is a system for a client to request that an intermediary (bastion) hos=
t make the connection on the client's behalf.  With Socks, the client pas=
ses information on where it wants to connect to the Socks proxy.

Squid transparent proxy on the other hand is entirely different.  Squid i=
s primarily used to proxy HTTP / HTTPS requests on behalf of clients.  Pa=
rt of the HTTP protocol is the information that you are trying to request=
.  I.e. you pass what host (name) and item that you want.  Squid can inte=
rpret these requests and make the appropriate connection on your behalf. =
 Or, you can do the standard thing and configure Squid as a standard prox=
y and just point the clients to it and it will behave more like a Socks p=
roxy where the client tells Squid what it wants and Squid then goes and g=
ets it.

Incidentally, setting Squid up as a transparent proxy and redirecting any=
 and all HTTP traffic in to it is not difficult and can be done in a very=
 similar manner (as far as the redirects on the router).

Digest this and let me know if you have any more questions.



Grant. . . .

