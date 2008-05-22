From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: Distros that can run conntrack-tools/conntrackd with the default kernel
Date: Thu, 22 May 2008 13:19:47 +0300
Message-ID: <20080522101947.GG8042@edu.joroinen.fi>
References: <20080522080456.GE8042@edu.joroinen.fi> <alpine.LNX.1.10.0805221046190.971@fbirervta.pbzchgretzou.qr> <20080522085430.GF8042@edu.joroinen.fi> <alpine.LNX.1.10.0805221133590.971@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.1.10.0805221133590.971@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Thu, May 22, 2008 at 11:37:40AM +0200, Jan Engelhardt wrote:
>=20
> On Thursday 2008-05-22 10:54, Pasi K=E4rkk=E4inen wrote:
> >On Thu, May 22, 2008 at 10:49:28AM +0200, Jan Engelhardt wrote:
> >>=20
> >> On Thursday 2008-05-22 10:04, Pasi K=E4rkk=E4inen wrote:
> >>=20
> >> >Hello list!
> >> >
> >> >What distributions currently are able to run conntrack-tools with=
 the
> >> >default/included kernel? Or even ship with conntrack-tools packag=
ed/included..
> >>=20

Then there's Ubuntu 8.04 LTS:

$ grep CONFIG_NF_CONNTRACK config-2.6.24-16-generic
CONFIG_NF_CONNTRACK=3Dm
CONFIG_NF_CONNTRACK_AMANDA=3Dm
CONFIG_NF_CONNTRACK_ENABLED=3Dm
CONFIG_NF_CONNTRACK_FTP=3Dm
CONFIG_NF_CONNTRACK_IPV4=3Dm
CONFIG_NF_CONNTRACK_IRC=3Dm
CONFIG_NF_CONNTRACK_MARK=3Dy
CONFIG_NF_CONNTRACK_PPTP=3Dm
CONFIG_NF_CONNTRACK_PROC_COMPAT=3Dy
# CONFIG_NF_CONNTRACK_SANE is not set
CONFIG_NF_CONNTRACK_SECMARK=3Dy
CONFIG_NF_CONNTRACK_TFTP=3Dm
CONFIG_NF_CONNTRACK_EVENTS=3Dy
CONFIG_NF_CONNTRACK_H323=3Dm
CONFIG_NF_CONNTRACK_IPV6=3Dm
CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dm
CONFIG_NF_CONNTRACK_SIP=3Dm

$ grep CONFIG_NETFILTER_NETLINK config-2.6.24-16-generic
CONFIG_NETFILTER_NETLINK=3Dm
CONFIG_NETFILTER_NETLINK_LOG=3Dm
CONFIG_NETFILTER_NETLINK_QUEUE=3Dm

$ grep CONFIG_NF_CT_NETLINK config-2.6.24-16-generic
CONFIG_NF_CT_NETLINK=3Dm

$ grep CONFIG_NF_CONNTRACK_EVENTS config-2.6.24-16-generic
CONFIG_NF_CONNTRACK_EVENTS=3Dy


Which seems to fill the requirements.. so yeah, there is actually one
distribution with long term support that should work with conntrack-too=
ls :)

And it even includes conntrack-tools 0.9.5-0ubuntu1 out of the box!

-- Pasi
