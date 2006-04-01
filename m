From: =?ISO-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Re: iptables: Unknown error 4294967295
Date: Sat, 01 Apr 2006 08:21:07 +0200
Message-ID: <442E1BD3.8030700@arcoscom.com>
References: <442CAEC6.2040808@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <442CAEC6.2040808@arcoscom.com>
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

Any idea at least?

Samuel D=EDaz Garc=EDa escribi=F3:
> With:
>    iptables 1.3.5
>    linux 2.6.16.1 and 2.6.16-git8
>    today's pom-ng
>=20
> I'm having problems with some matches:
>    connlimit
>    ipp2p 0.8.1_rc1
>=20
> When compiling, I can see many "signed//unsigned comparision warnings"=20
> (don't remember exactly the warning).
>=20
> In dmesg I see things as:
>=20
> Mar 31 05:18:04 fraile kernel: [17180340.932000] ip_tables: connlimit=20
> match: invalid size 0 !=3D 16
> Mar 31 05:54:00 fraile kernel: [17182487.628000] ip_tables: ipp2p match: =

> invalid size 0 !=3D 8
> Mar 31 05:54:00 fraile kernel: [17182487.668000] ip_tables: layer7=20
> match: invalid size 0 !=3D 8452
>=20
> Any help/patch/suggestion?
>=20
> Thanks
>=20

--=20
    Samuel D=EDaz Garc=EDa

