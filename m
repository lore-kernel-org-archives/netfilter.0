From: =?ISO-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Re: make: *** [../ipset/libipt_set.h] Error 1
Date: Thu, 27 Jan 2005 22:30:31 +0100
Message-ID: <41F95D77.5000902@arcoscom.com>
References: <41F94138.6050207@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41F94138.6050207@arcoscom.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Cc: netfilter@lists.netfilter.org

Well, I don't know if this "work around" can work, but editing=20
<iptables_dir>/extensions/ipt_SET.c and ipt_set.c comenting the #include=20
"../ipset/libipt_set.h" directive, now the make works.

Any developer can confirm this "patch"?

Thanks

    Samuel D=EDaz Garc=EDa
     Director Gerente
ArcosCom Wireless, S.L.L.

mailto:samueldg@arcoscom.com
http://www.arcoscom.com
m=F3vil: 651 93 72 48
tlfn/fax: 956 70 13 15


Samuel D=EDaz Garc=EDa wrote:
> After applying patch-o-matic-ng-20040621 (the last stable released)=20
> successfully, compile & install my patched kernel and trying compile=20
> iptables-1.2.11, the 'make KERNEL_DIR=3D/usr/src/linux-2.4.29' (obviously=
,=20
> my patched kernel is a 2.4.29), I get this error:
>=20
> Making dependencies: please wait...
> Something wrong... deleting dependencies.
> make: *** [../ipset/libipt_set.h] Error 1
>=20
> I think I need the 'ipset' sources, where are them?
> where do I need copy them to make iptables (and modules) sucessfully?
>=20
> Thanks
>=20
> (sorry for my english)
>=20

