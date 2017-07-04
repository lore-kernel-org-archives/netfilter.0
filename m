From: Robert White <rwhite@pobox.com>
Subject: Re: Hairpin NAT - possible without packet marking?
Date: Tue, 4 Jul 2017 01:14:59 +0000
Message-ID: <1402388a-fb32-d7af-bc3a-6f25b8a2f47a@pobox.com>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
 <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
 <ea023673-d0c6-f8d8-0399-203a71e7fa62@trustiosity.com>
 <6773e78c-f0e6-508d-0a72-d5880705756d@pobox.com>
 <a3219c0b-2e2e-74d3-ae9b-88ec6ff35810@trustiosity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a3219c0b-2e2e-74d3-ae9b-88ec6ff35810@trustiosity.com>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: zrm <zrm@trustiosity.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 07/03/2017 06:07 PM, zrm wrote:
> So the question remains is whether it's possible to get the same effect
> without marking.
>=20

I have no Good Information=99, but I suspect you could do a _stateless_
NAT using ip rule and ip route commands that didn't need any packet
marking. I'm not sure if that's a "netfilter" topic, per se, since
stateless nat basically avoids the connection tracer and all that, but
it looks a little brittle from what I've read. (I've never actually
tried it as it doesn't seem to be the best choice.)

I've honestly go no clue why you cant use --in-interface in a
POSTROUTING chain. I mean obviously --out-interface isn't going to be
available in PREROUTING, but I don't see how the packet could have
"lost" it's in-interface information at that point. The restriction
seems arbitrary (absent some obscure technical detail I don't know that
explains it) so I asked the question outright in a separate thread.

nft allows the syntax for iif but I'm not sure if it works or not.

> I feel like isolating public services has always been backwards
> anyway. An internal network with hard shell with soft middle means
> that one compromised internal device becomes a big fire.

That bit reads as self-contracictory to me. I don't understand what you
are saying. The second sentence is exactly why one does the first.

So you should have a wall between the outside world and your public
services, and then more wall between your public services and your
private services and private users.

The goal of isolating public services exists because the public can
easily find and so more easily compromise a public service.

So yea, real security happens in layers.

If I crack your web server, you don't want that to put me in the same
data flow as, say, your legal documents and company property and future
salles leads and customer credit card info and whatever else you might
not want to share with the world.

It's just basic security, like in the real world. The bank lets lots of
people into the lobby, and if a robber compromises the teller he can get
the teller to let him into the money-vault that backs the teller. But
the robber isn't going to automatically get access to _all_ the banks
vaults everywhere, or the HR records, or the list of contracts the bank
holds, or all the mortgage information. Those things simply are not kept
where the teller can reach them during a robbery.

So in a good network design you keep the things that the public can
touch in any way on a segment that isn't the same as the
minute-by-minute details of your whole business.

So you set up your firewall around your web service and you screw it
down tight. If the public can only use http and https then clearly
that's all you allow from the public net. And if the web server will
only send back answers on those sessions, then you don't let the web
server initiate _any_ connections from itself to the internet.

If the web server has to talk to a trivial database, maybe you leave
that on the same hardware, or maybe you colocate it on the network.

But if the web server needs to talk to a critical database, like one
full of customer records and credit cards, then you segregate them and
only let the necessary ports through. And again, that database server is
not allowed to talk to the rest of the world.

Then if you need to maintain those servers you have your private
segment(s) and they are allowed to initiate ssh sessions into those
servers, but those servers are not allowed to ssh back towards the more
private network.

And it's the little things that make a system like this work correctly.

The ideal front-most router is smooth on both sides, with no SSH or
admin ports available at all. That front server is maybe only available
by direct console attachment.

Or maybe you spend eighty bucks on an extra pair of network cards and
you allow remote administration, but only from the network segment of
the dedicated maintenance link.

If you don't have the cash, then you only allow the "Back router" talk
directly to the front router.

If you don't have enough money to put two separate routers with a proper
DMZ between them, then you do the dogleg DMZ off of a single router.

But basically a good security design treats every public-accessible
server as if it's already been compromised and so as if you cannot trust
it's physical connections at all.

One of the most paranoid systems I ever designed had a front-side
router/firewall that had no writable storage on it at all. It booted
from a CD which had the kernel and initramfs. That initramfs had all the
firewall rules and modules and whatnot and if it needed to be altered
you'd just burn a new CD and swap them out. What little logging there
was went out a separate ethernet device as syslog events (udp broadcasts).

Behind that router was another router/firewall that had four adapters.
One for corporate innards. one for the public facing services. One for
the database server(s) that supported the public services. And one for
monitoring the forward firewall's logs.

No system is absolutely uncrackable, of course, but if an external
hacker wanted to compromise the corporate information he'd have to end
up crafting a web request that caused the web server to craft a database
request that caused the database server to lie-in-wait for an admin to
connect to it and take over that connection in a way that would cause
the admin's computer to send something back to the attacker. This is
"not bloodly likely".

So compromising the web server wouldn't for example, let the web server
to make an scp or ftp (or whatever) session to export it's data, the
compromise would have to export the data back through that self-same tcp
session.

Dont mistake "all services" for "public services". Behind that second
firewall the company was just as stupid as most companies. They had
people sharing segments of their hard drives. Pooled servers with just
ludicrously broad write policies, printers, store and forward scanners,
all the normal stupid things that let business function. And you know,
what, its well they should. Security that becomes a denial of service
attack on the corporation's innards just encourages misuse.

If someone was going to steal that stuff there were going to have to
come on sight and do it from there. But that web portal was not going to
be the way in.

And that's as much as you can hope for really.

So yes, sure, individual devices need to be as secure as reasonably
possible.

And yes, you can't stop an internal (on site) actor.

But you sure-as-shooting can make it virtually impossible for an outside
actor to "climb up" your public services by simply not letting those
public service providers do _any_ of that outgoing nonsense.

Your web server has no business initiating an SSH session to anything.
That's not it's job. If a hacker gets control of that machine he's got
no problem turning off it's internal rules. But if walks its entire
internal security to root privilige, only to find out that the web
server is "alone" on its segment and none of the routers will let it do
_anything_ but listen to time broadcasts, send database queries through
a pinhole to an equally sequestered database farm, and reply to the TCP
packets it received on the HTTP and HTTPS ports... he will be sad.

Network isolation not about (just) "naive legacy servers", it's about
the core principles of security.

Sure individual offices have locks on their doors, and individual desks
have locks on their drawers, but if you say the big locks on the front
doors and the individual security gates throughout the campus are just
for "weak legacy desks" you've utterly missed the point.

The key phrase you should ponder is "Defence in Depth".

The little locks just slow people down once they are inside the
building. It's the big locks on the well designed outer doors that do
the most good.
