From: =?iso-8859-1?Q?Andr=E9_Paulsberg-Csibi_=28IBM_Consultant=29?= 
        <Andre.Paulsberg-Csibi@evry.com>
Subject: RE: nf_conntrack_max
Date: Mon, 5 Sep 2016 08:40:59 +0000
Message-ID: <818666f75b724e62b6427878c4ba59c5@CCDEX021.corp.corpcommon.com>
References: <000e01d203d5$3e576d00$bb064700$@bluemarble.net>
 <7fcee9a08e254004b9a4517bf46a29a0@CCDEX021.corp.corpcommon.com>
 <0b741f9e-b78e-100a-1db6-fc9755d436d4@trustiosity.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0b741f9e-b78e-100a-1db6-fc9755d436d4@trustiosity.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: zrm <zrm@trustiosity.com>

I have yet to see any implementation of any FW in 2014 - 2016 that has UDP =
timeouts in the 2-5 minutes range , as described in RFC 4787 .

IF I remember UDP implementations from a lot of todays firewalls is typical=
ly set default timeout to about 30-40 seconds ,
and despite RFC4787 I would rather recommend having lower timeouts for UDP =
and higher ones for just those
protocols that require this than to have 2-5 minutes for UDP which in most =
cases never last more then 2-4 seconds .

That seems like an unreasonable reverse logic and use of resources , lookin=
g at today vs 10-20 years ago's most common UDP traffic patterns .

But yes , I agree on increasing connection table in either case as this was=
 clearly low for such current level of sessions
and find the root cause for the high amounts of sessions and fix that if po=
ssible ...



Best regards
Andr=E9 Paulsberg-Csibi
Senior Network Engineer=20
Fault Handling
IBM Services AS
andre.paulsberg-csibi@evry.com
M +47 9070 5988




-----Original Message-----
From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.o=
rg] On Behalf Of zrm
Sent: 2. september 2016 16:48
To: Andr=E9 Paulsberg-Csibi (IBM Consultant) <Andre.Paulsberg-Csibi@evry.co=
m>; John Ratliff <jratliff@bluemarble.net>; netfilter@vger.kernel.org
Subject: Re: nf_conntrack_max



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
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
