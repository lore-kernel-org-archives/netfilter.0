From: netfilter@notleyc.fastmail.fm
Subject: (no subject)
Date: Wed, 24 Aug 2005 23:15:33 +0100
Message-ID: <1124921733.4001.241416298@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

I've been trying to apply Patrick McHardy's netfilter+ipsec patches to
my 
2.6.12-5 (from kernel.org) using patch-o-matic.  When I try to apply any
of 
the four patches I receive the following message:

patchlets/ipsec-01-output-hooks has dependency on nf_reset, but nf_reset
is 
not known

I've probably missed something obvious, but I've hit a dead end, any
help 
would be appreciated.  

Cheers,
Chris
-- 
  Chris Notley
  chris@notley.org


