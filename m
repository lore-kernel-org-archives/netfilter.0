From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: Distros that can run conntrack-tools/conntrackd with the default kernel
Date: Tue, 27 May 2008 16:15:57 +0300
Message-ID: <20080527131557.GC8042@edu.joroinen.fi>
References: <20080522080456.GE8042@edu.joroinen.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080522080456.GE8042@edu.joroinen.fi>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Thu, May 22, 2008 at 11:04:56AM +0300, Pasi K=E4rkk=E4inen wrote:
> Hello list!
>=20
> What distributions currently are able to run conntrack-tools with the
> default/included kernel? Or even ship with conntrack-tools packaged/i=
ncluded..
>=20
> Based on http://conntrack-tools.netfilter.org/install.html I think at=
 least
> Fedora 9 has the needed options enabled in the default kernel:
>=20
> $ grep CONFIG_NF_CONNTRACK config-2.6.25-14.fc9.i686=20
> CONFIG_NF_CONNTRACK=3Dm
> CONFIG_NF_CONNTRACK_MARK=3Dy
> CONFIG_NF_CONNTRACK_SECMARK=3Dy
> CONFIG_NF_CONNTRACK_EVENTS=3Dy
> CONFIG_NF_CONNTRACK_AMANDA=3Dm
> CONFIG_NF_CONNTRACK_FTP=3Dm
> CONFIG_NF_CONNTRACK_H323=3Dm
> CONFIG_NF_CONNTRACK_IRC=3Dm
> CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dm
> CONFIG_NF_CONNTRACK_PPTP=3Dm
> CONFIG_NF_CONNTRACK_SANE=3Dm
> CONFIG_NF_CONNTRACK_SIP=3Dm
> CONFIG_NF_CONNTRACK_TFTP=3Dm
> CONFIG_NF_CONNTRACK_IPV4=3Dm
> # CONFIG_NF_CONNTRACK_PROC_COMPAT is not set
> CONFIG_NF_CONNTRACK_IPV6=3Dm
>=20
> $ grep CONFIG_NETFILTER_NETLINK config-2.6.25-14.fc9.i686=20
> CONFIG_NETFILTER_NETLINK=3Dm
> CONFIG_NETFILTER_NETLINK_QUEUE=3Dm
> CONFIG_NETFILTER_NETLINK_LOG=3Dm
>=20
> $ grep CONFIG_NF_CT_NETLINK config-2.6.25-14.fc9.i686=20
> CONFIG_NF_CT_NETLINK=3Dm
>=20
> $ grep CONFIG_NF_CONNTRACK_EVENTS config-2.6.25-14.fc9.i686=20
> CONFIG_NF_CONNTRACK_EVENTS=3Dy
>=20

And actually Fedora 9 seems to contain conntrack-tools 0.9.6 rpm out of=
 the box!

-- Pasi
