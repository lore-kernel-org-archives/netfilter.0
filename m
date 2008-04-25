From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: DNAT, and finding out original destination IP?
Date: Fri, 25 Apr 2008 14:04:34 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804251403280.11644@fbirervta.pbzchgretzou.qr>
References: <e97f32c10804250406ve0f4b5dx2d1ca01f5dae9f84@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e97f32c10804250406ve0f4b5dx2d1ca01f5dae9f84@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bradley Kite <bradley.kite@gmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2008-04-25 13:06, Bradley Kite wrote:
>
>I'm using DNAT to transparently redirect TCP connections to a local
>application which is listening on a port for new connections.
>
From within my application, I'd like to be able to find out the
>original destination IP address of the packet/connection, before it
>got DNAT'ed.

getsockopt(... SO_ORIGINAL_DST ...) in endpoint programs or
alternatively, iptables -m conntrack --ctorigdst <xxx> can be used
in iptables.
