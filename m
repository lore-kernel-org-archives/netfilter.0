From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewall IP change
Date: Mon, 2 Aug 2004 13:26:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408021326.52657.Antony@Soft-Solutions.co.uk>
References: <40FEE340.8090907@ctwa.com> <200407241647.52286.Antony@Soft-Solutions.co.uk> <200408021407.07897.fred99@libertysurf.fr>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408021407.07897.fred99@libertysurf.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

On Monday 02 August 2004 1:07 pm, Fr=C3=A9d=C3=A9ric Gonzatti wrote:

> If I replace in my iptables script :
> iptables -A POSTROUTING -t nat -o eth2 -j SNAT --to my_public_IP
> by
> iptables -t nat POSTROUTING -o eth1 -j MASQUERADE
>
> ...I can access to the internet faster !
>
> Have you got any idea ?

Which is your external interface?   eth1 or eth2?

How are you measuring "faster"?

Where are your DNS servers?

Regards,

Antony.

--=20
In Heaven, the police are British, the chefs are Italian, the beer is Bel=
gian,=20
the mechanics are German, the lovers are French, the entertainment is=20
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is Americ=
an,=20
the mechanics are French, the lovers are Swiss, the entertainment is Belg=
ian,=20
and everything is organised by the Italians.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


