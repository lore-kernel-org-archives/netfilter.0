From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: iptables returns "module is wrong version"
Date: 26 Jan 2005 20:57:53 +0100
Message-ID: <1106769471.25216.1.camel@nostromo.bgsecm.com>
References: <r02010100-1037-1EB3505C6FC311D998C6000A95DF6F1E@[192.168.1.112]>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <r02010100-1037-1EB3505C6FC311D998C6000A95DF6F1E@[192.168.1.112]>
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
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El mi=C3=A9, 26 de 01 de 2005 a las 18:53, Kurt Yoder escribi=C3=B3:
> Hi list
>=20
> I'm getting an error when running iptables:
>=20
> root@ns2:~# iptables -L -v
> iptables v1.2.11: can't initialize iptables table `filter': Module is
> wrong version
> Perhaps iptables or your kernel needs to be upgraded.
>=20
>=20
> and yet, iptables module seems to be loaded fine:
>=20
> root@ns2:~# lsmod
> Module                  Size  Used by
> iptable_filter          3840  0=20
> ip_tables              19712  1 iptable_filter
> ipv6                  283624  33=20
> isofs                  38052  0=20
> af_packet              25676  2=20
> eepro100               32396  0=20
> hw_random               6368  0=20
> amd74xx                15280  0=20
> evdev                  11456  0=20
> ohci_hcd               22212  0=20
> tg3                    70880  0=20
> firmware_class         11840  1 tg3
> e100                   35264  0=20
> mii                     6464  2 eepro100,e100
> capability              6216  0=20
> commoncap               9280  1 capability
> ide_cd                 42848  0=20
> ide_core              157248  2 amd74xx,ide_cd
> cdrom                  39784  1 ide_cd
> rtc                    14928  0=20
> ext3                  122640  1=20
> jbd                    65072  1 ext3
> mbcache                11016  1 ext3
> sd_mod                 22016  3=20
> 3w_xxxx                41380  2=20
> scsi_mod              132544  2 sd_mod,3w_xxxx
> unix                   31968  193=20
> font                    9600  0=20
> vesafb                  7408  0=20
> cfbcopyarea             4608  1 vesafb
> cfbimgblt               3776  1 vesafb
> cfbfillrect             4800  1 vesafb
>=20
>=20
> I'm running kernel 2.6.8 and iptables 1.2.11. I'm using Debian packages
> for the kernel and iptables. Anyone encountered this before and been
> able to get around it?
> --
>=20
> Kurt Yoder
> The Richard Group
> tel: 703-525-7156

You probably don't have your kernel modules and iptables synced.
They both have to be compiled with the same patches of
patch-o-matic or it won't work.

Regards.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


