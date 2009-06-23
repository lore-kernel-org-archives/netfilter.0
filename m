From: =?UTF-8?B?0KHQsNC80YPRgdC10L3QutC+INCQ0L3QtNGA0LXQuQ==?= 
	<samusenko@msm.ru>
Subject: Re: Trying to add RTP proxy extension
Date: Tue, 23 Jun 2009 16:17:34 +0400
Message-ID: <4A40C7DE.4090309@msm.ru>
References: <145d4e1a0906230403td01d6d8s2541d99ca07e9c6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <145d4e1a0906230403td01d6d8s2541d99ca07e9c6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: javier.galvez@entel.upc.edu
Cc: netfilter@vger.kernel.org

Hi.
=46or ./runme need Makefile in iptables directory. But anyone pom not w=
orking.
Better way to use kernel source.

Why you not use nf_conntrack_sip / nf_nat_sip?
I am not understand why need xt_RTPPROXY.

Javier G=C3=A1lvez Guerrero wrote:
> Hi all,
>
> I'm trying to add the Netfilter RTP proxy extension provided here:
> http://www.2p.cz/en/netfilter_rtp_proxy. As install notes say, it mus=
t
> be done with p-o-m, but I have a problem when running ./runme: the
> iptables source directory is not accepted. I've seen many questions o=
n
> the web regarding this issue but I got no solution at all.
>
> However, AFAIK, p-o-m is 'deprecated' and Xtables-addons should be
> used instead of it. Anyway, I don't know how to 'port' the
> installation from p-o-m to xtables-addons as the files included in th=
e
> RTP proxy extension package seem to be organized for p-o-m.
>
> I'm using Debian Lenny 2.6.18 with iptables 1.4.2 and I'm trying to
> install Netfilter RTP proxy extension 0.4. Can anybody help me to get
> it installed?
>
> BTW, is there any other iptables-based solution to mangle
> SIP/NAT/SDP/RTP sessions issues in multimedia streaming applications
> such as VoIP?
>
>
> Hope you can help me. Thanks a lot for your time.
>
>
> Regards,
> Javi
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  =20
