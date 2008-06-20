From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to SNAT in PREROUTING table for local machine
Date: Fri, 20 Jun 2008 12:58:19 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806201256120.11250@fbirervta.pbzchgretzou.qr>
References: <004a01c8d204$fb1022e0$1402a8c0@nemesisk7> <485B84FA.9080204@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <485B84FA.9080204@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Tobias Krummen <tobias.krummen@t-online.de>, netfilter@vger.kernel.org


On Friday 2008-06-20 12:22, Patrick McHardy wrote:

> Tobias Krummen wrote:
>> So, is there a way to change the source ip-address of incoming packets with
>> the given possibilities of netfilter, or are there other tools to get this
>> done?
>
> You need to add an INPUT chain to the NAT table to do this
> and adjust the HOOK2MANIP macro to deal with this.

Alternatively, RAWNAT is supposed do this with the existing 'raw'
table, before conntracking is involved; and on the output path, uses
a 'rawpost' table that comes after conntracking. It is fully modular
and it is not required to touch any in-kernel code.
I have not lately tested this target though, so some adjustments
might be needed.
