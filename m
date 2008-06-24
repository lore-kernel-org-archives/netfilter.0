From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: VPN client from behind a firewall
Date: Tue, 24 Jun 2008 10:58:27 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806241057550.16957@fbirervta.pbzchgretzou.qr>
References: <90d975d30806160444t7c9bbf21if9b0062e2e72ac56@mail.gmail.com>  <48565817.2040600@infolibre.net>  <alpine.LNX.1.10.0806161720190.6620@fbirervta.pbzchgretzou.qr> <90d975d30806240136j5c54032awf4de9aa04598257d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <90d975d30806240136j5c54032awf4de9aa04598257d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gergely Buday <gbuday@gmail.com>
Cc: mathieu <mathieu@infolibre.net>, netfilter@vger.kernel.org


On Tuesday 2008-06-24 10:36, Gergely Buday wrote:
>> As such -p udp 500 and -p esp will be needed for a firewall;
>> and only -p udp 4500 for a NAT.
>
>Thanks for your help. I made it work by adding "500" after -p udp in
>the first command. Does this make a security risk?

Rent a security guy who will talk you into it being either
"yeah that's secure" or "well but that opens holes"? :-)
