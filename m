From: =?UTF-8?B?WXVjb25nIFN1biAo5Y+26Zuo6aOeKQ==?= <sunyucong@gmail.com>
Subject: Re: Advice for nf_conntrack: table full: increase netfilter.ip_conntrack
 or descrease timeouts?
Date: Thu, 14 Jun 2012 18:30:52 -0700
Message-ID: <CAJygYd0Y_HFF97-05C3KF97==vNaEo3Mv7wf4=JD1g9+DtXzZA@mail.gmail.com>
References: <20120614185226.uq30mm4474wkskks@correo.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=7EDDfHvDHkma96HOFrhBbXYYde0fG1tnX3XeyMsCwsU=;
        b=xkCTyA9N6hgLffxv3xaAN1QbXvEA+O2apxSNzoKHcLrwNSpXSlLC4Jc3Wjt4SF1Cyk
         Rxra7pihmUYrJsGV7K6pUz1IilHlXMubxlYgxHqJdm9hcSslAeX1bph3AryJsNrfxchN
         hCz0dwGCMlDg42fKfjrOCWSV76xqjM9xi3mYZjm6QdkYhbTjt/Q+tVUzxWHMnCB4GUua
         l9Vy7Laa5/eNdRC1H3FYcXH86LQipNV0IHwVSumancxBZbVOW9k/ejt/b8/agER3W8ne
         gxXutoI8niWuj1yuvcaAP1wOrURqunAikbcDIzCayQvfihkJH+9YIqlM/rt212GtG7K2
         ctpA==
In-Reply-To: <20120614185226.uq30mm4474wkskks@correo.co.cr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?Sm9zw6kgUGFibG8gUMOpcmV6?= <josepablo@correo.co.cr>
Cc: netfilter@vger.kernel.org

Are you sure nf_conntrack_max is the problem? do you see "hashtable
full drop connection" on dmesg?

as a general advise , run conntrack -L (or cat /proc/xxx session
table) when problem happens and analyse where the session comes from
first.

Cheers.

On Thu, Jun 14, 2012 at 5:52 PM, Jos=C3=A9 Pablo P=C3=A9rez
<josepablo@correo.co.cr> wrote:
> Hello again guys...
>
> I have a webserver who should be able to handle 10,000 established
> requests, right now its been tested with 1000 but it fails because of
> to many connections on TIME_WAIT
>
> I have been reading prior to posting and it seems I have two options:
>
> Increse these two:
> sysctl -a | grep conntrack | grep net.nf_conntrack_max
> net.nf_conntrack_max =3D 31772
>
> sysctl -w net.netfilter.nf_conntrack_max=3D131072
> echo 32768 > /sys/module/nf_conntrack/parameters/hashsize
>
> Or decrease the timeouts.. which right now I have...
>
> Right now I have:
>
> sysctl -a | grep conntrack | grep timeout
> net.netfilter.nf_conntrack_generic_timeout =3D 600
> net.netfilter.nf_conntrack_tcp_timeout_syn_sent =3D 120
> net.netfilter.nf_conntrack_tcp_timeout_syn_recv =3D 60
> net.netfilter.nf_conntrack_tcp_timeout_established =3D 432000
> net.netfilter.nf_conntrack_tcp_timeout_fin_wait =3D 120
> net.netfilter.nf_conntrack_tcp_timeout_close_wait =3D 60
> net.netfilter.nf_conntrack_tcp_timeout_last_ack =3D 30
> net.netfilter.nf_conntrack_tcp_timeout_time_wait =3D 120
> net.netfilter.nf_conntrack_tcp_timeout_close =3D 10
> net.netfilter.nf_conntrack_tcp_timeout_max_retrans =3D 300
> net.netfilter.nf_conntrack_tcp_timeout_unacknowledged =3D 300
> net.netfilter.nf_conntrack_udp_timeout =3D 30
> net.netfilter.nf_conntrack_udp_timeout_stream =3D 180
> net.netfilter.nf_conntrack_icmp_timeout =3D 30
> net.netfilter.nf_conntrack_events_retry_timeout =3D 15
>
>
>
> Iam more keen to the second because high
> net.ipv4.netfilter.ip_conntrack_max according to what I read can lead
> to system freeze.... so can anybody offer me a reference to tune and
> lower these paratemers? I tried lowering the
> net.ipv4.netfilter.ip_conntrack_tcp_timeout_time_wait =C2=A0to 5 ... =
but
> that didnt change anything much.
>
> Thanks..!
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
