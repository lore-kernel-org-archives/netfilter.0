From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: compile kernel with iptable support
Date: Wed, 15 Dec 2004 22:08:01 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F01984C@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Wes Zhang <pppxqqq@gmail.com>, netfilter@lists.netfilter.org

As a sample, check out the howto on compiling a kernel with mppe support
(from pptpclient.sourceforge.net).  James Cameron has done a great job a
detailing the changed in order to recompile the kernel (but this was for
pptp, simple enough to make your specific changes) as well as making the
redistributable package for RH based kernels.

I needed to rebuild my kernel for pptp_conntrack as well as mppe so I
did it all at once.

http://pptpclient.sourceforge.net/howto-redhat-80-build.phtml

HTH,=20

Gary

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Wes Zhang
> Sent: Wednesday, December 15, 2004 8:29 PM
> To: netfilter@lists.netfilter.org
> Subject: compile kernel with iptable support
>=20
> Hi,
>=20
> I am a newbie in iptable installation. While I was installing iptable
> 1.2.11, what's KERNEL_DIR? Is it the kernel directory that used to
> store the newly compiled kernel or kernel source code used to compile
> iptable?
>=20
> I also have following questions. I compiled iptable by following as
> instructed in INSTALLfile:
>    1. make KERNEL_DIR=3D"/boot"
>    2. make install KERNEL_DIR=3D"/boot"
> But when I execute "iptables -A POSTROUTING -t NAT -o eth0 -j
MASQUERADE"
> " ./iptables -A POSTROUTING -t NAT -o eth0 -j MASQUERADE
>    iptables: target `MASQUERADE' v1.2.10 (I'm v1.2.11)."
>=20
> Looks like I am totally lost here. Can someone shed some light here?
>=20
> Thanks,
> Wesley


