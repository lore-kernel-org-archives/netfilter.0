From: "zze-Proxy_Corveller ball001 exterieur FTRD" <proxycorveller.ball001@rd.francetelecom.com>
Subject: RE: Problem of NAT with VLAN
Date: Thu, 10 Apr 2003 10:58:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <8C19E3FBB6467846AFF97E366D34CB600189A4AD@lanmhs20.rd.francetelecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Yes, indeed it's my commands

> -----Message d'origine-----
> De : Friedrich Lobenstock [mailto:fl@fl.priv.at]
> Envoye : mercredi 9 avril 2003 18:20
> A : netfilter-devel@lists.netfilter.org
> Objet : Re: Problem of NAT with VLAN
>=20
>=20
> zze-Proxy_Corveller ball001 exterieur FTRD wrote:
> >=20
> > I've got n VLANs that arrive on a Linux machine. I'm using=20
> vconfig to
> > receive packets from those VLANs.
> >=20
> > I want to perform DNAT on packets between my physical=20
> interface (eth2)=20
> > and the virtuals devices
> > created by vconfig (vlan00xx, where xx is the VLAN ID of=20
> the associated=20
> > VLAN).
> > I've place some rules at the PREROUTING chain in the nat table to=20
> > perform the address
> > translation.
> >=20
> > My problem is that netfilter seems don't see packets=20
> between eth2 and=20
> > vlan00xx.
> >=20
> > I've tried some rules such as '-A PREROUTING -i eth2' or=20
> '-A PREROUTING=20
> > -i vlan0010' but
> > the packet counters stay equal to 0.
> >=20
> > Any idea ?
> >=20
>=20
> Just curious, did you run:
>    vconfig set_name_type VLAN_PLUS_VID
>    vconfig add eth2 10
>=20
> --=20
> MfG / Regards
> Friedrich Lobenstock
>=20
>=20
>=20

