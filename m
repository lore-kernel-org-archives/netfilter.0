From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: how to block kazaa ?
Date: Tue, 25 Feb 2003 22:42:25 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302252242.25175.netfilter@newkirk.us>
References: <003d01c2dd40$fe922030$210aa8c0@sabirin>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003d01c2dd40$fe922030$210aa8c0@sabirin>
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
To: inghau@perkom.co.id, netfilter@lists.netfilter.org

On Tuesday 25 February 2003 09:44 pm, inghau@perkom.co.id wrote:
> hello
>
> i have some problems in my lan environment. most of my clients using
> kazaa to dowmload mp3 and mpg files. these progams eating most of my
> small bandwidth so can i put some rules to "block" these kazaa and
> other p2p program ?
>
> right now my linux boxes is just act as very simple NAT router using
> iptables
>
>
> thank you very much

If you want simply to keep them from working, then the answer is to DROP=20
traffic in FORWARD chain to/from the ports used for server or peer=20
communication.  For Gnutella/Limewire/Morpheus and kin, this means:

iptables -A FORWARD -p tcp --dport 6346:6347 -j DROP
iptables -A FORWARD -p udp --dport 6346:6347 -j DROP

for EDonkey & Overnet:

iptables -A FORWARD -p tcp --dport 4660:4666 -j DROP
iptables -A FORWARD -p udp --dport 4660:4666 -j DROP

for older Kazaa apparently this suffices:

iptables -A FORWARD -p tcp --dport 1214 -j DROP
iptables -A FORWARD -p udp --dport 1214 -j DROP

But newer implementations apparently support port-hopping, so it seems=20
that the only confirmed way to stop it with iptables is with the STRING=20
match from patch-o-matic, and block anything with the string "kazaa"=20
(don't recall case requirements) in it.  Compiling a custom=20
kazaa-blocking kernel may be more than you want to do, though.

If you want to be 'polite' then use the REJECT target instead of DROP, at=
=20
least for connections initiated from the LAN.  If you want to be=20
thorough, then LOG the traffic, find out who it is, and beat the kazaa=20
out of them with a keyboard... :^)

Also, if the primary bottleneck is outbound, you might find that using=20
the mangle table in prerouting to set TOS for certain desirable traffic=20
and enacting pfifo queuing discipline will help a great deal - IE change=20
TOS to a favorable value (0x10 perhaps) for specific traffic like HTTP=20
SMTP POP3 IMAP or any VNC or such and then setting TOS to a 'bulk=20
traffic' value (0x02 for example) for the remainder, or for the P2P=20
traffic if it is identifiable.  The pfifo qdisc will always send the=20
0x10 traffic, and send 0x02 only if there is nothing else waiting to be=20
sent.

j


