From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: removing black listed ip
Date: Sat, 10 Apr 2010 19:12:52 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004101910020.32651@obet.zrqbmnf.qr>
References: <z2xcfeab66d1004101003j5eb39eb1t38ec3b31ce3ce4b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <z2xcfeab66d1004101003j5eb39eb1t38ec3b31ce3ce4b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

On Saturday 2010-04-10 19:03, ratheesh k wrote:

>Hi ,
>
> I need to remove black listed ip if   last seen packet is  x time
>ago  . I have changed code , but here it is comparing with first seen
>packet time . i need to compare last seen packet .

xt_recent works by comparing the difference between an entry's 
timestamps and the current time with the chosen --seconds parameter.


>@@ -178,6 +189,10 @@
> 		e->nstamps = e->index;
> 	e->index %= ip_pkt_list_tot;
> 	list_move_tail(&e->lru_list, &t->lru_list);
>+
>+
>+
>+
> }
>
> static struct recent_table *recent_table_lookup(const char *name)
>
>

What's with all this whitespace...
