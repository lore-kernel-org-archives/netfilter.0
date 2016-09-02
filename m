From: zrm <zrm@trustiosity.com>
Subject: Re: nf_conntrack_max
Date: Fri, 2 Sep 2016 10:47:37 -0400
Message-ID: <0b741f9e-b78e-100a-1db6-fc9755d436d4@trustiosity.com>
References: <000e01d203d5$3e576d00$bb064700$@bluemarble.net>
 <7fcee9a08e254004b9a4517bf46a29a0@CCDEX021.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1472827613; bh=R3czjseycdNIb8mhfY5fx3q+LhUbdx+/GluK4svDnT8=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=dlw31Og+8DxO4gWKuTI9qfxSt9MPUTu1wTzeNNqnhWwFjST+qbAo3/JF/O7yuHzKq
         FxfIXfA6ymNdu0o8tQkKzDSVQ8jXscWT24rUrpg4BtwzwqNzfxsIAl9Zz10LiX7Xrj
         SbBOODD4oYiUiesy/098G3FRGjpJ3sH7C6YdEDjU=
In-Reply-To: <7fcee9a08e254004b9a4517bf46a29a0@CCDEX021.corp.corpcommon.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?Q?Andr=c3=a9_Paulsberg-Csibi_=28IBM_Consultant=29?= <Andre.Paulsberg-Csibi@evry.com>, John Ratliff <jratliff@bluemarble.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



On 09/02/2016 02:27 AM, Andr=E9 Paulsberg-Csibi (IBM Consultant) wrote:

> In the meantime there is no real issues increasing you the connection tab=
le while you figure that out ,
> and you can also GLOBALY fix the UDP timeouts if you so desire as most li=
kely this can be lowered significantly from
> the defaults , here you can see one example from a smaller FW then yours =
( but still applicable ) :
>
> zotac:~ # grep netfilter /etc/sysctl.conf
> net.netfilter.nf_conntrack_max =3D 10000
> net.netfilter.nf_conntrack_tcp_timeout_established =3D 3600
> net.netfilter.nf_conntrack_tcp_timeout_close_wait =3D 40
> net.netfilter.nf_conntrack_tcp_timeout_fin_wait =3D 40
> net.netfilter.nf_conntrack_tcp_timeout_syn_recv =3D 40
> net.netfilter.nf_conntrack_tcp_timeout_syn_sent =3D 40
> net.netfilter.nf_conntrack_tcp_timeout_time_wait =3D 40
> net.netfilter.nf_conntrack_udp_timeout_stream =3D 60
> net.netfilter.nf_conntrack_udp_timeout =3D 10

Global timeouts that short can cause other trouble though. See RFC4787=20
Section 4.3 and RFC5382 Section 5. Outside of reducing the timeout only=20
for DNS, the best choice is probably just increasing the maximum number=20
of conntrack entries (and buying more memory if necessary).
