From: "Nix N. Nix" <nix@go-nix.ca>
Subject: Re: DNAT to localhost
Date: 14 Nov 2002 02:36:58 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037259418.6791.85.camel@tux.go-nix.ca>
References: <1037219719.6450.5.camel@tux.go-nix.ca>
	 <1037225641.10536.1.camel@lilleulv>
	 <1037231613.6791.13.camel@tux.go-nix.ca>
	 <1037253770.11775.18.camel@lilleulv>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037253770.11775.18.camel@lilleulv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Bj=F8rn?= Ruberg <bjorn@ruberg.no>
Cc: netfilter@lists.netfilter.org

On Thu, 2002-11-14 at 01:02, Bj=F8rn Ruberg wrote:
> On Thu, 2002-11-14 at 00:53, Nix N. Nix wrote:
> > On Wed, 2002-11-13 at 17:14, Bj=F8rn Ruberg wrote:
> > > On Wed, 2002-11-13 at 21:35, Nix N. Nix wrote:
>=20
> [snip]
>=20
> > I wrote a util that would open a SOCK_DGRAM socket and bind it to a
> > specific interface, like 127.0.0.1:<some_port> or
> > 192.168.1.1:<some_port> .  Thus, I had something listening on
> > localhost:8080/udp.  I added the rule, then tried this from a compute=
r
> > on the 192.168.1.0/24 network (in bash):
> >=20
> > echo -n 'Abracadabra' > /dev/udp/192.168.1.1/80
> >=20
> > This had no effect.  It did have an effect without the rule and with =
my
> > util listening on 192.168.1.1:80 .
>=20
> Are you familiar with the brilliant tool netcat? You find it at
> http://www.atstake.com/research/tools/
>=20
> > > When you debug your iptables rules, turn on full logging to see wha=
t is
> > > being dropped.
> >=20
> > How do I do that ?
>=20
> Check out the LOG target (you'll find it in the netfilter docs) and fin=
d
> out how it works. Then apply a LOG rule before you redirect. If what yo=
u
> see there makes sense, apply (or add) a LOG rule after the redirect.
> Then you will be able to debug your redirection properly.
>=20
> You may also want to take a look at the utilities tcpdump and ethereal.
> Be, however, aware that the source code to tcpdump has been trojaned in
> at least one of the versions. Check with your Linux vendor
> (www.redhat.com etc) for precompiled packages.
>=20
> Bj=F8rn

Well, in the final analysis, I don't think I'll be able to solve my
problem.  I skimmed over net/ipv4/route.c from the linux kernel source
and, from what I could see, packets of the form src:!127.0.0.0/8
dst:127.0.0.0/8 are considered "martian" packets and are dropped.  So,
unless there is some other way to affect the routing decision, my final
solution remains my original solution:

- The Web server listens on 0.0.0.0:8080

iptables -t mangle -A PREROUTING -p tcp --destination ${OUTSIDE_IP}/32
--dport 80 -j MARK --set-mark ${MARK_BOUNCE_PORT}
iptables -t nat -A PREROUTING -p tcp --destination ${OUTSIDE_IP}/32
--dport 80 -j DNAT --to-destination ${OUTSIDE_IP}:8080
iptables -t filter -A INPUT -m mark --mark ${MARK_BOUNCE_PORT} -j ACCEPT
iptables -t filter -A INPUT -p tcp --destination ${OUTSIDE_IP} --dport
8080 -j REJECT
iptables -t nat -A PREROUTING -p tcp --destination 192.168.1.1/32
--dport 80 -j DNAT --to-destination 192.168.1.1:8080
iptables -t nat -A OUTPUT -p tcp --destination 127.0.0.1/32 --dport 80
-j DNAT --to-destination 127.0.0.1:8080

This basically bounces everything from ${OUTSIDE_IP}:80 to
${OUTSIDE_IP}:8080, but only after marking the packets.  Why mark them
first ? Well, as you can see, stuff going to ${OUTSIDE_IP}:8080 gets
REJECTed, unless it's MARKed.  This way, to the outside world, it
appears as though port 8080 is just another dead TCP port nobody is
listening on (at least, that's what I'm hoping).

As you can see, I made similar bounces for the inside interface and the
loopback interface.  Notice that for the loopback interface the rule has
to be added to the OUTPUT chain, not the PREROUTING chain (took me about
an hour to figure that one out :o/ )

I didn't add MARK lines for lo and my local interface, because, so what
if people realize that ports 80 and 8080 do the same thing ?

Still, if somebody knows a solution to my original question,

> Why doesn't this work ?
>=20
> /sbin/iptables -t nat -A PREROUTING -p tcp --destination
> 192.168.1.1/32 --dport 80 -j DNAT --to-destination 127.0.0.1:8080

 please-oh-please share !



Thanks everybody !


