From: Alberto <alberto@bersol.info>
Subject: Redirect traffic to openvpn (client)
Date: Tue, 29 Sep 2020 19:44:00 +0200
Message-ID: <f74104f1-efa5-8f7d-0f72-cd14060ddb4f@bersol.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bersol.info; s=dkim;
        t=1601401440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
        bh=9KrdJjH+SRiegKXhd5s/jvAyjd5k7ZeWla/ZfVc0+cc=;
        b=QduEhLBM8Li1QO3eXYq3m0s4+fIrknlRYXDQXUnC8lTPKOLE9rcGkud4F6ZH6jUCYR1yDU
        WfNh9NtAa0k0HTqx3FSFNznEYEAZxnq7srzZEQ5AyOfZgWRaslRS2UTG+p8fw7P4xlorFX
        Xdhf3JXq9WEwRDoRaClVVM4/Zxelv6k=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi everybody:

I have a Linux debian with twice ifaces:

- eth0: 192.168.1.1 (WAN)

- eth1: 192.168.2.1 (LAN)

as Home Router and GW of my Home LAN (192.168.2.0/24).

=46rom time to time, I up an tun0 iface as openvpn client in this Home Ro=
uter.

I up this openvpn connection with "--route-nopull" parameter, because I
don't want redirect traffic of all my LAN devices through this VPN, but
only a few.

I set the following rules with IPTABLES to permit traffic from VPN:

- iptables -A INPUT -i tun+ -j ACCEPT
- iptables -A OUTPUT -o tun+ -j ACCEPT
- iptables -A FORWARD -i eth0 -o tun+ -j ACCEPT
- iptables -t nat -A POSTROUTING -o tun+ -j MASQUERADE


Ok, how can I do to make this redirect to specific hosts?


Thanks,

Regards,





