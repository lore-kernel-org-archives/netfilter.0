From: Brian Neu <proclivity76@yahoo.com>
Subject: Urgent:  IPsec patches to 2.6.11.8 gives nf_reset is not known
Date: Mon, 2 May 2005 11:19:57 -0700 (PDT)
Message-ID: <20050502181957.29492.qmail@web51901.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I thought maybe I had identified a bug, but my
bugzilla post about patchomatic installation problems
was grouped into an IPsec functional bug.

https://bugzilla.netfilter.org/bugzilla/show_bug.cgi?id=328

I'm looking for a solution to patch the kernel
successfully.  I read posts about people getting this
working, but can't figure out what I'm doing wrong.



Here is what I get when I try Patch-o-matic . . . . 


Welcome to Patch-o-matic ($Revision: 3733 $)!

Kernel:   2.6.11, /usr/src/linux-2.6.11.8
Iptables: 1.3.1, /usr/src/iptables
Each patch is a new feature: many have minimal impact,
some do not.
Almost every one has bugs, so don't apply what you
don't need!
-------------------------------------------------------
Already applied: CLASSIFY SAME addrtype comment
hashlimit realm sctp 
NETMAP iprange

Testing ipsec-01-output-hooks... not applied
The ipsec-01-output-hooks patch:
   Author: Patrick McHardy <kaber@trash.net>
   Status: Testing, should be fine

[NETFILTER+IPSEC 1/4]

This patch adds new output hooks for IPsec. Packets
traverse the hooks 
like this:

1. -> (plain) FORWARD   -> POST_ROUTING -> (encrypted)
LOCAL_OUT -> 
POST_ROUTING
2. -> (plain) LOCAL_OUT -> POST_ROUTING -> (encrypted)
LOCAL_OUT -> 
POST_ROUTING
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?]
y
ipsec-01-output-hooks has dependency on nf_reset, but
nf_reset is not 
known
ipsec-01-output-hooks has dependency on nf_reset, but
nf_reset is not 
known
-----------------------------------------------------------------



