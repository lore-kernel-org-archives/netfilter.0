From: "Paul" <andnicky@myrealbox.com>
Subject: Re: Can iptables create alias IP for another box?
Date: Sun, 22 Dec 2002 23:09:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1040616573.c2706ec0andnicky@myrealbox.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@newkirk.us
Cc: netfilter@lists.netfilter.org

Joel,

Thanks for all your thoughts and ideas.  I'm an iptables newbie, so your ti=
ps on logging and ACCEPT are likely to be very helpful.

For background: each box has one interface, valid routes exist between all =
subnets, a VPN tunnel currently can reach box B's address (private) but n=
ot box A's address (public but not accessible thru firewall).  Since I'm =
not sure when I can get the VPN rules changed (I don't run the concentrat=
or), my workaround was to see if box B running iptables could redirect tr=
affic to/from box A so the remote client could use box A thru the VPN and=
 thru box B.

I've seen one or two other scenarios that needed a box able to act as an al=
ias for another.  I'm told it's hard to do with the Cisco IOS on our rout=
ers.  If iptables can do it easily, I'll be impressed!!

Hope to try tomorrow at work. =20

By the way, I live about 40 minutes from Pennsauken.  The IP you traced was=
 a free webmail service I use, www.myrealbox.com - it's a Novell test bed=
 for Netmail that gives 10mb/user & no ads. =20

Peace ^^ Paul

-----Original Message-----
From: Joel Newkirk <netfilter@newkirk.us>
To: "Paul" <andnicky@myrealbox.com>
Date: Sun, 22 Dec 2002 02:32:48 -0500
Subject: Re: Can iptables create alias IP for another box?

On Saturday 21 December 2002 06:51 pm, Paul wrote:
> An SNAT & a DNAT rule didn't work for me, and I'm too dumb to know
> what to do next.
>
> Behind our firewall which NATs everything, I have a server (A) with
> one IP 1.2.3.4 that needs to be reachable also thru a second IP like
> 10.5.6.7.  The application won't support adding an alias IP.
>
> If I give the second IP to box B's eth0, can iptables make box B
> emulate an alias IP for box A?  It only has to work for port 80
> traffic but be nice if it did more.
>
> I was trying to do something like this on box B (from error-prone=20
memory, with B's address 10.5.6.7):
> > iptables -t nat -A PREROUTING -d 10.5.6.7 -p tcp --dport 8080 -j
> > DNAT --to 1.2.3.4:80
> >
> > iptables -t nat -A POSTROUTING -d 1.2.3.4 -p tcp --dport 80 -j SNAT
> > --to 10.5.6.7

You should probably be SNATting to box B's local IP, IE the one that is=20
on the same subnet as the box A server at 1.2.3.4.  And make sure that=20
the traffic each way is ACCEPTed in the FORWARD chain.  (you can set up=20
a log rule at the start of each chain for a short time to ensure that=20
packets are reaching box B and being handled properly)  If this isn't=20
the solution, then I suspect that traffic for the new IP is never=20
reaching box B to begin with.  As long as the traffic is reaching box B,=20
then DNAT and FORWARD, and possibly SNAT (if box A has some other route=20
to the requesting client), are all you need.

You really don't provide enough information here.  Below I have a few=20
questions, then a few suggestions based on some assumptions, possibly=20
wrong assumptions however.  If the suggestions above resolved it, then=20
everything below is moot.

Questions:

Is all of the access intended to be local?  (no internet clients=20
accessing it) =20

Is box B the firewall itself, the machine performing NAT functions?

Are all four original IP's involved (the client, the box A server, box B=20
from the clients, box B from the server) on the same subnet? =20

You seem to indicate that the 'new' IP for traffic you want to DNAT to=20
the server will be a different subnet, but where do the clients lie, and=20
are there any other machines using the same subnet as 10.5.6.7? =20

Is it actually a reserved IP such as one in the 10.x.x.x range, or a=20
public IP accessed from the internet?

Am I correct in assuming that box B currently has an interface connected=20
to the local clients with a valid IP in their subnet, and a separate=20
interface connected to the internet with a public IP?  (or to another=20
LAN with distinct addresses, and maybe from there to the internet)

Is box A in the same subnet as local clients, or a DMZ or something where=
=20
it is different?  If the latter, does box B have an interface on that=20
subnet, or does it connect to box A through the same interface as the=20
LAN or the outbound NATted traffic?

Comments:

Setting a 'true' alias IP for eth0 is accomplished with "ifconfig eth0=20
add 10.5.6.7",after which "ifconfig" will report eth0 with the main IP=20
and eth0:0 with the alias IP, but this is only useful if eth0 is=20
connected to wires that 10.5.6.7's subnet communicates on.  If nothing=20
on the physical network connected to eth0 (clients or routers) is in the=20
same subnet as 10.5.6.7 then assigning this IP directly to the interface=20
does nothing.  This is usually only useful if you have at least two=20
distinct subnets communicating on the same wires, (assuming local -=20
replace 'subnets' with 'public IPs' if this is the public interface) and=20
want this interface to respond to both/all of them.  Otherwise the issue=20
is one of routing, and ensuring that traffic addressed to 10.5.6.7 gets=20
routed to box B, which then knows what to do with it.

If the server is intended to be accessible from the internet, then the=20
aliased IP has to be one assigned (by ISP/upstream provider) to an=20
external interface where some machine connects to the internet, and that=20
machine (and possibly others, IE routers in between) must know how to=20
reach box B under the aliased IP address in order for packets to reach=20
it.  If the external connection IS box B, then the only requirement=20
would be that the packets destined for that IP would reach it, meaning=20
it has to have that IP from the ISP, and have it assigned to the=20
interface that connects to the ISP.

From here on I assume that the clients are local, IE requests will NOT be=
=20
coming from the internet.  If they are local, then everything is likely=20
routing problems.  The possibilities, however, are pretty similar for=20
both situations, so the comments below apply either way, although the=20
specifics assume local only.

I don't know what the actual IP's involved are, but if they are not on=20
the same subnet, then the client machines won't know how to reach the=20
aliased IP directly.  Your scenario seems to indicate that the alias is=20
a different subnet from that used by box B, and I suspect from the=20
clients as well. =20

If there is no local subnet that 10.5.6.7 would be in, and given that you=
=20
indicate that box B handles NAT functions, then the request packets from=20
clients should end up at box B.  If 10.5.6.7 is in a subnet that can be=20
routed to before the packets reach box B then they never WILL reach box=20
B, unless the routers involved know to give special treatment to this=20
IP.

If you can be certain that the packets destined for 10.5.6.7 will go to=20
box B to begin with (IE, clients and routers between them and box B=20
believe it is the only way to reach that address) then you shouldn't=20
need the aliased IP, just the DNAT/SNAT pair.  You should only need the=20
alias IP assigned to an interface if the subnet it exists in=20
communicates on the same physical network as another subnet, plugged=20
into that interface.


> any ideas will be appreciated.
>
> Paul
> NJ Dept of Health & Senior Services

A strange thing here, I live in Pennsauken NJ, and out of curiousity (I 
didn't recognize the IP as being verizon, comcast, etc) I ran the source 
IP of your email (andnicky [66.54.1.38]) through traceroute, which 
followed it to San Jose, and it resolved to loudcloud.com in Sunnyvale 
CA.  What a strange thing routing on the internet is... :^)

j






