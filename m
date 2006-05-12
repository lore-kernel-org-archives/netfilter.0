From: Andre Kalamandeen <x_trodinary@yahoo.com>
Subject: Re: Policy routing with mark not working.
Date: Fri, 12 May 2006 06:53:50 -0700 (PDT)
Message-ID: <20060512135350.98132.qmail@web53302.mail.yahoo.com>
References: <4464694E.8030309@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4464694E.8030309@plouf.fr.eu.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hey, i figured out what the problem was, i was passing
all packets through squid, so when it was maked in the
mangle PREROUTING chain, squid removed the marks since
it doesnt support them, but changing the chain to
OUTPUT solved this prob. Thanks to all.

--- Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
wrote:

> Hello,
>=20
> Frank a =E9crit :
> > Also, after much time banging my head against the
> wall trying to
> > figure out why my marks were ignored, I discovered
> that in spite of
> > what the netfilter packet traversal diagram shows,
> marks set in
> > PREROUTING are ignored for packets originating on
> the box doing the
> > routing, and the marks need to be set on the
> OUTPUT chain for that
> > case
>=20
> "In spite" ? What are you tacking about ? That's
> exactly what the=20
> Netfilter diagram shows : locally generated packets
> don't go through the=20
> PREROUTING chain - except when sent to (and
> therefore received back=20
> from) the loopback interface.
>=20
>=20


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20

