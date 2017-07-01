From: Robert White <rwhite@pobox.com>
Subject: Re: Full NAT forward and source routing - possible without packet
 marking?
Date: Sat, 1 Jul 2017 23:50:21 +0000
Message-ID: <6773e78c-f0e6-508d-0a72-d5880705756d@pobox.com>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
 <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
 <ea023673-d0c6-f8d8-0399-203a71e7fa62@trustiosity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ea023673-d0c6-f8d8-0399-203a71e7fa62@trustiosity.com>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: zrm <zrm@trustiosity.com>, oyvind@dynator.no, netfilter@vger.kernel.org

On 07/01/2017 10:17 PM, zrm wrote:
> On 07/01/2017 04:26 PM, Robert White wrote:
>> So, for instance, once you DNAT the incoming packet you _don't_ want to
>> SNAT it.
>=20
> What about hairpin NAT?

As stated, you really want to do local services by adjusting the DNS
unless it's impossible.

Sure, you can do hairpin NAT, but it's usually just a bad design since
it doubles the network traffic on the one interface.

So I understand that there are some odd corner cases that you just
cannot fix, such as lying to a black-box appliance, but it's a technique
that you _can_ do, but that you have virtually no _good_ reason to ever do.


IF you must you want to restrict the hell out of the SNAT so that it
only applies to packets that are making that hairpin turn, rather than
masquerading/snat all the traffic.

So really, if you are in control of the router and the DNS, or you
intercept the DNS requests with a REDIRECT rule at the router, you can
inject the correct local address anyway and you don't need to hairpin.

If you want to put the service at a common public IP address and leave
it that way, putting your server on a dogleg/spur is already a much
better idea anyway.

Why?

Because if you have a public service (say a web browser) you don't
_want_ it on your local segment. One of the goals (that people often
forget) of a firewall is to protect yourself, so if the server is in the
free local segment then a compromise of the server is effectively a
compromise of the router.

If the server(s) are on a dogleg then compromising the server can only
give the attacker access to the other servers on the dogleg (if you did
your rules right). A server that the public can touch by any means
should be isolated from the rest of your private network.

For instance, a public-facing web server should never be allowed to make
outgoing connections to the rest of your infrastructure. The dogleg
rules should, for example, block every form of egress from that server
to your real properties or the internet in general.

By example, the typical web server exploit causes the web server to make
an ssh or telnet connection, or an outbound web request so that the
escalated privilege can be used for some purpose. It might also involve
putting a web snoop of some sort into the server to watch the incidental
traffic for passwords and such.

So an actually secure setup would, for example, prevent the web server
box from initiating questionable traffic, and would isolate your local
SMB type traffic from the wire entirely.

So if you have to haripin for some reason, then you should dogleg
instead. Period. It's a half-arsed solution to an inherently bad design.

A commodity home router doesn't usually offer the necessary hardware to
dogleg, but commodity home routers are not designed for Real Services
Safety=99. Anything you can put a network card in can be built to never
need to hairpin anything.

So hairpin routing is a bad idea that is popular for bad reasons.

The rendezvous server example is fixed by a dogleg, but it's also fixed
by having both addresses listed for the server and just NAKing (via
REJECT) the public address if its received on the private interface,
causing the secondary address to be used. Of course, because of your
smart routing the local address should have been chosen for its lower
metric to start with, but that's another topic.

HOWEVER

If you do hairpin, you still don't need to mark any packets or anything.
You just use the SNAT/MASQUERADE rule with highly restricted matches
just for the hairpin server.

An example culled from the internet:

-A PREROUTING -d 89.179.245.232/32 -p tcp -m multiport --dports
22,25,80,443 -j DNAT --to-destination 192.168.2.10
-A POSTROUTING -s 192.168.2.0/24 -o ppp0 -j MASQUERADE
-A POSTROUTING -s 192.168.2.0/24 -d 192.168.2.10/32 -p tcp -m multiport
--dports 22,25,80,443 -j MASQUERADE

Notice how the last rule range matches the source, but exactly matches
the hairpin target both by exact address and specific ports. Normal
non-hairpin traffic simply doesn't get SNAT at all.

And still, and again, the connection tracking does all the necessary
heavy lifting work with no particularly complex nonsense.

It's ugly and insecure, IMHO of course, to leave that server on your
general use network like that for the reasons already stated. Spending
forty bucks on an extra network card would be _much_ safer and more
efficient.
