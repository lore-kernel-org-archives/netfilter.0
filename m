From: rigoberto perez <rigo666beast@yahoo.com>
Subject: Re: using ip_defrag in NF_IP_FORWARDING
Date: Wed, 5 Mar 2008 14:37:20 -0800 (PST)
Message-ID: <772066.11090.qm@web33202.mail.mud.yahoo.com>
References: <Pine.LNX.4.64.0803021510060.27717@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0803021510060.27717@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter <netfilter@vger.kernel.org>


How can I load conntrack? 

I write a netfilter module and I define the hook
priority = NF_IP_PRI_CONNTRACK in a NF_IP_PRE_ROUTING
hook and call to ip_defrag and the system crashes. I
tried to use another priority =
NF_IP_PRI_CONNTRACK_DEFRAG and it's the same: the
system crashes again.

I saw in the WEB a comment about to use ip_defrag only
in the NF_IP_FORWARDING and NF_IP_LOCAL_OUT hooks
only, is that correct?

Remember my problem: I want to use ip_defrag even if
the packet must be forward to another host, i mean, in
a router.

Thanks.


      ____________________________________________________________________________________
Looking for last minute shopping deals?  
Find them fast with Yahoo! Search.  http://tools.search.yahoo.com/newsearch/category.php?category=shopping
