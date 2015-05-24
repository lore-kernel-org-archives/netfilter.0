From: Yan Seiner <yan@seiner.com>
Subject: proxy and quotas
Date: Sun, 24 May 2015 12:11:03 -0700
Message-ID: <55622247.90308@seiner.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I'm trying to get quotas working.  Earlier I posted a query about the 
proxy module not working correctly.  In my attempts to diagnose the 
problem I came up with another issue.

Right now, the 'guests' - those users who do not have credentials - use 
an unsecured network.  I am trying to figure out how to limit them to a 
quota.

However, I also have  proxy which gives my guests the ability to get to 
the internet either directly through the FORWARD chain or via the proxy 
through the INPUT chain.

So....  If I want to limit a user to a hard quota, how should I 
structure my iptables rules?

Not all packets go through the PREROUTING chain, and once the routing 
decision is done, they go either through the INPUT chain to the proxy or 
through the FORWARD chain to the outside via POSTROUTING.

On the return leg they repeat the process; come in on PREROUTING, get 
de-MASQ'd, and either go through FORWARD or INPUT and then out to the 
guest user via POSTROUTING.

I could put my accounting rules in POSTROUTING but then I lose the 
source or destination information.

Is there a place in PRE- or POSTROUTING that is guaranteed to see every 
packet?

Thanks.
