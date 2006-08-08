From: "Robert LeBlanc" <robert@leblancnet.us>
Subject: RE: 1:1 NAT Help
Date: Tue, 8 Aug 2006 08:43:14 -0600
Message-ID: <A78C6C481BFAE949BC5990E1EEB2FE125837@q.LeBlancNet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I'm running a 1:1 NAT and I have a difference in my rules and if someone
would be so kind as to explain the pro/cons of the differences, I'd
appreciate it. In the PREROUTING chain I do not specify the input
interface and in the POSTROUTING chain I do not specify the output
interface. It was my understanding that iptables would try to match the
traffic to the interface that made sense. This may be the reason that my
internal addresses are not able to ping my external address servers.
Hmmm .... something to think about.

Now, this might not be anywhere related, but using VMware and Debian
(the newer kernels) there is a problem with the IRQ interrupts on the
guest VMs. Basically, all the traffic is going out of the interface but
none comes back. Well it does come back, but it is not read because an
interrupt is not thrown and so the proc never 'sees' the traffic. I
think that this is a problem with the vmxnet driver though. I mention
this a maybe another area to look into.

Robert LeBlanc

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Sietse van Zanen
> Sent: Tuesday, August 08, 2006 6:52 AM
> To: netfilter@lists.netfilter.org
> Subject: RE: 1:1 NAT Help
>=20
> Seems like a connection trackking problem than.
>=20
> Are you sure you have all the modules loaded: ip_conntrack.o etc.?
>=20
> try executing these commands (in your firewall script):
> modprobe ip_conntrack
> modprobe ip_conntrack_ftp
> modprobe ip_conntrack_nat
> modprobe ip_nat
> modprobe ip_nat_ftp
> modprobe iptable_nat
>=20
> -Sietse
>=20
> ________________________________
>=20
> From: netfilter-bounces@lists.netfilter.org on behalf of Dan Ferris
> Sent: Tue 08-Aug-06 14:37
> To: netfilter@lists.netfilter.org
> Subject: Re: 1:1 NAT Help
>=20
>=20
>=20
> Forwarding is on in /etc/sysctl.conf
>=20
> As far as I know the routing is correct.  10.2.253.21 lives off of
eth1,
> and eth1 has a route for 10.2.0.0/255.255.0.0 (yes it sucks, I didn't
> set up the subnets).
>=20
> tcpdump shows traffic coming into both of the interfaces, which is why
> this problem is so frustrating.  Oh yes, SNAT works fine.  We can set
up
> a ping from the box behind the firewall to ping the Internet gateway,
> and the ping will go through fine.  We can see the replies to
> 204.184.20.221. :(
>=20
> Dan
>=20
> Sietse van Zanen wrote:
> > Then, is forwarding alllowed?
> > cat 1 > /proc/sys/net/ipv4/ip_forward
> >
> > And there is a correct route to 10.2.253.21?
> >
> >
> > If both answer to yes, what do you see when you tcpdump on your
internal
> interface on host 10.2.253.21 and try to connect to 204.184.20.221
from
> the Internet?
> >
> > And what do you see when you tcpdump on your external interface for
> 204.184.20.221, is traffic reaching your firewall?
> >
> > -Sietse
> >
> > ________________________________
> >
> > From: netfilter-bounces@lists.netfilter.org on behalf of Dan Ferris
> > Sent: Tue 08-Aug-06 14:14
> > To: netfilter@lists.netfilter.org
> > Subject: Re: 1:1 NAT Help
> >
> >
> >
> > Yes, because I cleared all the rules and set everything to accept
before
> > testing.
> >
> > Dan
> >
> > Sietse van Zanen wrote:
> >
> >> Are you sure, you also allow the connection in the FORWARD chain of
the
> filter table?
> >>
> >> iptables -i eth2 -d 10.2.253.21 -j ACCEPT
> >>
> >> -Sietse
> >>
> >> ________________________________
> >>
> >> From: netfilter-bounces@lists.netfilter.org on behalf of Dan Ferris
> >> Sent: Mon 07-Aug-06 20:56
> >> To: netfilter@lists.netfilter.org
> >> Subject: 1:1 NAT Help
> >>
> >>
> >>
> >> Dear List,
> >>
> >> I have search Google, and the list archives back to 2003 and have
found
> >> little information about this particular problem.
> >>
> >> First I present to you two very simplified rules.
> >>
> >> iptables -A PREROUTING -i eth2 -d 204.184.20.221 -j DNAT --to
> 10.2.253.21
> >>
> >> and
> >>
> >> iptables -A POSTROUTING -o eth2 -s 10.2.253.21 -j SNAT --to
> 204.184.20.221
> >>
> >> Having never really delt with 1:1 NAT before, I thought this would
> "just
> >> work".  However, it does not work.  The SNAT rule works fine.  The
DNAT
> >> rule does not work at all.  I don't even see packets hitting it.
> >>
> >> A few other pieces of information:
> >>
> >> 1.  Proxy arp does not seem to be a problem.  When I SSH to the
> external
> >> IP, I can see the ethernet frames coming into the ethernet
interface.
> >>
> >> 2.  I have tried doing: ip addr add 204.184.20.221 dev eth2 and it
> still
> >> won't work.
> >>
> >> We have an old POS box running Debian with Shorewall and kernel 2.4
> that
> >> works perfectly with the 1:1 NAT rules.  However, the friend I am
> >> helping does not want to use Shorewall, as she wishes to learn
iptables
> >> the old fashioned way.  The only difference between the old Debian
> >> firewall and the new one is the the new one is running CentOS and
the
> >> 2.6 kernel.
> >> The old firewall that works has proxy arp turned off and rp_filter
> >> turned on.  The new firewall has proxy arp turned off and rp_filter
> >> turned on.
> >>
> >> I'm really lost and I used to think I was decent at iptables.  So
if
> >> anybody can help it would be appreciated.
> >>
> >> Thank you!
> >>
> >> Dan
> >>
> >>
> >>
> >>
> >>
> >>
> >>
> >
> > --
> > What do you call a guy with no legs who is waterskiing?
> >
> >
> > Skip.
> >
> >
> >
> >
> >
> >
> >
>=20
> --
> What do you call a guy with no legs who is waterskiing?
>=20
>=20
> Skip.
>=20
>=20
>=20
>=20


