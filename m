From: "Rowan Reid" <rreid@studio3arc.com>
Subject: RE: Path-O-Matic
Date: Mon, 8 Jul 2002 08:42:30 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <003101c22696$12874500$6b01a8c0@s3ac>
References: <3D297073.7040801@zagros.ipm.ac.ir>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D297073.7040801@zagros.ipm.ac.ir>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: 'Alireza' <redhat@zagros.ipm.ac.ir>, netfilter@lists.samba.org



No expert but I'll see what I can do.

Before running patchomatic make sure you=20
Do compile yoru kernel.


Make pending_patches KERNEL_DIR=3D'/usr/src/linux' replace with your w/
your src=20
Make KERNEL_DIR=3D'/usr/src/linux'
Make install KERNEL_DIR=3D'/usr/src/linux'

Ignore upper case Make that=92s outlook trying to be smart.
Reading the INSTALL file wouldn't hurt either





> Dear Friends,
> I have kernel 2.4.18 and would like to use patch-O-matic, but I don't=20
> know how ?
> when I want to 'make patch-o-matic' . the patching process=20
> reject many=20
> features that I need to use for example, iplimit. would you=20
> please guide=20
> me to solve the problem.
>=20
>=20


