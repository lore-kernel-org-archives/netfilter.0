From: Jorge Davila <davila@cablenet.com.ni>
Subject: Re: pom-ng "condition" for 2.6 kernels
Date: Mon, 02 Jan 2006 11:53:47 -0600
Message-ID: <1136224428.5569.9.camel@davila.nicaraguaopensource.com>
References: <43B8526C.4040706@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43B8526C.4040706@arcoscom.com>
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

In the patches source code directory:

KERNEL_DIR=3D/the/path/to/kernel-2.6.14/source/code/directory
IPTABLES_DIR=3D/the/path/to/iptables/source/code/directory ./runme
<pending|base|extras>

Of course, you need the source code for your kernel and for iptables.

Jorge.

El dom, 01-01-2006 a las 23:06 +0100, Samuel D=EDaz Garc=EDa escribi=F3:
> Is there any way to apply "condition" patch into 2.6.14 kernel?
>=20
> I can see "linux" directory into "patchlets/condition" but not a=20
> "linux-2.6" directory.
>=20
> Any help about it?
>=20
> Thanks
>=20
--=20
Jorge Isaac Davila Lopez


