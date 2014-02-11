From: mathieu.poirier@linaro.org
Subject: [PATCH v4 0/2] Add quota capabilities to nfacct
Date: Mon, 10 Feb 2014 19:27:06 -0700
Message-ID: <1392085628-24804-1-git-send-email-mathieu.poirier@linaro.org>
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pablo@netfilter.org
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, fw@strlen.de, mathieu.poirier@linaro.org

From: Mathieu Poirier <mathieu.poirier@linaro.org>

For this iteration the synchronisation of packet and byte
accounting in 'nfnl_acct_update' was added.  That allowed
for the removal of spinlocks from the match function
in xt_nfacct.  Comments from v3 were also addressed.

Mathieu Poirier (2):
  netfilter: nfnetlink_acct: make shared objects SMP safe
  netfilter: xtables: add quota support for nfacct

 include/linux/netfilter/nfnetlink_acct.h      |  15 ++-
 include/uapi/linux/netfilter/nfnetlink.h      |   2 +
 include/uapi/linux/netfilter/nfnetlink_acct.h |   1 +
 include/uapi/linux/netfilter/xt_nfacct.h      |  14 ++-
 net/netfilter/Kconfig                         |   3 +-
 net/netfilter/nfnetlink_acct.c                |  57 ++++++++---
 net/netfilter/xt_nfacct.c                     | 139 ++++++++++++++++++++++++--
 7 files changed, 202 insertions(+), 29 deletions(-)

-- 
1.8.3.2

