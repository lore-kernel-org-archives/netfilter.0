From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT?
Date: Tue, 29 Oct 2002 13:07:33 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210291307.g9TD7he10081@vulcan.rissington.net>
References: <003f01c27f47$60e06740$c800640a@grooverider>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003f01c27f47$60e06740$c800640a@grooverider>
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
To: NetFilter Mailing List <netfilter@lists.samba.org>

On Tuesday 29 October 2002 12:33 pm, Svavar =D6rn Eysteinsson wrote:

> Hi everyone.
> I?m very new to doing the SNAT thing.
>
> The thing is, is there any way to SNAT a individual computer on my
> internal network to a different public ip address?

Yes, you can SNAT anything you like to anything else you like.   So long as=
 a=20
packet goes through netfilter, you can SNAT it.

However, depending on what source address you give it, the replies may or m=
ay=20
not get back again, which is a separate routing problem, nothing to do with=
=20
netfilter.

Remember that if you send packets out through netfilter and NAT them, they =

will only get reverse-NATted if the replies come back through the same=20
netfilter machine.

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

