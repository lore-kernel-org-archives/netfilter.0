From: =?ISO-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: make: *** [../ipset/libipt_set.h] Error 1
Date: Thu, 27 Jan 2005 20:30:00 +0100
Message-ID: <41F94138.6050207@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

After applying patch-o-matic-ng-20040621 (the last stable released)=20
successfully, compile & install my patched kernel and trying compile=20
iptables-1.2.11, the 'make KERNEL_DIR=3D/usr/src/linux-2.4.29' (obviously, =

my patched kernel is a 2.4.29), I get this error:

Making dependencies: please wait...
Something wrong... deleting dependencies.
make: *** [../ipset/libipt_set.h] Error 1

I think I need the 'ipset' sources, where are them?
where do I need copy them to make iptables (and modules) sucessfully?

Thanks

(sorry for my english)

--=20
    Samuel D=EDaz Garc=EDa
     Director Gerente
ArcosCom Wireless, S.L.L.

mailto:samueldg@arcoscom.com
http://www.arcoscom.com
m=F3vil: 651 93 72 48
tlfn/fax: 956 70 13 15

