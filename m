From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Port forwarding problem
Date: Sun, 24 Nov 2002 15:40:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211241540.28168.netfilter@newkirk.us>
References: <ut86tuo7rimkt2dc52ke1qo8boaqtt29g0@4ax.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ut86tuo7rimkt2dc52ke1qo8boaqtt29g0@4ax.com>
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
To: Tom Elsesser <telsesser@mindspring.com>, netfilter@lists.netfilter.org

On Wednesday 13 November 2002 11:29 pm, Tom Elsesser wrote:
> Hi,
>  I have 2 linux servers on a 20 workstation network. There is an adsl
> connection coming thru a EN5861 router which connects to one server
> (yzerman) on eth1. Eth0 on this box goes to a 48 port switch. The
> other linux box (ulysses) is going to be a webmail server, and has 1
> nic going to the switch. I have the apache server on ulysses listening
> on port 8000. The router can forward ports but only on its own subnet,
> which is the same as eth1 on yzerman. I am trying to get port 8000 to
> go thru yzerman to ulysses, but can't seem to get it right. Can
> someone take a peek at my iptables config and tell me where I went
> wrong?

You need a few rules to allow this:  DNAT incoming port 8000 requests, ac=
cept=20
those in FORWARD, accept returning in FORWARD.  (Once DNATted they are=20
packets to be forwarded to another machine, not INPUT for the local firew=
all=20
machine)

I've commented throughout the script below.  Is this your complete rulese=
t?


> Thanks in advance.
>
> +++++++++++++++++
> #!/bin/sh
>
> # Turn on ipforwarding just in case
> echo "1" > /proc/sys/net/ipv4/ip_forward
>
> # Flush old rulesets
> /sbin/iptables -F
> /sbin/iptables -F -t nat
>
> # Default policies
> /sbin/iptables -P INPUT ACCEPT
> /sbin/iptables -P OUTPUT ACCEPT
> /sbin/iptables -P FORWARD DROP

I'd STRONGLY suggest that for everyday use you set at least INPUT policy =
to=20
DROP as well, and ACCEPT only traffic that legitimately should be granted=
=20
access to the firewall machine.  Webmail traffic will (with proper=20
configuration) all go through FORWARD, as will masqueraded LAN traffic.
Only connections to yzerman itself should ever be in INPUT, and only=20
connections you explicitly want to allow to your firewall should ever be=20
ACCEPTed in INPUT.

> # Masq out eth1 (to router)
> /sbin/iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

Fine here, but if your IP is static just SNAT, there's a lot less overhea=
d if=20
netfilter doesn't need to constantly double-check the firewall's IP.

> # Allow packets to return
> /sbin/iptables -A FORWARD -i eth1 -m state --state RELATED,ESTABLISHED
> -j ACCEPT
>
> # Allow packets out
> /sbin/iptables -A FORWARD -i eth0 -s 10.1.1.0/8 -j ACCEPT

If this is all the FORWARD rules you have, then you'll have problems.  Yo=
u=20
have a default DROP policy for FORWARD, which is good, but here you only=20
allow EST/REL connections back from the internet (allows MASQ back throug=
h)=20
and connections out from the LAN.  You need to also allow the DNATted=20
connections through FORWARD, IE the INPUT --dport 8000 rule below should =
be=20
in FORWARD, since that's where the DNATted packets are bound.  Your rule=20
construction also doesn't allow connections from the LAN to forward to=20
ulysses.  Is this the way you want it?  It's quite a bit more complicated=
 to=20
allow that, but can certainly be done.


> # Forward squirrelmail http request to ulysses
> /sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 8000 -j
> DNAT --to 10.1.1.2
>
> # Connect to port 8000 (squirrelmail) from outside
> /sbin/iptables -A INPUT -i eth1 -d 0/0 -p tcp --dport 8000 -j ACCEPT

As said above, port 8000 is FORWARD traffic for the firewall after DNATti=
ng,=20
not INPUT.

> # Connect via ssh from outside
> /sbin/iptables -A INPUT -i eth1 -d 0/0 -p tcp --dport 22 -j ACCEPT

Is this intended to allow SSH from the internet to the firewall?  That's =
what=20
it currently does.  With ACCEPT policy on INPUT this is redundant anyway,=
 but=20
you should really default DROP, then allow specific cases through.  Again=
, no=20
provisions for SSH from the LAN - is that something you want?  Currently =
the=20
ACCEPT policy would allow that anyway, so the net effect right now is tha=
t=20
SSH connections from the internet to the firewall machine are counted=20
separately, and all traffic into the firewall machine is accepted.  NOT a=
=20
particularly secure arrangement...  (actually about as unsecure as it cou=
ld=20
get, barring ACCEPT policy on FORWARD...)

> # Log to syslog
> # /sbin/iptables -A INPUT -j LOG


My suggestions would be:

Set default DROP policy for INPUT and FORWARD. =20

Accept EST/REL in FORWARD without matching source/dest/in/out, or set up=20
multiple state rules to allow both directions.  (only difference is multi=
ple=20
rules allow you to see traffic volume in each direction separately with=20
iptables -L -v -n)  Personally I would have 4 EST/REL rules in FORWARD: o=
ne=20
each for in and out from Ulysses, followed by one each for in and out fro=
m=20
LAN in general.  This gives more detailed records without actually LOGgin=
g.

DNAT port 8000 to Ulysses, then ACCEPT in FORWARD.=20

MASQ outbound connections to internet NOT from Ulysses.  (webmail replies=
 will=20
be reverse NATted automatically)

ACCEPT specific port connections in FORWARD coming from the LAN, IE allow=
=20
TCP80, TCP/UDP53, etc.

Set a REJECT rule at the end of FORWARD for anything not allowed that cam=
e=20
from the LAN, let not allowed from the internet just DROP silently.

Repeat for emphasis:  DROP INPUT to the firewall except for things that R=
EALLY=20
need to communicate directly to that machine.  If you want to be polite (=
to=20
the LAN at least) you can REJECT instead of DROP, but from the outside wo=
rld=20
you really should DROP.

If the firewall machine itself has no reason to communicate directly with=
=20
anything else (apart from forwarding) set a default REJECT policy on OUTP=
UT,=20
and LOG anything reaching policy.  The only times this would matter is if=
=20
someone is using the firewall box as a workstation, a server, or it has b=
een=20
compromised.

j


