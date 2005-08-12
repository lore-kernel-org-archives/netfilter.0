From: "Peter B. West" <lists@pbw.id.au>
Subject: Repost: ip_local_deliver: bad skb:
Date: Fri, 12 Aug 2005 01:01:19 +0100
Message-ID: <42FBE6CF.7090506@pbw.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Posting this again, as I haven't seen any replies.  Is this the right 
mailing list?


Just lately, my /var/log/messages has been filling up with messages like
this:

Aug  6 14:26:35 jezebel kernel: ip_local_deliver: bad skb: \
                             PRE_ROUTING LOCAL_IN LOCAL_OUT POST_ROUTING
Aug  6 14:26:35 jezebel kernel: skb: pf=2 (unowned) dev=lo len=52
Aug  6 14:26:35 jezebel kernel: PROTO=6 127.0.0.1:35923 127.0.0.1:111 \
                                       L=52 S=0x00 I=4590 F=0x4000 T=64

I've also seen PROTOs 17 and 1.

Can anyone enlighten me as to what is going on?

Thanks
Peter
-- 
Peter B. West <http://cv.pbw.id.au/>
Folio <http://defoe.sourceforge.net/folio/>
<http://folio.bkbits.net/> <- the atTridged version
---
[This E-mail has been scanned for viruses but it is your responsibility 
to maintain up to date anti virus software on the device that you are
currently using to read this email. ]


