From: Eric Leblond <eric@regit.org>
Subject: Re: ulogd - ip_conntrack_netlink - how to get it working one
Date: Sat, 28 Jul 2012 19:42:19 +0200
Message-ID: <1343497339.7072.2.camel@tiger.regit.org>
References: <CAAJpzgb2ZEoRayuzvUVevvRvJ=oXA6=heQa98fKD_63QXVe4xg@mail.gmail.com>
	 <CAAJpzgbutOBLB1t9vXYeXSPS=wwxeeSanTYJo+qNkjTfQr2rVw@mail.gmail.com>
	 <CAAJpzga_Bga+2=hG_PpZcs9OSrpGed+gue-j=TLrg4bL9cPPNA@mail.gmail.com>
	 <CAAJpzgaMLex=6QEd4YKik-XnAvGcOXTN7Zovo54ZfO-N=P9aDQ@mail.gmail.com>
	 <CAAJpzgabwrGetLiKrJco_=ZByN0Z8KEdQ32A1Vw_ee6Hn4DPsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-CiuWDvtTPtXUZ7jKWWZv"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAAJpzgabwrGetLiKrJco_=ZByN0Z8KEdQ32A1Vw_ee6Hn4DPsw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>
Cc: netfilter@vger.kernel.org


--=-CiuWDvtTPtXUZ7jKWWZv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le samedi 28 juillet 2012 =C3=A0 01:17 -0700, Gomathivinayagam Muthuvinayag=
am
a =C3=A9crit :
> Can someone respond to this? Your help would be much appreciated.

Only 5 hours between the question and this mail. If you want a support
with SLR I can recommend you some companies that will be really happy to
sell it to you.

BR,

> Thanks & Regards,
>=20
>=20
>=20
>=20
> On Fri, Jul 27, 2012 at 8:43 PM, Gomathivinayagam Muthuvinayagam
> <sankarmail@gmail.com> wrote:
> > For the flow based logging (NFCT plugin), without iptable rules ulogd
> > works perfectly. Basically ulogd NFCT plugin directly communicates
> > with conntrack system through nf_conntrack_netlink. This thing I have
> > tested in my ubuntu system and works fine. Only problem is with RHEL5
> > system, because there is nf_conntrack_netlink module.
> >
> > -----Original Message-----
> > From: netfilter-owner@vger.kernel.org
> > [mailto:netfilter-owner@vger.kernel.org] On Behalf Of kay
> > Sent: Friday, July 27, 2012 8:39 PM
> > To: netfilter@vger.kernel.org
> > Subject: Re: ulogd - ip_conntrack_netlink - how to get it working one
> >
> > Could you please provide your iptables rules with ULOG action?
> >
> > 2012/7/28 Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>:
> >> Thank you for your reply.
> >>
> >> Let me print the ulogd configurations here, so that I can describe my
> >> problem better.
> >>
> >> # this is a stack for flow-based logging via LOGEMU
> >> stack=3Dct1:NFCT,ip2str1:IP2STR,print1:PRINTFLOW,emu1:LOGEMU
> >>
> >> [ct1]
> >> netlink_socket_buffer_size=3D217088
> >> netlink_socket_buffer_maxsize=3D1085440
> >> #netlink_resync_timeout=3D60 # seconds to wait to perform
> >> resynchronization
> >> pollinterval=3D5 # use poll-based logging instead of event-driven
> >> hash_enable=3D1
> >>
> >> ulogd is running without any error messages. But, ulogd_syslogemu.log
> >> has no contents. conntrack -E displays the flow perfectly.
> >>
> >> I tried to find out the cause of no content in the ulogd_syslogemu.log
> >> in the log file. ulogd requires nf_conntrack_netlink subsystem/module.
> >> In my linux version (RHEL 5), I dont have that. Instead of that I have
> >> ip_conntrack_netlink module.
> >>
> >> 1) Is there any way that I can make ulogd to talk to
> >> ip_conntrack_netlink, and whether ip_conntrack_netlink is equivalent
> >> of nf_conntrack_netlink?
> >>
> >> 2) If (1) is not possible, can I able to include just the
> >> nf_conntrack_netlink in RHEL5 without changing any existing
> >> functionality? nf_conntrack_netlink and ip_conntrack_netlink can work
> >> well simultaneously?
> >>
> >> 3) If (2) is not possible, what would be your advice on this? RHEL5 +
> >> ip_conntrack_netlink is used in many servers(may be more than 1000
> >> servers) in my organization. Considering this, any change would cause
> >> potential testing. So a simple solution would be easily accepted in my
> >> organization.
> >>
> >>
> >> -----Original Message-----
> >> From: netfilter-owner@vger.kernel.org
> >> [mailto:netfilter-owner@vger.kernel.org] On Behalf Of kay
> >> Sent: Friday, July 27, 2012 8:12 PM
> >> To: netfilter@vger.kernel.org
> >> Subject: Re: ulogd - ip_conntrack_netlink - how to get it working one
> >>
> >> Dear Gomathivinayagam,
> >>
> >> What exactly you would like to achieve and what you already achieved?
> >>
> >> What did you mean saying "capture flow based logging"?
> >>
> >> For example here is my ulog data:
> >>
> >> Jul 28 01:03:15 esagila DROP packet:  IN=3Deth0 OUT=3D MAC=3D***  SRC=
=3D***
> >> DST=3D*** LEN=3D52 TOS=3D00 PREC=3D0x00 TTL=3D55 ID=3D37188 CE DF PROT=
O=3DTCP
> >> SPT=3D51183 DPT=3D22 SEQ=3D2563245107 ACK=3D138246617 WINDOW=3D61 ACK =
URGP=3D0
> >>
> >> Do you need something more with the packet data or what?
> >>
> >> 2012/7/28 Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>:
> >>> I don=E2=80=99t know whether I=E2=80=99m asking stupid questions, but=
 if someone
> >>> could respond for this post, that will be great.
> >>>
> >>> Thanks & Regards,
> >>>
> >>>
> >>>
> >>>
> >>> On Fri, Jul 27, 2012 at 7:26 PM, Gomathivinayagam Muthuvinayagam
> >>> <sankarmail@gmail.com> wrote:
> >>>> Hi,
> >>>>
> >>>> I have a RHEL 5 os in my system. I have setup ulogd in my local
> >>>> system. I=E2=80=99m able to do packet capturing.
> >>>> I=E2=80=99m not able to capture flow based logging. What I have foun=
d was,
> >>>> in my system I don=E2=80=99t have nf_conntrack_netlink.
> >>>> Instead I have ip_conntrack_netlink. Is that possible I can
> >>>> incorporate nf_conntrack_netlink into RHEL5? And make ulogd to be
> >>>> working one.
> >>>>
> >>>> Your help would be much appreciated.
> >>>>
> >>>> Thanks,
> >>>>
> >>>>
> >>>> Thanks & Regards,
> >>> --
> >>> To unsubscribe from this list: send the line "unsubscribe netfilter"
> >>> in the body of a message to majordomo@vger.kernel.org More majordomo
> >>> info at  http://vger.kernel.org/majordomo-info.html
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe netfilter"
> >> in the body of a message to majordomo@vger.kernel.org More majordomo
> >> info at  http://vger.kernel.org/majordomo-info.html
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe netfilter"
> >> in the body of a message to majordomo@vger.kernel.org More majordomo
> >> info at  http://vger.kernel.org/majordomo-info.html
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter"
> > in the body of a message to majordomo@vger.kernel.org More majordomo
> > info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Eric Leblond=20
Blog: http://home.regit.org/ - Portfolio: http://regit.500px.com/

--=-CiuWDvtTPtXUZ7jKWWZv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAlAUJHsACgkQnxA7CdMWjzKXQgCdF3Fat+UgkbyL4lgW7c7Pfxr5
oyQAoI4LtzYLEOMMpwhb0L0QmMK82BQj
=oMrL
-----END PGP SIGNATURE-----

--=-CiuWDvtTPtXUZ7jKWWZv--

