From: Nox <pheusion@snet.net>
Subject: Re: why must linux for halted firewall?
Date: Tue, 16 Sep 2003 17:58:31 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063749510.11520.36.camel@shaolin.gridlocksecurity.com>
References: <BAY8-F93nZtpNHH7nqd000177b8@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY8-F93nZtpNHH7nqd000177b8@hotmail.com>
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
To: Chua Boon Ping <nitb@hotmail.com>
Cc: netfilter@lists.netfilter.org

From personal experience, I couldnt tell you that OpenBSD will support
it, as we have yet to try it.

But I see no reason as to why it couldnt be "Figured out"
It would just be a matter of fiddling with files, like the article said,
alot of trial and error.



>Le mar 16/09/2003 =E0 21:33, Nox a =E9crit :
> the drawback is we currently have no logging enabled.
> (We are working on it.

>LIDS guys have developped a kernel side SMTP client so their system
>can >send alerts without interaction with userland. I don't think they
have kernel side syslog.

Using an MTA was what was suggested to me, and that is what we are
currently investigating..
Thanks for the heads up


Nox
GenMicro systems
Bioinformatics applications and devices
(Website in development)

On Tue, 2003-09-16 at 15:43, Chua Boon Ping wrote:
> well... i am currently doing a research paper on Halted Firewall on Lin=
ux=20
> platform. I would like to know can OpenBSD implement such a firewall? c=
an=20
> OpenBSD halted just like Linux kernel does?
>=20
> i had read the article. thanks.
>=20
>=20
> >From: Nox <pheusion@snet.net>
> >To: Chua Boon Ping <nitb@hotmail.com>
> >CC: netfilter@lists.netfilter.org
> >Subject: Re: why must linux for halted firewall?
> >Date: Tue, 16 Sep 2003 15:33:36 -0400
> >
> >For us,
> >We have a runlevel 0 firewall, from Debian
> >it was developed in house, fine tuned by this article:
> >
> >http://www.samag.com/documents/s=3D1824/sam0201d/0201d.htm
> >
> >For us, this FW protects a Bioinformatics cluster,
> >which rarely changes on the rules side of things,
> >the benefit form our standpoint is the non-access into the machine,
> >(No user priv escalation due to no logon)
> >the drawback is we currently have no logging enabled.
> >(We are working on it.
> >
> >Hope that helps
> >
> >Nox
> >GenMicro systems
> >Bioinformatics applications and devices
> >(Website in development)
> >
> >On Sun, 2003-09-14 at 23:16, Chua Boon Ping wrote:
> > > dear all,
> > >    I am newbie in open source and recently i am busy on some assign=
ment
> > > concerning "why opts for Linux(netfilter/iptables) rather than Open=
BSD=20
> >to
> > > implement a Halted Firewall". actually, can OpenBSD be halted just =
like
> > > Linux kernel do? As i mentioned, i am newbie and would like have so=
me
> > > guidance from you guys. Thanks.
> > >
> > > Chua
> > >
> > > _________________________________________________________________
> > > Using a handphone prepaid card? Reload your credit online!
> > > http://www.msn.com.my/reloadredir/default.asp
> > >
> > >
> >
>=20
> _________________________________________________________________
> Are you in love? Find a date on MSN Personals http://match.msn.com.my/
>=20
>=20


