From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: connlimit
Date: Mon, 7 Mar 2011 14:18:14 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1103071412030.13336@obet.zrqbmnf.qr>
References: <AANLkTimvu4CSZqsrbMgJHLXB5L8asRpZ+Aq7UM18MWhg@mail.gmail.com> <alpine.LNX.2.01.1103071257540.32524@obet.zrqbmnf.qr> <AANLkTi=d32gLoFshPpcMix_zBDiTO6cc1PxkxG0=mnJM@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=d32gLoFshPpcMix_zBDiTO6cc1PxkxG0=mnJM@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benjamin fernandis <benjo11111@gmail.com>
Cc: netfilter@vger.kernel.org

On Monday 2011-03-07 13:31, benjamin fernandis wrote:

>connlimit is working on per second basis or..........?
>
>can i configure limit per second per ip.............

The well-known version of xt_connlimit (as present in Linux 2.6.23 and 
onwards) supports groups of subnet prefixes of src addresses, and counts 
the _number of connections_. For _rates_, see xt_hashlimit and/or 
xt_rateest.
xt_connlimit in Linux 2.6.39 will support dstaddr matching.
