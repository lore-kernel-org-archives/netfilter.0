From: Robert White <rwhite@pobox.com>
Subject: Question: Why can't non-hooked chains have policies?
Date: Tue, 21 Mar 2017 19:49:56 +0000
Message-ID: <1cc7769a-b025-a2f2-15d3-8c2baceb9132@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am not sure if this is deliberate or an oversight, but it seems that 
chains without a hook directive can not have a policy.

The decision of what to do if you fall off the end of a chain is not 
hard to answer with an explicit directive, but in terms of a chain you 
might want to flush and rebuild or whatever it's just sort of surprising.

Trivial example of discussion point:

table ip example {
   chain expected_normal {
     type filter hook forward priority 0; policy drop;
     iif eth0 goto avoid_policy_if_flushed
     iif eth1 goto ought_to_be_legal
   }
   chain avoid_policy_if_flushed {
     drop
   }
   chain ought_to_be_legal {
     policy drop; # not legal but should be IMHO
   }
}

later # nft flush chain ip example avoid_policy_if_flushed

Now obviously using jump instead of goto makes this less of an issue, so 
this isn't impossible, but if something/someone tangles up some logic 
surprises could develop.

I haven't figured out of this limit is arbitrary code or if it's 
inherent to how hooks work. So this is a request for discussion not a 
feature request etc. email.

--Rob.
