From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: what filtering to do on the OUTPUT chain?
Date: Tue, 22 Oct 2002 21:03:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021022200357.TCVO1554.mta07-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210221455120.15018-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210221455120.15018-100000@localhost.localdomain>
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

On Tuesday 22 October 2002 7:57 pm, Robert P. J. Day wrote:

>   i've had a number of people tell me that, while they put a
> good deal of thought into their INPUT filtering, they simply
> ACCEPT all outgoing traffic since, if their input filtering
> is working properly, there's no reason to stop outgoing
> packets.

There's no reason to filter outgoing packets unless you don't trust the=20
applications running on your machine.

If you don't trust what's running on your machine, then you should probably=
=20
fix more than just what netfilter allows.

Antony

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

