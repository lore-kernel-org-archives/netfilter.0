From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: netfilter kernel crash in ip_ct_refresh_acct / ip_conntrack with centos 5.x
Date: Mon, 22 Sep 2008 13:50:29 +0300
Message-ID: <20080922105029.GG13941@edu.joroinen.fi>
References: <20080915081156.GK13941@edu.joroinen.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080915081156.GK13941@edu.joroinen.fi>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Mon, Sep 15, 2008 at 11:11:56AM +0300, Pasi K=E4rkk=E4inen wrote:
> Hello list!
>=20
> Has anyone seen this netfilter kernel crash?=20
>=20
> Images from the console of the crashed firewall:
> http://pasik.reaktio.net/centos5-kernel-crash/
>=20
> Firewall is HP DL360 G4 server running CentOS 5.x 32 bit.=20
>=20
> I've seen this firewall crashing multiple times, but I only started i=
nvestigating it lately..
>=20
> It has happened using CentOS 5.0, 5.1 and now also with 5.2. I'm not =
sure if
> it was the same bug earlier, but at least the last two times (with Ce=
ntOS 5.2)=20
> it has been the same, see screenshots.
>=20
> Last lines of the console output:
>=20
> EIP: [<f8af2c5c>] __ip_ct_refresh_acct+0xa1/0x129 [ip_conntrack] SS:E=
SP 0068:c0724e4c
>  <0>Kernel panic - not syncing: Fatal exception in interrupt
>=20
> At the moment firewall is running CentOS 5.2, Linux kernel 2.6.18-92.=
1.10.el5.centos.plus.
>=20
> Any tips how to resolve this?=20
>=20

http://lists.centos.org/pipermail/centos/2008-September/064929.html

https://bugzilla.redhat.com/show_bug.cgi?id=3D433661

So it's a known bug, fix/patch is included in RHEL 5.3 beta/test kernel=
s..
and hopefully in the final RHEL 5.3 kernel build, whenever that will be
available.

-- Pasi
