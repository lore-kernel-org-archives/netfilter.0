From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: RE: thoughts on a newbie tutorial i'll be giving shortly
Date: Thu, 30 Oct 2003 16:54:11 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA5791C@OST_EXCH_USR5>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iptables mailing list <netfilter@lists.netfilter.org>

Cheers guys - this is really helpful stuff. I've set it to OUTPUT ACCEPT and
will ensure all works as expected then work my way from there, plus lots of
logging. 

Thanks heaps

s


-----Original Message-----
From: Rob Sterenborg [mailto:rob@sterenborg.info] 
Sent: 30 October 2003 3.56
To: 'Robert P. J. Day'
Cc: 'iptables mailing list'
Subject: RE: thoughts on a newbie tutorial i'll be giving shortly


> there are definitely two schools of thought: 1) those who set 

I know ;o)

> if you want to be really restrictive on your OUTPUT chain, 
> that's fine.  but for testing purposes, you might want to 
> open it up, make sure everything works, *then* lock it down 
> and see what breaks.  at least you'll be closer to isolating 
> the problem.

I was referring to the last statement, not your question (which makes
this OT btw, but I wanted to answer Steve) :
> > Just my 0.02, if it's worth that much considering I cant even get 
> > DNS lookups from my fw working.....

In your case I'd not set policy to DROP for OUPUT.
IMHO it would be overkill for an introduction of approx. 30 minutes.


Gr,
Rob




.


-----------------------------------------------------------------------
Information in this email may be privileged, confidential and is 
intended exclusively for the addressee.  The views expressed may
not be official policy, but the personal views of the originator.
If you have received it in error, please notify the sender by return
e-mail and delete it from your system.  You should not reproduce, 
distribute, store, retransmit, use or disclose its contents to anyone.
 
Please note we reserve the right to monitor all e-mail
communication through our internal and external networks.
-----------------------------------------------------------------------


