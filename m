From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Port Scanner
Date: Wed, 5 Nov 2003 15:22:06 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311051522.hA5FMLr13179@agate.rockstone.co.uk>
References: <200311051507.hA5F74O37678@alf1.lmb.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311051507.hA5F74O37678@alf1.lmb.internal>
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
To: netfilter@lists.netfilter.org

On Wednesday 05 November 2003 3:06 pm, tsh@mrc-lmb.cam.ac.uk wrote:

> I was thinking about just this the other night, and is seems to me that
> such a rule should be rejecting stuff which exceeds the rate limit rath=
er
> than accepting stuff which doesnt exceed it, since the -j ACCEPT will m=
ean
> that any subsequent rules in a FORWARD table wont be tested.
>
> Something like
>
> iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit ! l=
imit
> 1/s -j DROP

Why do people want to ACCEPT any packets of this type at all?   If a pack=
et=20
is part of an ESTABLISHED connection then it is going to pass through you=
r=20
FORWARD chain on the connection tracking rule; if a packet is not part of=
 an=20
ESTABLISHED connection, then it's either a valid new connection (in which=
=20
case you ACCEPT it), or else it isn't (in which case you don't ACCEPT it).

I can't quite see why you would want to accept even a slow rate of such=20
packets.

Regards,

Antony.

--=20

This email is intended for the use of the individual addressee(s) named a=
bove=20
and may contain information that is confidential, privileged or unsuitabl=
e=20
for overly sensitive persons with low self-esteem, no sense of humour, or=
=20
irrational religious beliefs.

If you have received this email in error, you are required to shred it=20
immediately, add some nutmeg, three egg whites and a dessertspoonful of=20
caster sugar. =A0 Whisk until soft peaks form, then place in a warm oven =
for 40=20
minutes. =A0 Remove promptly and let stand for 2 hours before adding some=
=20
decorative kiwi fruit and cream. =A0 Then notify me immediately by return=
 email=20
and eat the original message.
                                                     Please reply to the =
list;
                                                           please don't C=
C me.

