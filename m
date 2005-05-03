From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: TCP_CONNTRACK_ESTABLISHED 5days
Date: Tue, 3 May 2005 11:23:48 +0300
Message-ID: <1403218a0505030123f2e857c@mail.gmail.com>
References: <42762C02.8060300@danbbs.dk> <427634ED.1030204@danbbs.dk>
	<427639CD.6080107@riverviewtech.net> <42764CF2.9060503@danbbs.dk>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42764CF2.9060503@danbbs.dk>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: monz@danbbs.dk
Cc: netfilter <netfilter@lists.netfilter.org>, "Taylor,
	Grant" <gtaylor@riverviewtech.net>

On 5/2/05, Mogens Valentin <monz@danbbs.dk> wrote:
> Taylor, Grant wrote:
> >> Moritz, thanks for pointing that out.
> >> Your suggested 10 minutes seems a bit short, though..
> >
> >
> > I would not set ip_conntrack_tcp_timeout_established to any thing lower
> > than tcp_fin_timeout.  I would be tempted to set
> > ip_conntrack_tcp_timeout_established to approximately double what
> > tcp_fin_timeout is set to.  I don't know of any reason that conntrack
> > would need to keep things for twice tcp_fin_timeout, but I'd rather be
> > safe than sorry.  Besides even double of tcp_fin_timeout is CONSIDERABL=
Y
> > less than 5 days.
>=20
> Hmm, dunno if various distros set tcp_fin_timeout differently.
> With 2.6.10, it's 60 secs (not a distro kernel, and I didn't set this).
> Are you saying that Mouritz' 10mins will in some (distro?) cases violate
>    ip_conntrack_tcp_timeout_established >=3D tcp_fin_timeout * 2 ?
>=20

In debian3.1 it is 5 days too !!!

The question now, what troubles would happen if we kep it/changed it !?!?!

> Anyway, /usr/src/linux/Documentation/filesystems/proc.txt says
>=20
> tcp_fin_timeout
> ---------------
> The length of time in seconds it takes to receive a final FIN before the
> socket is always closed.  This is strictly a violation of the TCP
> specification, but required to prevent denial-of-service attacks.
>=20
> I'm having trouble understanding the 'strictly a violation' part.
> Is it a (iana) crime to define tcp_fin_timeout?
>=20
> --
> Kind regards,
> Mogens Valentin
>=20
>=20


--=20
Mohamed Eldesoky
www.eldesoky.net
RHCE

