From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Routing HTTP Through Another Link
Date: Tue, 1 Sep 2009 07:55:06 +0200
Message-ID: <20090901075506.478a8a6c@catlap>
References: <BLU116-W25EED7BAB4A40766109367A2F20@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BLU116-W25EED7BAB4A40766109367A2F20@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Diogo Sperb Schneider <vonsperb@live.com>, netfilter@vger.kernel.org

>Greetings!

Hello Diogo!

>I'd like to route my HTTP traffic (ports 80 and 443) through a separate
>link, but I'm not sure if I must use the ROUTE target or even how to

You can use policy routing with MARK:

iptables -t nat -A PREROUTING -i LAN_INTERFACE -m multiport --dport
80,443 -j MARK --set-mark 0x10
iptables -t nat -A POSTROUTING -o WWW_ONLY_LINK -j MASQUERADE

ip ru add fwmark 0x10 table 100 prio 100
ip ro add default via WWW_LINK_GW table 100

assumption: WWW_LINK_GW (gateway address of www-onlu link) is always
the same

Be sure to place MASQ rule before SNAT rule you've written about or
specify an output interface in SNAT rule.

You can find "ip" in "iproute2" package in any distro I think.

Best regards,
Marek
