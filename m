From: "Miguel Laborde" <Miguel.Laborde@qlogitek.com>
Subject: RE: New connection to windows boxes very slow, very fast afterinitial delay
Date: Tue, 16 Mar 2004 10:33:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <C8DE82BEF24D0146862937D2A9DD0E92026843@qlmail2.qlogitek.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi Ray,=20
	thanks for the reply however I don't think this is a netbios issue. I =
realize I said \\dmzmachine but really in this case I'm using an IP =
address and I'm connecting to the c$ drive so there shouldn't be any =
Netbios name lookups (unless Windows does this either way) and neither a =
need to query for shares. Farthermore, this firewall is a replacement =
for another which was no where as restrictive; no tracking of internal =
connections to the dmz in a stateful manner. The part that farther makes =
me suspicious is why does the src machine start sending packets with the =
AP flags and never receive anything back from the dst machine until it =
starts a new SYN connection (aside from the ICMP request/reply just =
before hand)? If the explanation was one of latency I would expect to =
see this apply to internal machines too and not just when connecting to =
DMZ machines. In my mind there is no way that a 10second delay can be =
explained simply due to a few extra meters of network cable and having =
to pass through the firewall from one subnet to another, especially =
since there is no traffic delay between machines once the initially =
delay has passed.


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Ray Leach
Sent: Tuesday, March 16, 2004 1:08 AM
To: Netfilter Mailing List
Subject: Re: New connection to windows boxes very slow, very fast
afterinitial delay


On Mon, 2004-03-15 at 16:27, Miguel Laborde wrote:
> Hello all,
>=20
> 	I have a question that I'm sure some of you will be able to answer =
since I vaguely remember something which might be related to
>  this. Awhile ago I read that MS had implemented a nonstandard =
'feature' with respect to TCP/IP in which they appeared to skip the SYN=20
> step and go straight to an ACK for re-establishing a connection to a =
previously (assumeably within a certain time constraint) connected=20
> machine. Here is the article I was rememebering(just found it on =
Google), now this has to do with IE, but I'm sure this 'feature'=20
> happens at the stack level and not application so it applies to any =
network related activity=20
> - http://grotto11.com/blog/slash.html?+1039831658
>=20
> 	I'm having a similiar situation when connecting from a windows =
machine to another windows machine in the DMZ with an=20
> iptables firewall between. I've noticed, as well as others, that after =
not connecting to the machine for awhile (ie: after a weekend)=20
> the initial connection results in about a 10-15 second delay however =
following connections are instantaneous. When I say connection=20
> here I'm meaning connection to a share on the machine such as =
\\dmzmachine\share and the explore window popping up.=20

This is the way that the SMB protocol works. It is UDP based, and
therefore 'connectionless' and entirely based on broadcasts. What is
most likely happening is that the local netbios name cache on your
source machine has been expunged of old entries (probably a preset time)
and your machine therefore has to re-lookup the ip/name pair for the
target machine and possibly re-authenticate, re-query all the shares,
etc.
>=20
> 	I've capture the interation with snort and noticed something that =
seems to confirm what I state in the first paragraph.
>=20
> 	After the weekend, haven't connected for days, this is the initial =
connection (all the Snort output). Note the packet flags are AP until =
there is some ICMP activity, presumably checking the host is up, and =
then starting with a SYN packet. When I try again we carry off right =
away with the an ACK/PUSH packet without any delay. My assumption is =
iptables has timed out the connection after seeing no activity for hours =
and as a result deleted it from memory. When the windows machine tries =
to reconnect without a SYN packet it never gets through since IPtables =
has no memory of this ever being an established connection.  Does my =
conclusion sound reasonable to others?
>=20

<snip>

