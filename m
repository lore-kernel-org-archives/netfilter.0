From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: is this the zillionth mail asking for this detail?
Date: Thu, 21 Jul 2005 10:09:05 -0400
Message-ID: <65aa6af905072107096e1d6d06@mail.gmail.com>
References: <65aa6af905072021501603cfd5@mail.gmail.com>
	<42DF85AE.1000400@gmx.co.uk>
	<Pine.LNX.4.58.0507211511240.27131@blackhole.kfki.hu>
	<Pine.LNX.4.61.0507211521120.17188@yvahk01.tjqt.qr>
	<Pine.LNX.4.58.0507211523100.27131@blackhole.kfki.hu>
	<42DFA8D1.207@mnemon.de>
	<Pine.LNX.4.58.0507211557070.27131@blackhole.kfki.hu>
Reply-To: Edmundo Carmona <eantoranz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0507211557070.27131@blackhole.kfki.hu>
Content-Disposition: inline
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

>=20
> But for the record: for locally generated packets the routing engine is
> called after OUTPUT only if source address, destination address, nfmark
> field or tos of the skbuff changed. So it's not called blindly for every
> packet.
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
Good to know!

