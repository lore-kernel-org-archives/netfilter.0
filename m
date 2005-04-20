From: Anders Peter Fugmann <afu@fugmann.net>
Subject: Re: Possibility to lock iptables rules.
Date: Wed, 20 Apr 2005 22:56:07 +0200
Message-ID: <4266C1E7.8020103@fugmann.net>
References: <1113994155.31280.29.camel@localhost.localdomain>
	<426685FB.4040607@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <426685FB.4040607@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

Well written, and your arguments are truly valid. I still see a=20
practical usage though, as it will hold back the big mass of novice=20
script kiddies. The lock bit would harden the system, but not make it=20
unbreakable (there is no such thing as an unbreakable system, that is=20
connected on the net.)

I have commented on (most) you points below.

Taylor, Grant wrote:
> I don't know of a way to lock IPTables rules in the kernel, but this is=
=20
> my take on what you wrote.
>=20
> If you did lock IPTables rules in to the kernel the only way to work=20
> with them would be to modify the firewall script and reboot the box=20
> (which is trivial if you gain root to a box).  This does little more=20
> than make it a pain and could easily be scripted.
If the system cannot reboot (by bios), then this is avoided. But indeed, =

root have total control, and can bypass even the most complex trip wires =

if experienced enough.

>=20
> This is really the reason that firewalls / routers are suppose to be=20
> standalone boxen.  The idea behind this is to not run any service(s) on=
=20
> a firewall / router that could be exploitable.  If you do want to have =

> your firewall / router offer services to the world port forward any=20
> requests that you want to serve to a system behind the firewll / router=
=20
> in the DMZ which is in and of it's self firewalled from the rest of the=
=20
> network, this prevents this system from having access to the internal=20
> LAN if it is breached its self.  By doing this the firewall / router=20
> it's self is not offering any exploitable services to the world and thu=
s=20
> can not be hacked in to via standard methods.
True. Software cannot give what extra hardware gives in terms of=20
security - And I'm not suggesting that. What I=F8m looking for is some wa=
y=20
to trip the attacker, by causing the system to panic it the attacker=20
tries to modify the rules. If the attacker tries to reboot the system=20
(after modifying the startup scripts), monitoring systems will usually=20
detect this, and can generate an alert. This is what I'm looking for.

>=20
> One solution that sort of applies, in such that it is impossible to=20
> modify a running firewall / router, is to run the firewall / router in =

> runlevel 0.  Granted you could not use such a system as a standard=20
> server if you did this but it would allow the firewall to be running in=
=20
> production in such a way that it could not be modified or even accessed=
=20
> in any way shape or form remotely.  You would end up havening to reboot=
=20
> the box and send it in to Single user mode to work with things.  I=20
> personally have never done this as I have never felt the need to be tha=
t=20
> paranoid about my firewalls.  Typicaly I will run a firewall with no=20
> services listening on the internet side of the box and just SSH=20
> listening on the internal side.  If I am even more paranoid I will put =

> the firewall / router physically close to another server and run a=20
> serial cable from the server that does have remote access (SSH) to the =

> firewall / router and do everything via serial console.  By using a=20
> serial console on
> the router and no services listening on any interface it is virtually=20
> impossibly (as far as I'm aware of) to connect to the box and modify an=
y=20
> thing.
Agreed.

>=20
> Honestly in my (humble) opinion go spend $50 on a used system (if you=20
> don't have one) drop a couple of NICs in it and set it up as your=20
> firewall and port forward the traffic that you want to serve to the=20
> world to it.
This is not always an option to install extra hardware. For one you need =

to administer the system, and I guess that it would be hard to find=20
hardware that can run 24/7 for 50 bucks. Also in some companies it will=20
not be possible to setup an extra machine for firewalling (by policy,=20
not rationale). I actually thought of running all services in user mode=20
Linux first, but then got the idea to lock the rules - which is less=20
secure, but a whole lot simpler.

>=20
> As far as a way to lock rules in to the kernel I don't know that there =

> is a way to do so nor do I think there should be a way as it would do=20
> nothing but slightly (2 - 10 minutes) slow down a good cracker.  Sure i=
t=20
> might stop some script kiddies, but if a cracker can do it they can=20
> script it too, hens the latter problem.
The question is not to make an unbreakable system, but to make a system=20
that is harder to break than your neighbours.
Also, clueless script-kiddies usually offers the greatest security risk. =

They, in contrast to professionals, usually just want to exploit the=20
system. Professional crackers most oftenly crack systems to challenge=20
themselves - not to destroy or exploit data on the systems found.

Thinking more about how to implement the system, I don't thank that it=20
is nessesary to hide the address of the bit locking the rules in the=20
kernel, as I guess that it would be just as simple to find the head of=20
the lists containing the rules, and zero them out (putting a null in=20
place of the list head). If anyone is interested, I can make the patch,=20
and post it on the devel list. Any comments on this?

Regards
Anders Fugmann


