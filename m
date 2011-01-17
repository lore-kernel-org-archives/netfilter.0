From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: POSTROUTING SNAT only reply packets
Date: Mon, 17 Jan 2011 12:36:57 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101171231200.29904@obet.zrqbmnf.qr>
References: <4D341710.60509@gmail.com> <4D341C26.2010207@freemail.hu> <4D34200F.5050307@coochey.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D34200F.5050307@coochey.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giles Coochey <giles@coochey.net>
Cc: =?UTF-8?Q?G=C3=A1sp=C3=A1r_Lajos?= <swifty@freemail.hu>, GMail Isaac Gonzalez <isaak.gonzalez@gmail.com>, netfilter list <netfilter@vger.kernel.org>


On Monday 2011-01-17 11:55, Giles Coochey wrote:
>>
>> You should do all of the NAT-ing ON THE LOAD BALANCER:
>>
>
>I have to agree - if you are doing NAT you want to avoid any type of asymmetric
>routing - especially you NEED to make sure that the device that is doing the
>NAT (be it for load balancing or other reasons) receives the return packets.

Not strictly. You could utilize a second device whose CTs are synchronized
with the LB to apply the reverse transform, using conntrackd.
Sort of like

digraph { internet -> lb; lb -> web; web -> unnat; unnat -> internet; };

but it only looks feasible to me if your LB is already computationally 
crowded.
