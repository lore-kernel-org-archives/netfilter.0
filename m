From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: coming in through the outgoing hole?
Date: Mon, 21 Nov 2005 13:58:17 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01309A7B3@mailbox.vikus.com>
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

Response inline:=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Keith Whyte
> Sent: Monday, November 21, 2005 12:59 PM
> To: netfilter@lists.netfilter.org
> Subject: coming in through the outgoing hole?
>=20
> here's a scenario
> i have opened outgoing webserver requests and their resposes=20
> thus (output from iptables -v -L)
>=20
> INPUT
> 0     0 ACCEPT     tcp  --  eth0   any     anywhere
> anywhere           tcp spt:http dpts:1024:65535
> OUTPUT
> 0    0 ACCEPT     tcp  --  any    eth0    anywhere
> anywhere           tcp spts:1024:65535 dpt:http

You don't need the 1024:65535 bit in either rule once you use connection
tracking. If you're trying to restrict this particular machine from
connecting to web servers using a source port below 1024, this is
already done for you unless the user is root. If the user is root, then
OUTPUT filtering is meaningless (more so than if the user is not, which
is still quite a bit). Your OUTPUT filtering should really be egress
filtering in the FORWARD chain of your firewall. Hopefully you aren't
web surfing with your firewall.

Stick around and I'm sure someone else will mention the general
pointlessness of OUTPUT filtering.

> now, it occurs to me that i have opened access to ports 1024=20
> to 65535, as long as the source port is port 80, correct?
> where as I only want it open for connections originating on=20
> the local machine.

The INPUT and OUTPUT tables are only valid for traffic originating and
terminating at the local machine, so you've accomplished that goal.

> I presume the answer here is conntrack, could someone help me=20
> with the command for the INPUT chain?
> should it be --state RELATED or ESTABLISHED or both or=20
> something like !
> NEW (if that can be done)?

Yes - the solution is to allow all RELATED,ESTABLISHED connections. I'm
still assuming this is a workstation and not a firewall/router box.
You'll want to use these rules:

iptables -I INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -I OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

This will accept all incoming (server response) and outgoing (client
requests) traffic which is related to the original request (dport 80).
Notice the use of -I instead of -A: this places the rules at the top of
the chain because they will get hit the most.

In addition I would suggest something like this if you are really intent
on doing OUTPUT filtering (which I again will say is really not that
great) to replace your two rules above:

iptables -A OUTPUT -p tcp -m state --state NEW --dport 80 -j ACCEPT

What happens is the first packet goes out (in the NEW state, you could
get even more restrictive and use the '--syn' or '--tcp-flags
SYN,RST,ACK SYN' to make sure it's a SYN packet) on port 80 and hits the
remote server. The return packet (now ESTABLISHED) hits the ESTABLISHED
match at the top of your INPUT ruleset there and goes on its merry way.
The next packet out from the machine (also ESTABLISHED) hits the
ESTABLISHED match in the OUTPUT chain and is accepted as well.
Everything else that happens until the connection is closed goes through
the RELATED,ESTABLISHED rules and not through the '--dport 80' rule.

> as a hypothetical example of the problem:
> let's say i run an admin type webserver for some app,=20
> listening on a port above 1024, for example. if someone=20
> hacked a web client to use port 80 as the source port for=20
> it's connections,  (dunno, would you have to hack the kernel=20
> too, or just be root?) , then they could bypass the firewall=20
> part of the security, right? or with ssh, surely it would be=20
> easy enough to hack an ssh client to use port 80 as it's source port.
> ok, so you probably shouldn't run an ssh listener on a port=20
> above 1024, but nevertheless, it's a good hole to close.
>=20
> thanks!
>=20
> Keith.

Once someone has rooted your machine, local firewalls and whatever else
are meaningless. Let's say though that only the service (Apache for
example) was compromised: You still have a legitimate service running,
accepting connections from port 80 (which by the way, is how the exploit
would have been launched in the first place) and sending information
back out on unprivileged ports. The result is the same, you can't block
the bad traffic with a firewall unless it's doing content inspection.

Derick Anderson

