From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: INPUT vs. FORWARD when????
Date: Tue, 1 Apr 2003 03:00:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304010300.26431.netfilter@newkirk.us>
References: <Pine.LNX.4.53.0303312251100.1678@beethoven.javaspotlet.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0303312251100.1678@beethoven.javaspotlet.com>
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
To: Tim Miller <tj.miller@javaspotlet.com>, NetFilter List <netfilter@lists.netfilter.org>

On Tuesday 01 April 2003 12:17 am, Tim Miller wrote:
> As a newbie to iptables I have some confusion on the subject of the
> chain traversal process that I hope the list can help me clear up.

Two things: =20
1 - http://iptables-tutorial.frozentux.net - Oskar Andreasson's excellent=
=20
iptables tutorial has a very good explanation of traversal sequence,=20
with clear diagrams. =20
2 - If ever in doubt, insert a LOG rule first in each and every chain and=
=20
throw some traffic at the box.  (Don't forget to delete the rules when=20
done!!!)  A little thought with "--log-prefix IPTest:NATPRE:" and such=20
will let you look at the log and see exactly what chains the packet=20
traverses in what sequence.

> Let say for a moment I have one machine, 2 interfaces configured as
> follows, assume for the moment that the 192 address is my internet
> connection.
>
> eth0 -> 192.168.1.1 - Internet Gateway
> eth1 -> 10.2.0.1 - Local Lan gateway
>
> T   F : A packet is received on eth1 whose destination address is
> 10.2.0.1 then I assume that it will pass through the INPUT chain. The
> source of the packet was a machine in the local lan.

True.  More precisely, it will pass through nat-PREROUTING chain first,=20
since with this setup it's likely you are NATting.  If you've loaded the=20
mangle table as well, it passes through mangle-PREROUTING, then=20
nat-PREROUTING, then mangle-INPUT and finally filter-INPUT.

> T  F : A packet is received on eth1 that is a request for a DHCP
> address. The DHCP process is running on the box and listening on eth1.
>  When the request is received the packet passes through the PREROUTING
> and then the INPUT chain.

True again, and again with the above details.

> T   F : A packet arrives on eth1 whose destination is an address out
> on the internet and its source is a machine on the local lan. When
> this occurs it first passes through FORWARD chain and then the
> POSTROUTING chain, it is then sent out eth0. This packet never passes
> through the OUTPUT chain.

True, but here again it passes the PREROUTING chain(s) first, then=20
FORWARD, (mangle-FORWARD then filter-FORWARD if mangle table loaded) and=20
finally POSTROUTING (in nat table then mangle if loaded), never hitting=20
INPUT or any OUTPUT chains.

> T  F : A packet arrives on eth0 whose destination is 192.168.1.1:80
> address. This packet will pass through the PREROUTING chain and then
> the INPUT chain.  (Assume in this scenerio a web server is running on
> the box and the PREROUTING chain did not alter the address).

Same as scenarios 1 and 2 above.

> T  F : A packet arrives on eth0 whose destination is 192.168.1.1:80
> address. This packet passes through the PREROUTING chain which has a
> rule to alter the destination to a 10.2.0.2 address.  Once the
> destination address has been changed, this packet passes through the
> FORWARD chain. (Assume in this scenerio that the web server is running
> on the 10.2.0.2 machine.

Same as scenario 3 above.

> Are my scenerio's correct? If not what am I missing.

Yes, although you miss the fact that all packets coming in an interface=20
go through PREROUTING, and all packets going out one go through=20
POSTROUTING, regardless of forwarding.  All traffic passes chains the=20
same way regardless of which interface it comes in on.  The only=20
scenario you don't cover here is a packet originating on the machine,=20
which would pass through (mangle-OUTPUT then) nat-OUTPUT then=20
filter-OUTPUT, then nat-POSTROUTING (then mangle-POSTROUTING).=20

There are exceptions, but the 'normal' full path for a packet that will=20
be forwarded is:=20
mangPRE->natPRE->mangFORWARD->filterFORWARD->natPOST->mangPOST.
and the 'normal' full path for a packet destined locally is:
mangPRE->natPRE->mangINPUT->filterINPUT.

> Thanks a million

j


