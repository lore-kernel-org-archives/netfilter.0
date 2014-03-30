From: mathieu.poirier@linaro.org
Subject: [RFC PATCH 0/2] netfilter: Adding quota capabilities to nfnetlink
Date: Sun, 30 Mar 2014 15:10:42 -0600
Message-ID: <1396213844-10528-1-git-send-email-mathieu.poirier@linaro.org>
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pablo@netfilter.org
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, mathieu.poirier@linaro.org

From: Mathieu Poirier <mathieu.poirier@linaro.org>

This is another re-spin on adding quota capabilities to the nfnetlink
accounting framework.  This time most of the quota support is located
in the framework itself rather than the filter.

Comments welcomed.

Thanks,
Mathieu

Mathieu Poirier (1):
  netfilter: xt_nfacct: Add quota to nfacct filter

Pablo Neira Ayuso (1):
  netfilter: nfnetlink_acct: Adding quota support to nf_acct objects

 include/linux/netfilter/nfnetlink_acct.h      |  3 +-
 include/uapi/linux/netfilter/nfnetlink.h      |  2 +
 include/uapi/linux/netfilter/nfnetlink_acct.h |  9 +++
 net/netfilter/nfnetlink_acct.c                | 93 +++++++++++++++++++++++++++
 net/netfilter/xt_nfacct.c                     | 13 ++++
 5 files changed, 119 insertions(+), 1 deletion(-)

-- 
1.8.3.2

