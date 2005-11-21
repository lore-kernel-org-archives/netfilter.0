From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: coming in through the outgoing hole?
Date: Mon, 21 Nov 2005 15:10:09 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01309A7C4@mailbox.vikus.com>
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
To: Keith Whyte <keith@media-solutions.ie>, netfilter@lists.netfilter.org

Inline...=20

> -----Original Message-----
> From: Keith Whyte [mailto:keith@media-solutions.ie]=20
> Sent: Monday, November 21, 2005 2:42 PM
> To: Derick Anderson; netfilter@lists.netfilter.org
> Subject: Re: coming in through the outgoing hole?
>=20
> Derick Anderson wrote:
>=20
> >>INPUT
> >>0     0 ACCEPT     tcp  --  eth0   any     anywhere
> >>anywhere           tcp spt:http dpts:1024:65535
> >>OUTPUT
> >>0    0 ACCEPT     tcp  --  any    eth0    anywhere
> >>anywhere           tcp spts:1024:65535 dpt:http
> >>   =20
> >>
> >
> >You don't need the 1024:65535 bit in either rule once you use=20
> >connection tracking. If you're trying to restrict this particular=20
> >machine from connecting to web servers using a source port=20
> below 1024,=20
> >this is already done for you unless the user is root.
> >
> no, i am trying to prevent a remote root user from making a=20
> connection to my machine.

OK, this makes sense.=20

> > If the user is root, then
> >OUTPUT filtering is meaningless (more so than if the user is=20
> not, which=20
> >is still quite a bit). Your OUTPUT filtering should really be egress=20
> >filtering in the FORWARD chain of your firewall. Hopefully=20
> you aren't=20
> >web surfing with your firewall.
> >
> >Stick around and I'm sure someone else will mention the general=20
> >pointlessness of OUTPUT filtering.
> >
> > =20
> >
> I should have made it more clear in my original post. The=20
> machine in this scenario is neither a firewall, nor a=20
> workstation. It's a server, a co-located remote machine. As=20
> such it is a kind of a workstation, or a potential workstation.
>=20
>  That doesn't take away from your agrument that OUTPUT=20
> filtering is pointless, but in this case, I decided to=20
> implement some OUTPUT filtering to be sure and avoid users=20
> (non-root of course) from using a shell account (or their=20
> php-enabled web account) to access certain services.
>=20
> Thanks very much for the rest of your response, and I think=20
> it answers more or less my question about using conntrack,=20
> but to try and make it more clear, the situation I wanted to=20
> avoid is the initiation of a connection, from source port 80=20
> (by root, of course) to port 7775 on the server machine. With=20
> the current rules this would pass the firewall.

Yes, and this can be mitigated by using conntrack and only allowing
--dport 80 inbound to the server, along with RELATED and ESTABLISHED
connections to keep things running. This way only port 80 is open on
your server. Your server can respond on a higher port but wouldn't be
able to initiate a connection on that port (a compromise would have to
reverse-tunnel over the existing connection).

> >iptables -A OUTPUT -p tcp -m state --state NEW --dport 80 -j ACCEPT
> >
> >What happens is the first packet goes out (in the NEW state,=20
> you could=20
> >get even more restrictive and use the '--syn' or '--tcp-flags=20
> >SYN,RST,ACK SYN' to make sure it's a SYN packet) on port 80 and hits=20
> >the remote server. The return packet (now ESTABLISHED) hits the=20
> >ESTABLISHED match at the top of your INPUT ruleset there and=20
> goes on its merry way.
> >The next packet out from the machine (also ESTABLISHED) hits the=20
> >ESTABLISHED match in the OUTPUT chain and is accepted as well.
> >Everything else that happens until the connection is closed goes=20
> >through the RELATED,ESTABLISHED rules and not through the=20
> '--dport 80' rule.
> >
> > =20
> >
> I'm also using the rules for traffic counters, so I don't=20
> want to do that, but yes, it would simplify things as lot.

If you want traffic counters you can always put rules above these with
no -j ACCEPT at the end. The rules will in effect do nothing other than
show up in an iptables -vnL. This way you keep the integrity of your
firewall and still get the traffic counted.=20
=20
> >>as a hypothetical example of the problem:
> >>let's say i run an admin type webserver for some app,=20
> >>listening on a port above 1024, for example. if someone=20
> >>hacked a web client to use port 80 as the source port for=20
> >>it's connections,  (dunno, would you have to hack the kernel=20
> >>too, or just be root?) , then they could bypass the firewall=20
> >>part of the security, right? or with ssh, surely it would be=20
> >>easy enough to hack an ssh client to use port 80 as it's=20
> source port.
> >>ok, so you probably shouldn't run an ssh listener on a port=20
> >>above 1024, but nevertheless, it's a good hole to close.
> >>
> >>thanks!
> >>
> >>Keith.
> >>   =20
> >>
> >
> >Once someone has rooted your machine, local firewalls and=20
> whatever else
> >are meaningless. Let's say though that only the service (Apache for
> >example) was compromised: You still have a legitimate=20
> service running,
> >accepting connections from port 80 (which by the way, is how=20
> the exploit
> >would have been launched in the first place) and sending information
> >back out on unprivileged ports. The result is the same, you=20
> can't block
> >the bad traffic with a firewall unless it's doing content inspection.
> >
> > =20
> >
> That's totally understood, I wasn't in anyway trying to use=20
> netfilter to=20
> protect the box from somebody who already has root!
> I am trying to protect it from root user on a remote attacker=20
> machine, I=20
> was referring to that remote machine when I mentioned a potential web=20
> client making connections from port 80.
>=20
> Keith

Understood and glad to help out some.

Derick Anderson

