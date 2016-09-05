From: zrm <zrm@trustiosity.com>
Subject: Re: nf_conntrack_max
Date: Mon, 5 Sep 2016 12:21:56 -0400
Message-ID: <8510b15b-c4db-e9a5-eebb-90c9fff6e59f@trustiosity.com>
References: <000e01d203d5$3e576d00$bb064700$@bluemarble.net>
 <7fcee9a08e254004b9a4517bf46a29a0@CCDEX021.corp.corpcommon.com>
 <0b741f9e-b78e-100a-1db6-fc9755d436d4@trustiosity.com>
 <818666f75b724e62b6427878c4ba59c5@CCDEX021.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1473092468; bh=/KUIZQxYKi6svMxABr+DAyPJICn5NcPgAwF6jhO4yv0=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=7t+ohvjI7iD4KBjipKPCRX+FwkqdYk1bV9LxNtZGR7TMx3YFqhiMF7rmsLYNBk4b2
         YeEHlRrYGSozAXc2yhkI0SYZ4DABQbVkOTghbajgrbZhvWk1xrnrbClE7JTjmmmbT9
         6vNv0qlmE0otnMrflSdcSVGXPr/IBzqGeBTg2KUM=
In-Reply-To: <818666f75b724e62b6427878c4ba59c5@CCDEX021.corp.corpcommon.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?Q?Andr=c3=a9_Paulsberg-Csibi_=28IBM_Consultant=29?= <Andre.Paulsberg-Csibi@evry.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

The default conntrack timeout for UDP streams is 180 seconds, which is=20
within that range. The protocols that need that are streams rather than=20
transactional protocols like DNS. (Although the other suggestion to=20
remove DNS immediately on reply would even cause trouble for DNS,=20
because some clients send multiple DNS queries at the same time using=20
the same ports, e.g. IPv6 (AAAA) and IPv4 (A) queries, and immediate=20
removal would cause the other replies to be lost. One second timeouts=20
could do the same.)

The main problem with very short global UDP stream timeouts is for IPsec=20
tunnel mode, OpenVPN, or anything else that encapsulates traffic in UDP=20
or otherwise needs the UDP entry to continue to exist indefinitely. If=20
the app's keepalive interval is shorter than the timeout then packets=20
that arrive between the timeout and the keepalive packet go to the bit=20
bucket.

Some applications will try to detect that and then shorten the keepalive=20
interval (but not all, and generally only after several packets are lost=20
with user-visible consequences). And even then the result is more=20
deadweight keepalive packets consuming network resources and requiring=20
power-expensive radio wakeups on battery-powered user devices.

On 09/05/2016 04:40 AM, Andr=E9 Paulsberg-Csibi (IBM Consultant) wrote:
> I have yet to see any implementation of any FW in 2014 - 2016 that has UD=
P timeouts in the 2-5 minutes range , as described in RFC 4787 .
>
> IF I remember UDP implementations from a lot of todays firewalls is typic=
ally set default timeout to about 30-40 seconds ,
> and despite RFC4787 I would rather recommend having lower timeouts for UD=
P and higher ones for just those
> protocols that require this than to have 2-5 minutes for UDP which in mos=
t cases never last more then 2-4 seconds .
>
> That seems like an unreasonable reverse logic and use of resources , look=
ing at today vs 10-20 years ago's most common UDP traffic patterns .
>
> But yes , I agree on increasing connection table in either case as this w=
as clearly low for such current level of sessions
> and find the root cause for the high amounts of sessions and fix that if =
possible ...
>
>
>
> Best regards
> Andr=E9 Paulsberg-Csibi
> Senior Network Engineer
> Fault Handling
> IBM Services AS
> andre.paulsberg-csibi@evry.com
> M +47 9070 5988
>
>
>
>
> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel=
.org] On Behalf Of zrm
> Sent: 2. september 2016 16:48
> To: Andr=E9 Paulsberg-Csibi (IBM Consultant) <Andre.Paulsberg-Csibi@evry.=
com>; John Ratliff <jratliff@bluemarble.net>; netfilter@vger.kernel.org
> Subject: Re: nf_conntrack_max
>
>
>
> On 09/02/2016 02:27 AM, Andr=E9 Paulsberg-Csibi (IBM Consultant) wrote:
>
>> In the meantime there is no real issues increasing you the connection ta=
ble while you figure that out ,
>> and you can also GLOBALY fix the UDP timeouts if you so desire as most l=
ikely this can be lowered significantly from
>> the defaults , here you can see one example from a smaller FW then yours=
 ( but still applicable ) :
>>
>> zotac:~ # grep netfilter /etc/sysctl.conf
>> net.netfilter.nf_conntrack_max =3D 10000
>> net.netfilter.nf_conntrack_tcp_timeout_established =3D 3600
>> net.netfilter.nf_conntrack_tcp_timeout_close_wait =3D 40
>> net.netfilter.nf_conntrack_tcp_timeout_fin_wait =3D 40
>> net.netfilter.nf_conntrack_tcp_timeout_syn_recv =3D 40
>> net.netfilter.nf_conntrack_tcp_timeout_syn_sent =3D 40
>> net.netfilter.nf_conntrack_tcp_timeout_time_wait =3D 40
>> net.netfilter.nf_conntrack_udp_timeout_stream =3D 60
>> net.netfilter.nf_conntrack_udp_timeout =3D 10
>
> Global timeouts that short can cause other trouble though. See RFC4787
> Section 4.3 and RFC5382 Section 5. Outside of reducing the timeout only
> for DNS, the best choice is probably just increasing the maximum number
> of conntrack entries (and buying more memory if necessary).
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
