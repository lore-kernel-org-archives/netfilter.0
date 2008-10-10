From: Yawhen Kasarzhewski <yevg@pisem.net>
Subject: Expectation table size
Date: Fri, 10 Oct 2008 17:38:14 +0300
Message-ID: <48EF68D6.7020807@pisem.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

does any one know which is the default expectation table size and how to 
enlarge it?

I get lots of messages in dmegs like:

nf_ct_q931: packet dropped
__ratelimit: 129 messages suppressed
nf_conntrack: expectation table full

I run 2.6.26.5 kernel.

