From: Steven Kath <steven.kath@vyatta.com>
Subject: nf_conntrack hashsize change during runtime?
Date: Mon, 13 Sep 2010 09:38:08 -0700 (PDT)
Message-ID: <711158190.14289.1284395888866.JavaMail.root@tahiti.vyatta.com>
References: <278313905.14287.1284395632211.JavaMail.root@tahiti.vyatta.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <278313905.14287.1284395632211.JavaMail.root@tahiti.vyatta.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter mailing list <netfilter@vger.kernel.org>


I have seen a number of resources online saying that the nf_conntrack hashsize parameter can be modified during runtime, with instructions like the following: 

> Since 2.6.14, it is possible to set hashsize dynamically at runtime, after boot and module load. 
> 
> Between 2.6.14 and 2.6.19 (included), use: 
> echo $HASHSIZE > /sys/module/ip_conntrack/parameters/hashsize 
> 
> Since 2.6.20, use: 
> echo $HASHSIZE > /sys/module/nf_conntrack/parameters/hashsize 

These instructions are repeated word-for-word at a number of sites, but I haven't seen anything authoritative to substantiate it and I suspect it might be apocryphal advice. 

The netfilter FAQ describes the hashsize as a load-time parameter only, but its last-modified date is over seven years ago.  

Is it necessary to reload the conntrack module to properly adjust the hash size, or is it viable to change it during runtime?  Any caveats to be aware of?

Thanks,
Steven
