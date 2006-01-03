From: Jorge Davila <davila@cablenet.com.ni>
Subject: Re: pom-ng "condition" for 2.6 kernels
Date: Tue, 03 Jan 2006 08:25:00 -0600
Message-ID: <1136298300.2565.10.camel@davila.nicaraguaopensource.com>
References: <43B8526C.4040706@arcoscom.com>
	<1136224428.5569.9.camel@davila.nicaraguaopensource.com>
	<43BA8786.4070809@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43BA8786.4070809@arcoscom.com>
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
To: Samuel =?ISO-8859-1?Q?D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Cc: netfilter@lists.netfilter.org

well, you can do the next to avoid write some vars in the ./runme
command:

export KERNEL_DIR=3D/path/to/kernel/source/code
export IPTABLES_DIR=3D/path/to/iptables/source/code

in the patches source code, run:

./runme <pending|base|extras>

I don't exactly what option will show you the patch that you want apply.

Jorge.

El mar, 03-01-2006 a las 15:17 +0100, Samuel D=EDaz Garc=EDa escribi=F3:
> Fine, I know how to apply pom without problems.
>=20
> The problem is that applying over a 2.6.14.5 kernel (2.6.x kernels) the=
=20
> "condition" patch isn't showed for the apply.
>=20
> "Kovacs Krisztian" (hidden_#arroba#_balabit.hu) sent to me the patch to=
=20
> apply over an 2.6.14.5 kernel and appears to be working fine (at least=20
> applied, compiled and installed with the new compiled kernel).
>=20
> I had tried to found the problem, and I think that the "condition" isn'=
t=20
> ported into 2.6.x kernels because a "linux-2.6" directory doesn't exist=
=20
> into the "patchlets/condition", and that (I think) is because=20
> "condition" isn't showed while "./runme extra" is running.
>=20
> I want to know if really "condition" is included for 2.6 kernels into=20
> pom-ng and why is failing the "./runme".
>=20
> Sorry for my poor english.
>=20
> Regards.
>=20
> Jorge Davila escribi=F3:
>=20
> > In the patches source code directory:
> >=20
> > KERNEL_DIR=3D/the/path/to/kernel-2.6.14/source/code/directory
> > IPTABLES_DIR=3D/the/path/to/iptables/source/code/directory ./runme
> > <pending|base|extras>
> >=20
> > Of course, you need the source code for your kernel and for iptables.
> >=20
> > Jorge.
> >=20
> > El dom, 01-01-2006 a las 23:06 +0100, Samuel D=EDaz Garc=EDa escribi=F3=
:
> >=20
> >>Is there any way to apply "condition" patch into 2.6.14 kernel?
> >>
> >>I can see "linux" directory into "patchlets/condition" but not a=20
> >>"linux-2.6" directory.
> >>
> >>Any help about it?
> >>
> >>Thanks
> >>
>=20
--=20
Jorge Isaac Davila Lopez


