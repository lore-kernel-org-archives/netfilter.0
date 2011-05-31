From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: SIP 5060 traffic
Date: Tue, 31 May 2011 11:55:39 -0300
Message-ID: <BANLkTi=6RBq747j0eCq_kG-Dr+jgzfjPLg@mail.gmail.com>
References: <20110531090945.M97668@kdtc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110531090945.M97668@kdtc.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cc <cc@kdtc.net>
Cc: netfilter@vger.kernel.org

I think you have talk with other side ( support at the SIP Server
issue ). you can ask about the packages arriving on SIP server.

you can look in log too to more details about packages drops.


as it's UDP connection try:

$IPT -A FORWARD -i $INET_ETH -p udp --sport 5060 -j ACCEPT



good luck










2011/5/31 cc <cc@kdtc.net>:
> Hi,
>
> I have a LAN NET =A0and a DMZ NET. =A0I have a SIP phone within the L=
AN
> trying to connect to a proxy at an external site, say A.
>
> Can someone point out if I'm missing anything?
>
> Rules:
>
> $IPT -A FORWARD -o $INET_ETH -p udp --dport 5060 -j ACCEPT
> $IPT -t nat -A POSTROUTING -o $INET_ETH -p udp --dport 5060 \
> =A0 =A0 =A0 =A0 =A0 =A0 -j SNAT --to-source $INET_IP
>
> When I do a tcpdump, I can see traffic from the LAN go through my
> bastion Firewall that routes to my external-facing firewall.
> But there is no traffic coming back from the outside.
>
> 17:05:19.831000 IP (tos 0x0, ttl 127, id 1595, offset 0, flags [none]=
, proto:
> UDP (17), length: 367) LAN_IP.5060 > A_SITE.5060: SIP, length: 339
>
> There's no corresponding entry that has traffic going the other way:
> i.e.:
>
> IP (tos 0x0, ttl 127, id 1595, offset 0, flags [none], proto: UDP (17=
),
> length: 367) A_SITE.5060 > LAN_IP.5060: SIP, length: 339
>
> I'm a bit confused. =A0Any clarifications appreciated.
>
> Thanks
>
> Ed
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
