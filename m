From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: thoughts on a newbie tutorial i'll be giving shortly
Date: Thu, 30 Oct 2003 16:56:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031030184542.698CB1B9B8@smtp.ttp.nl>
References: <Pine.LNX.4.44.0310300823360.18175-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0310300823360.18175-100000@localhost.localdomain>
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
To: "'Robert P. J. Day'" <rpjday@mindspring.com>
Cc: 'iptables mailing list' <netfilter@lists.netfilter.org>

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


