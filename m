From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Using an device alias?
Date: Fri, 3 Jan 2003 22:33:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301032233.47877.netfilter@newkirk.us>
References: <b74ecb8788.b8788b74ec@cvip.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <b74ecb8788.b8788b74ec@cvip.net>
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
To: Steve M Bibayoff <smb23@csufresno.edu>, netfilter@lists.netfilter.org

On Friday 03 January 2003 02:28 pm, Steve M Bibayoff wrote:
> Is it possible to use iptables with a device alias
> (ex.. eth0:1)? I tries to add a filter rule and got
> an error:
> % iptables -t filter -I INPUT -i eth0:1 -j ACCEPT
> Warning: wierd character in interface `eth0:1' (No
> aliases, :, ! or *).

Well, the warning says it pretty clearly, it seems.  However, I have an=20
idea on this.  Actually three, presented in order from simplest to most=20
complicated.

Solution #1:
Since this is the INPUT chain, then the local machine clearly is the=20
destination.  (unless you are using the REDIRECT target in nat=20
PREROUTING)  I suggest you try something like:

iptables -A INPUT -i eth0 -d a.b.c.d...
iptables -A INPUT -i eth0 -d e.f.g.h...

This should catch the two aliased IP's independantly. =20

Now if this were FORWARD chain traffic, this test wouldn't work, since=20
the destination IP can in principle be anything at all, but by=20
definition will NOT be an IP of the local box.  Even if it originally=20
WAS addressed to this box, to appear in FORWARD it would have to be=20
DNATted, and would then have the new IP.

Solution #2:
If eth0 is local, then I presume you have two different subnets connected=
=20
to it, and want it to respond to both.  If this is the case, then you=20
could test for which subnet the source IP is in rather than which destip=20
is used.  Testing the source ip range would work in both INPUT and=20
FORWARD chains, for traffic coming in on that interface (or its alias),=20
while the same approach for destip should work for FORWARD or OUTPUT=20
traffic going back out that interface. (note that -o eth0 would NOT be a=20
valid test in FORWARD or OUTPUT, however, so you'd only be able to test=20
destination IP)  Something like:

iptables -A FORWARD -i eth0 -s 10.0.0.0/16...
iptables -A FORWARD -i eth0 -s 10.1.0.0/16...

Solution #3:
If however eth0 is a connection to the internet with multiple IP's, (or=20
for some unfathomable reason you have two independant IP's on the same=20
interface that are on the same subnet...) NEITHER of these approaches=20
can work in FORWARD chain, but there's still a possibility, by catching=20
them inbound in mangle PREROUTING and marking them based on destIP,=20
which will still be the 'real' IPs prior to DNAT in nat PREROUTING=20
(which is implicit in such packets being in the FORWARD chain) and then=20
in FORWARD you can match marks and handle them separately based on that.

iptables -t mangle -A PREROUTING -i eth0 -d a.b.c.d -j MARK --set-mark 2
iptables -t mangle -A PREROUTING -i eth0 -d e.f.g.h -j MARK --set-mark 3
iptables -A FORWARD -m mark --mark 2...
iptables -A FORWARD -m mark --mark 3...

This presumes that you aren't using packet marking for anything else,=20
like routing decisions or load balancing, but if you are then you can=20
possibly dovetail the two uses. (or switch to marks for filtering, TOS=20
for routing)  This has the advantage of being a valid test in any chain=20
and table, once the mark is in place.

j


