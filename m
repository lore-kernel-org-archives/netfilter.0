From: Joel Newkirk <netfilter@newkirk.us> (by way of Joel Newkirk <netfilter@newkirk.us>)
Subject: Re: how to block kazaa ?
Date: Wed, 26 Feb 2003 01:07:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302260107.53568.netfilter@newkirk.us>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

On Wednesday 26 February 2003 12:27 am, you wrote:
> Joel Newkirk wrote:
> > But newer implementations apparently support port-hopping, so it
> > seems that the only confirmed way to stop it with iptables is with
> > the STRING match from patch-o-matic, and block anything with the
> > string "kazaa" (don't recall case requirements) in it.  Compiling a
> > custom kazaa-blocking kernel may be more than you want to do,
> > though.
>
> This strikes me as a pretty bad idea; it'll block more than just kazaa
> packets. For one thing, it would block a description of how to

True, as described it does.  I kept searching old emails for the actual
string that appears in the header of kazaa requests and couldn't find
it.  The message misspelled kazaa, but I finally found it.

iptables -I FORWARD -p tcp -m string --string "KazaaClient" -j REJECT
--reject-with tcp-reset

 "KazaaClient" is a fairly distinct string to search for, but again
 would then catch this email.  You'd have to ACCEPT tcp port 25,80,110
 then drop anything with the string, then handle the remainder of your
 rules to be safest with this approach.  Apparently V1 and V2 Kazaa both
 use this string in every connection attempt.

> implement the block, unless it were obfuscated to get past itself,
> which seems silly to me. And maybe people talking about kazaa also.
> And even random binary sequences aren't that unlikely to have
> problems. The odds of a given seven random bytes matching are only
> 1/2^(5*8)=3D1/2^40. But if you transfer 1GB/day, multiply that by
> (2^30)/5. Then you're talking about odds of 5 in 1024 that you'll have
> at least one random packet blocked per day. I predict emails,
> compressed files, etc. that won't transfer for no apparently reason
> because part of it consistently won't transfer.
>
> > Also, if the primary bottleneck is outbound, you might find that
> > using the mangle table in prerouting to set TOS for certain
> > desirable traffic and enacting pfifo queuing discipline will help a
> > great deal - IE change TOS to a favorable value (0x10 perhaps) for
> > specific traffic like HTTP SMTP POP3 IMAP or any VNC or such and
> > then setting TOS to a 'bulk traffic' value (0x02 for example) for
> > the remainder, or for the P2P traffic if it is identifiable.  The
> > pfifo qdisc will always send the 0x10 traffic, and send 0x02 only if
> > there is nothing else waiting to be sent.
>
> I like this much more. It solves the real problem of bandwidth usage

I'm using it as we speak, I have a p2p session with edonkey running, and
a few minutes ago 4 players on the UT server (both are actually hosted
on the firewall box itself) and we had some of the best connection
speeds in-game ever, while I had 5k/s up and 20k/s down connections in
P2P.  (the 20k was actually limited by the source, not my system)

> while still allowing them to do it. And I'll guess that the port
> hopping only moves on if it doesn't work, not if it has a less
> favorable TOS value. So it will stay on the easily-identifiable ports.
> Or like you said, you could increase the TOS for packets you're sure
> aren't P2P stuff if that doesn't work out.

Only for outbound traffic though - if all the downlink bandwidth is
 being consumed then at the firewall is far too late to help.  You can
 play around with ingress policing and other approaches to try to slow
 the incoming data, but the most effective solution really seems to be
 the keyboard-upside-the-head approach.  Nevertheless, just lowering p2p
 outbound traffic to 'bulk' rating will actually help apparent downlink
 speeds, since interactive tasks like browsing will be able to send
 requests and control messages and such out without getting buried in
 the p2p flood.

The pfifo qdisc sets up three priorities for traffic.  Basically
priority, normal, bulk.  If you lower something to bulk then anything
unmodified will take precedence, since normal is the default.

> Scott

j


