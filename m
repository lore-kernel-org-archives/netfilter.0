From: Angel Motta <angelmotta@gmail.com>
Subject: Re: Rules PREROUTING doesn't work
Date: Fri, 19 Mar 2010 00:11:23 -0500
Message-ID: <1c1b5a0f1003182211u706ea0c4i724c3a4acda06e20@mail.gmail.com>
References: <1c1b5a0f1003162027s73fe4756yefd48b436375b04b@mail.gmail.com>
	 <1c1b5a0f1003170820q4cadb03ah4e3f4580f509c5e0@mail.gmail.com>
	 <56378e321003171325n18f4ca91x358acadc0568643c@mail.gmail.com>
	 <hnrrke$d0$1@dough.gmane.org>
	 <alpine.LSU.2.01.1003180214250.12950@obet.zrqbmnf.qr>
	 <hnsba3$50s$1@dough.gmane.org>
	 <1c1b5a0f1003172253s415bb886j15c5339ba1657876@mail.gmail.com>
	 <4BA20B41.6050903@chello.at>
	 <1c1b5a0f1003180836m59a89362g18190abbce01a672@mail.gmail.com>
	 <1268931387.3763.31.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=97n8IxtUQE3fNRYW90X4uxQOz3uFDXeHPy6wjwsMQA4=;
        b=armvPPaai6jNMVRklh2ocOAnqGR5VfL7QNQptv93eWs8dY5pet3AzBvObsRxZSbIPB
         x1g1Zzy5UcGl7mXW/WXBiQKrqiZg0w9zk44ncC81m6cB21106quAWRePhERwn/lJV5f5
         /QG1pANgGl1LH14ck7QumpOK3XN+hMSa+A8Pg=
In-Reply-To: <1268931387.3763.31.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?0J/QvtC60L7RgtC40LvQtdC90LrQviDQmtC+0YHRgtC40Lo=?= <casper@meteor.dp.ua>
Cc: netfilter@vger.kernel.org

Thanks
Can someone tell me how to reset ip_conntrack_udp_timeout, for get
that my vpn cliente conect to the new VPN server behind the Firewall
through NAT UDP?

How use that?? I dont have contrack command.
"conntrack -F"

O I have to put value 0 to ip_conntrack_udp_timeout, and automatically
the vpn clients will reconnect to the new server VPN behind the
=46irewall

Thanks for your answers
--
Angel

2010/3/18 =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=
=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>:
> =D0=92 =D0=A7=D1=82=D0=B2, 18/03/2010 =D0=B2 10:36 -0500, Angel Motta=
 =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Thanks a lot Mart
>>
>> I found that parameter in Centos5 with:
>> #> cat /proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout
>> 30
>
> If I'm not mistaken this time is in seconds.
>
>> This means that the connections UDP of my vpnclients will keep tryin=
g
>> connect to Firewall until finish this time 30 minutes....despite I
>> have my PREROUTING rule stating redirect that traffic UDP to the
>> server VPN behind the Firewall??
>
> This means that if conntrack already have entry for a specific
> connection it will keep it until there is nothing sent/received for 3=
0
> second withing this connection. Since UDP is connectionless protocol,
> UDP-connection from netfilter point of view are packets with same sou=
rce
> IP/port destination IP/port pairs withing a period of time (30sec).
>
> Since nat table sees only packets starting new connection, it will no=
t
> get ones belonging to a connection which is still in conntrack.
>
> If your VPN-client are always re-trying to connect with interval less
> that ip_conntrack_udp_timeout, conntrack entry corresponding to such
> connections will never disappear by itself.
>
> You can simply do "conntrack -F" if you don't care about rest
> connections in conntrack. Or remove each manually, or drop such
> connection attempts for the time needed for them to be removed from
> conntrack.
>
>> This is the cause of the problem??
>>
>> Thanks, I hope your comments to schedule this work at night with my =
firewall
>> I hope to fix this soon as possible
>>
>> Thanks List for your assistance
>> --
>> Angel
>>
>> 2010/3/18 Mart Frauenlob <mart.frauenlob@chello.at>:
>> > On 18.03.2010 06:59, angelmotta@gmail.com wrote:
>> >
>> >> One question, I donde have that file
>> >> /proc/sys/net/netfilter/nf_conntrack_udp_timeout*
>> >> I don't have netfilter directory, where is that ??
>> >>
>> >
>> > on older systems it used to be in:
>> > /proc/sys/net/ipv4/
>> >
>> > and maybe also was named with the ip_* prefix, not with nf_*.
>> >
>> > to look for it yourself, you could have done something like:
>> > find /proc/sys/ -name netfilter -type d
>> > or
>> > find /proc/sys/ -name '*conntrack*'
>> > ...
>> >
>> > Best regards
>> >
>> > Mart
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe netfilte=
r" in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info=
=2Ehtml
>> >
>>
>>
>>
> --
> =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=
=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>
>
>



--=20
Atte
Angel Motta Paz
