From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: POSTROUTING SNAT only reply packets
Date: Mon, 17 Jan 2011 13:10:02 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101171308110.29904@obet.zrqbmnf.qr>
References: <4D341710.60509@gmail.com> <4D341C26.2010207@freemail.hu> <4D34200F.5050307@coochey.net> <alpine.LNX.2.01.1101171231200.29904@obet.zrqbmnf.qr> <4D342AF4.6070504@coochey.net> <4D342E99.2030501@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D342E99.2030501@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: GMail Isaac Gonzalez <isaak.gonzalez@gmail.com>
Cc: Giles Coochey <giles@coochey.net>, =?UTF-8?Q?G=C3=A1sp=C3=A1r_Lajos?= <swifty@freemail.hu>, netfilter list <netfilter@vger.kernel.org>


On Monday 2011-01-17 12:57, GMail Isaac Gonzalez wrote:
>
>>>>NAT (be it for load balancing or other reasons) receives the
>>>>return packets.
>>>
>>>Not strictly. You could utilize a second device whose CTs are
>>>synchronized with the LB to apply the reverse transform, using
>>>conntrackd.
>>
>>It also requires the loadbalancer to be using netfilter as well.
>
>It works with propietary methods. The real solution if do
>symmetrical routing, all the replies must pass through the LB. I
>can't use conntrackd because I can't install anything in the LB.

Too bad. That heater statement from earlier does have value ;-)
("Did you know?..." That Linux also has a load balancer included.)
