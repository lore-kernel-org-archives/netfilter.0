From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT, SNAT, Portforward
Date: Fri, 1 Nov 2002 08:58:23 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021101085825.SDDP292.mta03-svc.ntlworld.com@there>
References: <34BE59D9.590F1486.03240133@netscape.net> <200211010108.18555.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211010108.18555.netfilter@newkirk.us>
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

On Friday 01 November 2002 6:08 am, Joel Newkirk wrote:

> Question to list:  At what point in its own travels does the returning
> packet get automatically un-DNATed?  Prerouting again?

No, it happens in POSTROUTING - because it is then a SNAT operation.

Useful rule of thumb - in the FORWARD chain, all packets have their "real" =
IP=20
addresses.

That's because DNAT rules have already happened in PREROUTING, so packets n=
ow=20
have the destination address of the machine they're really being sent on to=
,=20
and SNAT rules have not yet happened in POSTROUTING, so packets still have =

the source address of the machine they really came in from.

Antony.

--=20

This email is intended for the use of the individual addressee(s) named abo=
ve=20
and may contain information that is confidential, privileged or unsuitable =

for overly sensitive persons with low self-esteem, no sense of humour, or=20
irrational religious beliefs.

If you have received this email in error, you are required to shred it=20
immediately, add some nutmeg, three egg whites and a dessertspoonful of=20
caster sugar. =A0 Whisk until soft peaks form, then place in a warm oven fo=
r 40=20
minutes. =A0 Remove promptly and let stand for 2 hours before adding some=20
decorative kiwi fruit and cream. =A0 Then notify me immediately by return e=
mail=20
and eat the original message.

