From: "Chris Notley" <netfilter@notleyc.fastmail.fm>
Subject: Re: (no subject)
Date: Thu, 25 Aug 2005 12:55:35 +0100
Message-ID: <1124970935.24801.241455397@webmail.messagingengine.com>
References: <1124921733.4001.241416298@webmail.messagingengine.com>
	<430CF75A.1030105@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <430CF75A.1030105@lopsch.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


On Thu, 25 Aug 2005 00:40:26 +0200, "Daniel Lopes" <lopsch@lopsch.com>
said:
> netfilter@notleyc.fastmail.fm schrieb:
> > Hi,
> > 
> > I've been trying to apply Patrick McHardy's netfilter+ipsec patches to
> > my 
> > 2.6.12-5 (from kernel.org) using patch-o-matic.  When I try to apply any
> > of 
> > the four patches I receive the following message:
> > 
> > patchlets/ipsec-01-output-hooks has dependency on nf_reset, but nf_reset
> > is 
> > not known
> > 
> > I've probably missed something obvious, but I've hit a dead end, any
> > help 
> > would be appreciated.  
> > 
> > Cheers,
> > Chris
> 
> I've read somewhere deleting the dependency in the info file should let 
> apply the patch cleanly. The other hooks for example hook number x 
> depend on the hook x-1. So if the 01 hook applies cleanly the others 
> should do aswell.
> 
Thanks Daniel, that did the trick!

Cheers,
Chris

