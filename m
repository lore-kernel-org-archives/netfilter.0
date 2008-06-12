From: rigoberto perez <rigo666beast@yahoo.com>
Subject: Defragmentation in Netfilter Hook
Date: Thu, 12 Jun 2008 05:25:22 -0700 (PDT)
Message-ID: <278184.19561.qm@web33201.mail.mud.yahoo.com>
Reply-To: rigo666beast@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

The ip_conntrack module makes an automatic defragmentation but I need modify the packets (padding bytes and change the ip protocol) and the conntrack have a rare behavior with TCP connections. The Netfilter Howto Documment (Netfilter Hooks For Tunnel Writers) it recommended to do:

nf_conntrack_put(skb->nfct);
skb->nfct = 0;

But it don't resolves my problem, so I'm trying to avoid use ip_conntrack module cause I use it only for defragmentation. The point is: how I can do a manualy defragmentation in netfilter hook?

The funtion ip_defrag return a NULL pointer if the packet is not complete and I don't know what do with the packet: I should enqueue it? How?

I appreciate any help, Thanks.

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
