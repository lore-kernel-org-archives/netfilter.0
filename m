From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ipset kernel panic
Date: Fri, 19 Oct 2012 10:33:57 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1210191028520.5049@blackhole.kfki.hu>
References: <CADuigkXeFM+N89kwzr8pUPKN5A-qccK5-4juYmutYCcq8XHC4g@mail.gmail.com> <alpine.DEB.2.00.1210150927390.4945@blackhole.kfki.hu> <CADuigkW5n0vxVm3eKykw-pV7WH6xe7YP0cAEQcS5EF5BnNaTkw@mail.gmail.com> <CADuigkWtZzuWRavME_YOx5wfn+dtge=iuXF+HhO540J--D8a7A@mail.gmail.com>
 <alpine.DEB.2.00.1210180929340.2232@blackhole.kfki.hu> <CADuigkVCEYuLdMA=Qgtphr81YnPZROyx5p-fy8imoUnPCViU3g@mail.gmail.com> <alpine.DEB.2.00.1210181330540.2232@blackhole.kfki.hu> <CADuigkVxYZHd==J97_g1ABCE=ExVfKRNabAqzuZhNjV0XCcLnQ@mail.gmail.com>
 <CADuigkXm99qcdm-GcaLSQQt0vreK7WxTs4AXv6sZKH+jxe4hDQ@mail.gmail.com> <alpine.DEB.2.00.1210181425120.2232@blackhole.kfki.hu> <CADuigkUPiUJMEooH7xbngxV_COWTDWpz+QnszPp_7AP4Pmopeg@mail.gmail.com> <alpine.DEB.2.00.1210181439560.2232@blackhole.kfki.hu>
 <CADuigkXgXLkoivronrBwuYSQo+faQG9Xx=F8=G33hss7s5Tfgg@mail.gmail.com> <CADuigkU+S9-9SjT6=VFYr93NAdk42Yrw7PyfgSkhgg_hZKakBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="110391812-152756917-1350635637=:5049"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADuigkU+S9-9SjT6=VFYr93NAdk42Yrw7PyfgSkhgg_hZKakBQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Ricardo Klein <klein.rfk@gmail.com>
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110391812-152756917-1350635637=:5049
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 19 Oct 2012, Ricardo Klein wrote:

> I am sorry, dont know what I am doing wrong, follow the steps on README b=
ut,
> still get compile errors...
> Se attached log file.
>=20
> And, I think the problem is this old kernel
> version(2.6.32-279.11.1.el6.x86_64), as the README says, I think I really
> will need to recompile the kernel if want this working:
> 0. You need the source tree of your kernel (version >=3D 2.6.34)
> =A0 =A0and it have to be configured with ip6tables support enabled,
> =A0 =A0modules compiled. For kernel versions < 2.6.39 please apply
> =A0 =A0the netlink.patch against your kernel tree, which adds the
> =A0 =A0new subsystem identifier for ipset.
>=20
> right? Or can I apply in some way apply the patch only to the kernel=20
> source files to compile ipset? (have no experience in kernel modules=20
> compilation)

Sigh, "struct xt_action_param" was introduced in 2.6.35... I have to=20
re-check what'd be needed to support kernels versions between 2.6.39 and=20
2.6.34.
=20
> I'm starting to think that ipset is a great tool, but, not for rhel/CentO=
S
> yet (well, my loved Slackware should work like a charm, but, client whant=
s
> CentOS/RHEL)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
--110391812-152756917-1350635637=:5049--
