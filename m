From: Erik =?iso-8859-1?Q?Wikstr=F6m?= <eriwik@itstud.chalmers.se>
Subject: Re: [OT] Linux user logging
Date: Sat, 17 Jul 2004 14:11:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040717121121.GA47889@itstud.chalmers.se>
References: <20040715151459.6a8106e6@mgalepc.utilitran.com> <40F7EAE9.4070800@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <40F7EAE9.4070800@pbl.ca>
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

On Fri, Jul 16, 2004 at 09:49:13AM -0500, Aleksandar Milivojevic wrote:

> Michael Gale wrote:
> >Hello,
> >
> >	I know this is not a netfilter question but I was wondering if any=20
> >	one knows of a way to log all user activity. So if a
> >user logs in via a SSH connection I would like to log all user activit=
y.=20
> >What files the view or alter and any other
> >commands ?
>=20
> Yup, completely OT for this mailing list...
>=20
> What you are looking for is called auditing.  There are some projects=20
> for implementing it on Linux, but AFAIK nothing final and stable.  If I=
=20
> understood it correctly (and I might be completely wrong here), the=20
> major problem is that core group of Linux kernel developers is reluctan=
t=20
> in putting appropriate auditing hooks into kernel (not even as an=20
> compile time option for those that need it), for whatever reason.
>=20
> Note that good auditing is not trivial to configure, and depending on=20
> what you want to log, auditing can produce *huge* log files.

You might be interested in looking at BSD Process Accounting, which can
be found under General Setup in the kernel configuration. It should give
you information about which processed a user run and such things.

I also have a option called Enable Auditing (also under General Setup)
in my 2.6.7 kernel. Both of these probably need some userland tools but
I'm sure a search can give you what you need.

--
Erik Wikstr=F6m

