From: =?ISO-8859-2?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: [SOLVED] krn 2.4.30, iptables 1.3.1,
 last pom and condition extension problem
Date: Thu, 21 Apr 2005 12:15:49 +0200
Message-ID: <42677D55.5020003@arcoscom.com>
References: <4263FD5D.4050205@arcoscom.com> <4266407B.7060909@arcoscom.com>
	<Pine.LNX.4.58.0504201403180.24434@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020608000400050601090709"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0504201403180.24434@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------020608000400050601090709
Content-Type: text/plain; charset="iso-8859-2"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Yes, when the "ipt_condition" module is loaded it creates the directory
and the files with "0" into them.

We don't need to manually create the "ipt_condition" directory or the
files (we can't write into /proc, I think).

If we need to add more condition files, only need to add the iptables
rule and then "rmmod ipt_condition" and then iptables will load by
itself the "ipt_condition" module when it was needed.

If you dont see the "ipt_condition" module with "lsmod | grep condition"
command, you will need to run "modprobe ipt_condition" by hand.

Best regards and thanks to all for your help.



Jozsef Kadlecsik wrote:

> On Wed, 20 Apr 2005, [ISO-8859-15] Samuel D=EDaz Garc=EDa wrote:
>=20
>=20
>>>I had trying to use -m condition iptables extension module, but when I
>>>see /proc/net I cant see ipt_condition directory and I can't make it.
>>>
>>>How can I make the /proc/net/ipt_condition directory?
>=20
>=20
> modprobe ipt_condition
>=20
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
>=20
>=20
>=20

--=20
    Samuel D=EDaz Garc=EDa
     Director Gerente
ArcosCom Wireless, S.L.L.

mailto:samueldg@arcoscom.com
http://www.arcoscom.com

M=F3vil: 651 93 72 48
Tlfn.: 956 70 13 15
Fax:   956 70 34 83

--------------020608000400050601090709--

