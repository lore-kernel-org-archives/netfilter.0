From: Steffen Schoenwiese <ss310636@inf.tu-dresden.de>
Subject: Re: Problem with DNAT
Date: Sat, 9 Nov 2002 21:36:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211092136.46643.ss310636@inf.tu-dresden.de>
References: <200211091837.00935.ss310636@inf.tu-dresden.de> <200211091518.22273.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211091518.22273.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@newkirk.us, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

> >
> > Hi,
> >
> > I have some problems with iptables 1.2.7a. Some of my rules which wor=
ked
> > well with iptables 1.2.5 produce an error message "iptables: Invalid
> > argument". The specific rules look like this:
> >
> > iptables -t nat -A OUTPUT -p tcp -d <ip> -j DNAT --to <ip>:<port>
> >
> > I also tried to use --to-destination instead of --to, same error mess=
age.
> > All my other rules work perfect, only the DNAT ones get this error.
> > Does anyone have a possible solution?
>
> All nat table rules, or are SNAT and MASQ accepted?  Do you have a insm=
od
> or modprobe iptable_nat?  I don't know your prior/current setup, but it
> might have been compiled in before, a module now.
>
> j

SNAT doesn't work either, MASQ works. iptable_nat is loaded. The system I=
'm=20
running is a new SuSE 8.1 if that helps.

Steffen

- --=20
Quote of the minute:

printk("Illegal format on cdrom.  Pester manufacturer.\n");=20
=092.2.16 /usr/src/linux/fs/isofs/inode.c
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9zXHcByWeP+lxCPMRAhc/AKCGP5TvNZg6MWpaHxhEm8v4XgCqIwCgk7rH
Ib5KwPR9klcbUfJcQxrfGKo=3D
=3DDbIC
-----END PGP SIGNATURE-----


