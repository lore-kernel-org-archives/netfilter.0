From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Set DSCP field for ipv6 packets using ip6tables command
Date: Thu, 26 Jan 2012 01:35:23 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201260133240.27039@frira.zrqbmnf.qr>
References: <083EE18768D966439D1223E96B690A910629868A65@staex7mb2.telecom.sna.samsung.com> <alpine.LNX.2.01.1201252203130.24440@frira.zrqbmnf.qr> <083EE18768D966439D1223E96B690A910629868C79@staex7mb2.telecom.sna.samsung.com> <alpine.LNX.2.01.1201260039130.25025@frira.zrqbmnf.qr>
 <083EE18768D966439D1223E96B690A910629868CBA@staex7mb2.telecom.sna.samsung.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <083EE18768D966439D1223E96B690A910629868CBA@staex7mb2.telecom.sna.samsung.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mrunal Upadhyay <m.upadhyay@sta.samsung.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thursday 2012-01-26 01:00, Mrunal Upadhyay wrote:

>Ok so now I understand using -j TOS --set-tos would help me to set the 
>desired DSCP value based on the value I pass.

TOS - DSCP - it's the same field, just with lots of different names for 
both the field and potential values.

>But does the current ip6tables command support TOS target for IPV6 
>packets?

Yes, otherwise I would not have mentioned it :)


