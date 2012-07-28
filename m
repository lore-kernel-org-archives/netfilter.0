From: Ming-Ching Tiew <mctiew@yahoo.com>
Subject: Re: Identify traffic coming from which bridge
Date: Fri, 27 Jul 2012 21:15:14 -0700 (PDT)
Message-ID: <1343448914.32230.YahooMailNeo@web124906.mail.ne1.yahoo.com>
References: <1343284518.33961.YahooMailNeo@web124903.mail.ne1.yahoo.com> <CANaOheaLYwF7vgxT_feX_VwvG6jJ+WC5NowgAMnLZVPLL9cDdw@mail.gmail.com>
Reply-To: Ming-Ching Tiew <mctiew@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1343448914; bh=wanr60rPkmI3ubNT+vyEaNcFC3dGWuYslO7n4X+dluY=; h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=6ZYLLeHLE4Thxt5xqYtzJGSZSXDoljZ7KQmngEhC2xdmFs8RqGKyfemZ9sKJLyGosd2hyBCYznAHrQQtWrP0L/74azejTrGtdVV2cH1YXxZ/xIvI6CgeIekndLvr+WEJ296+/z6iF4V6zLg+0G5dZZoVIxb8dmMCRupClSd8bqc=
In-Reply-To: <CANaOheaLYwF7vgxT_feX_VwvG6jJ+WC5NowgAMnLZVPLL9cDdw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: kay <kay.diam@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



=46irst of all thank you for your suggestion.=20


I did what you suggested, it does not seem to work.=20


But perhaps I need to clarify :-

1. The iptables/ipset are to be carried on the the server,
=A0=A0=A0 is that right ?
2. The mac addresses of the bridge - I am testing using
=A0=A0=A0 a linux bridge, are you refering to the br0, eth0 or eth1
=A0=A0=A0 mac address ?

In any case when I tested,=A0 it seems to only identify the=20

bridge itself connecting to the server. Anything from the=20

clients are not picked up by the iptables/ipset rules.


----- Original Message -----
=46rom: kay <kay.diam@gmail.com>
To: netfilter@vger.kernel.org
Cc:=20
Sent: Saturday, July 28, 2012 10:58 AM
Subject: Re: Identify traffic coming from which bridge

Dear Master Yoda =3D)

You can try to use "--mac-source" match in iptables, combine iptables
with ipset and get the following rules:

ipset create bridge_a_clients src hash:ip
ipset create bridge_b_clients src hash:ip

iptables -t raw -A PREROUTING=A0 --mac-source "BRIDGE_A_MAC" -j SET
--add-set bridge_a_clients src
iptables -t raw -A PREROUTING=A0 --mac-source "BRIDGE_B_MAC" -j SET
--add-set bridge_b_clients src

To view bridge_a_clients use:
ipset bridge_a_clients list

To view bridge_b_clients use:
ipset bridge_b_clients list

This is not optimal solution, but it should help you.

Regards!

2012/7/26 Ming-Ching Tiew <mctiew@yahoo.com>:
> When a client X is connected to the server, is there a way for the se=
rver to
> know client X is connected via which bridge ?
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at=A0 http://vger.kernel.org/majordomo-info.html

