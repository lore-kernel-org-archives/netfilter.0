From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: intermittent and unreliable behaviour with iptables scripts
Date: Tue, 12 Nov 2002 01:30:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211120130.53077.netfilter@newkirk.us>
References: <91F7518FF779D41181A700010266356D015555D6@mail.springbound.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <91F7518FF779D41181A700010266356D015555D6@mail.springbound.com>
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
To: Doug Watson <doug@1stbooks.com>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Monday 11 November 2002 12:25 pm, Doug Watson wrote:
> Fellow list users,
>
> I have been attempting to set up a new firewall for my company with the
> two goals of 1. implementing statefull packet filtering and 2.
> creating a DMZ for servers that need to be accessed by the
> outside world, such as HTTP, SMTP, DNS and FTP.
>
> There seems to be a lot to describe here so please stick with me.

OK, but I'm going to snip liberally... :^)

> When browsing the web, web pages that normally would load very quickly =
seem
> to hang for an inconsistent amount of time, anywhere between 1 second t=
o 30

> I will note that when the firewall is in the state that no web pages wi=
ll
> load, pings to its LAN interface which usually return in about 1ms will
> time timeout, but I have not been able to link this to any specific net=
work

So the problem is probably occurring in PREROUTING or routing, since it h=
its=20
both forward and input packets. Try inserting in nat prerouting and filte=
r=20
forward and input:

$IPTABLES -t filter -I FORWARD 1 -i $LAN_IFACE -p ICMP -j LOG --log-level=
=20
debug --log-prefix "IPT:SlowPingFront: "
$IPTABLES -t filter -I FORWARD 1 -o $LAN_IFACE -p ICMP -j LOG --log-level=
=20
debug --log-prefix "IPT:SlowPingBack: "

Reproduce your problem and slow ping (-i 10 perhaps, -w 10000 from window=
s)=20
from the lan to the firewall and beyond, and see what picture the log pai=
nts. =20
If the ping is just dying somewhere you can (hopefully) see it's trail.  =
If=20
it's really slow (several seconds) you've hopefully narrowed it down to W=
HERE=20
it's slowing.

Check /proc/net/ip_conntrack, general memory issues, and top.

> Also overall speed of our connection seems to be noticeably slower when
> running through this firewall. One example be it a good one or not is
> when running the high speed bandwidth test at http://www.bandwidthplace=
=2Ecom
> through the current firewall the average speed returned is between 1.0 =
and

> same test through the new iptables based firewall the average speed
> returned usually in the range of 600 to 800 Kbps.

This is quite possibly the same thing as above, just in a less intrusive =
part=20
of the cycle...  However, I had a few suggestions on your forward and=20
bad_tcp_packets chains.

- disclaimer -
below is largely feng shui firewalling.  After a dozen readings of your=20
firewall (cigarette breaks outside :^) it just didn't 'feel' right, and t=
he=20
changes below 'improve the flow' and 'feel right' often without any firm=20
justification.  (along with some clarity and simplicity)  However, you DI=
D=20
ask for thoughts in general...
- /disclaimer -

Move the spoof tests from bad_tcp_packets to their own chain, or just mov=
e the=20
state tests directly to the start of forward and input.  (Do you need the=
m=20
for output?  You certainly don't need to test for -i $INET_IFACE in=20
output...)  Call the spoof tests next, to catch both $LAN and $DMZ bound=20
spoofs.

You currently accept EST/REL from $INET back to $DMZ, then have tests for=
 new=20
connections on that route, then blanket EST/REL.  Make your unrestricted=20
EST/REL rule next instead, followed by your $LAN accept rule, unless you =
want=20
to block otherwise valid EST/REL involving the DMZ, in which case the=20
following two rules have to come before the EST/REL.  -i $LAN -o $DMZ ACC=
EPT=20
is redundant, picked up in the -i $LAN ACCEPT that follows in your curren=
t=20
sequence, and EST/REL -i $INET -o $DMZ or -o $LAN are subsumed in the bla=
nket=20
accept.

Follow this up with a jump for -o $DMZ_IFACE -j DMZin, then  -o $DMZ_IFAC=
E -j=20
DMZout.  and move all appropriate rules to those chains.  Now you can tre=
at=20
DMZin almost like INPUT for the DMZ, and DMZout like OUTPUT, and keep all=
 DMZ=20
rules separate from lan<->inet.  You can easily insert/remove a blanket=20
accept/reject/drop/return target at the head, or add 'policy' at the end.=
 =20
All that these rules need to test now is protocol related, the other 3=20
matches for each -i $INET rule are eliminated.  (unless you later use -d =
or=20
-p to filter various DMZ forwards differently)  Also, if you have this be=
fore=20
your EST/REL then the DMZ chains should each get their own EST/REL at the=
ir=20
end, before any 'policy' rule.

Finish out with your log rule.  Don't forget to change INPUT (and OUTPUT)=
 to=20
reflect the removal of bad_tcp_packets, if you integrated the state rules=
=2E

Thus ends today's session of Feng Shui Firewalling.  :^)  The resulting s=
cript=20
is simpler and more easily modified than currently, and the process is=20
simpler than the instructions.  As far as I see, it achieves the same=20
filtering and forwarding as your current script with potentially far less=
=20
rule tests per packet, but if I've missed something somebody please corre=
ct=20
me.

j

