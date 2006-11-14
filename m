From: Eric Leblond <eric@inl.fr>
Subject: Re: cannot find -ldl
Date: Tue, 14 Nov 2006 13:46:30 +0100
Message-ID: <1163508390.8996.1.camel@localhost.localdomain>
References: <A656C409D135BD44A5901A88AD851E5E04B16F@tlvex02.alvarion.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A656C409D135BD44A5901A88AD851E5E04B16F@tlvex02.alvarion.com>
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
To: Vladimir Iskoz <Vladimir.Iskoz@alvarion.com>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Hi,

Le mardi 14 novembre 2006 =E0 13:27 +0200, Vladimir Iskoz a =E9crit :
> Hi all,
> I'm trying to add firewall functionality to my current project. I'm start=
ing with adding iptables (1.3.4) to my project using Buildroot menucofig to=
ol.
> Unfortunately I received the following error during the link:
> cannot find -ldl

You should try to compile it statically as you plan to use it on an
embededded system.
In iptables Makefile uncommment :
# NO_SHARED_LIBS =3D 1

BR,

>=20
> I tried to removed -ldl from iptables Makefile but receive the other erro=
rs:
> undefined reference to 'dl_open'
> ...
>=20
> I'm using armeb-linux-uclibc-gcc=20
>=20
> Where are I can find corresponding libdl.a (I did not find it in my proje=
ct)?
> What workaround can be done?
>=20
> The last rows during Buildroot compilation before the Error are:
> /home/vladimir/R2/osdk/buildroot/build_armeb_nofpu/staging_dir/bin/armeb-=
linux-uclibc-gcc -Os -pipe  -membedded-pic -Wall -Wunused -I/include -Iincl=
ude/ -DIPTABLES_VERSION=3D\"1.3.4\"  -D_UNKNOWN_KERNEL_POINTER_SIZE -DIPT_L=
IB_DIR=3D\"/usr/lib/iptables\" -rdynamic -o iptables iptables-standalone.c =
iptables.o libiptc/libiptc.a -ldl -lnsl
> /home/vladimir/R2/osdk/buildroot/build_armeb_nofpu/staging_dir/bin-ccache=
/../lib/gcc/armeb-linux-uclibc/3.4.5/../../../../armeb-linux-uclibc/bin/ld:=
 cannot find -ldl
>=20
> What is a preferable way to add iptables: add them to Buildroot menu or e=
xplicitly to Linux Kernel menu in Network Options?
>=20
> My Target details:
> Architecture: ARM
> OS: uClinux
> Linux Kernel: 2.6.14
> Cross Compilation Tool: Buildroot
>=20
> Thanks a lot for any help
>=20
> Vladi Iskoz
>=20
>=20
>=20
>=20
> =20
>=20
> *************************************************************************=
***********
> This footnote confirms that this email message has been scanned by
> PineApp Mail-SeCure for the presence of malicious code, vandals & compute=
r viruses(42).
> *************************************************************************=
***********
>=20
>=20
>=20
>=20


