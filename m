From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: RE: thoughts on a newbie tutorial i'll be giving shortly
Date: Thu, 30 Oct 2003 08:25:48 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310300823360.18175-100000@localhost.localdomain>
References: <20031030160409.CB6171B9B8@smtp.ttp.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031030160409.CB6171B9B8@smtp.ttp.nl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Sterenborg <rob@sterenborg.info>
Cc: 'iptables mailing list' <netfilter@lists.netfilter.org>

On Thu, 30 Oct 2003, Rob Sterenborg wrote:

> > Just my 0.02, if it's worth that much considering I cant even 
> > get DNS lookups from my fw working.....
> 
> You have probably set policy to DROP for the OUTPUT chain.
> iptables -A OUTPUT -p udp --dport 53 [-d ip_dns] -j ACCEPT
> Some would say to also do this for the tcp proto, but this should work.

there are definitely two schools of thought: 1) those who set a
policy of ACCEPT on OUTPUT and just do all the filtering on INPUT, 
and 2) those who want to be really specific on both INPUT and
OUTPUT.

if you want to be really restrictive on your OUTPUT chain, that's
fine.  but for testing purposes, you might want to open it up,
make sure everything works, *then* lock it down and see what
breaks.  at least you'll be closer to isolating the problem.

rday


