From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how many chains are part of the mangle table?
Date: Wed, 9 Oct 2002 22:19:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021009211946.KQXY459.mta02-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210090542060.13259-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210090542060.13259-100000@localhost.localdomain>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Wednesday 09 October 2002 10:49 am, Robert P. J. Day wrote:

>   for my own benefit, i'm trying to document the architecture of
> iptables, and i'm reading oskar andreasson's ubiquitous tutorial.

Good idea.   Good place to start :-)

>   early in that tutorial, he presents some tables showing the
> possible combinations of tables and chains, as well as a graphic
> portrayal of how packets traverse iptables.  in all of that,
> the mangle table is shown as being part of only two chains:
> PREROUTING and OUTPUT.

That was true of older versions of netfilter.   Newer versions, as you have=
=20
discovered, now have so-called "5-hooked mangle tables", so there are now 5=
=20
hooks into the mange table from each of the chains.

>   however, "iptables -L -t mangle" shows that the mangle table
> can incorporate rules in all five chains: INPUT, OUTPUT, FORWARD,
> PREROUTING and POSTROUTING, but that's not at all obvious from
> that tutorial.

That is because it was not true for the version of netfilter the version of=
=20
the tutorial you are reading was written for :-)

You might want to check the latest version of Oskar's tutorial at=20
http://iptables-tutorial.frozentux.net and see if he talks about all five=20
chains having mangle hooks now ?

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

