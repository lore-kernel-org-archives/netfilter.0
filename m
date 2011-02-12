From: Jan Engelhardt <jengelh@medozas.de>
Subject: [patch] warn on use of ctstate checking in raw
Date: Sat, 12 Feb 2011 04:27:54 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1102120425020.2159@obet.zrqbmnf.qr>
References: <1233805814.468.1297447131465.JavaMail.root@tahiti.vyatta.com> <1426981515.473.1297447301826.JavaMail.root@tahiti.vyatta.com> <AANLkTik2CyiQ3RQZxsxLSMmSFrzCKD+rLr7=tY4asvLG@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik2CyiQ3RQZxsxLSMmSFrzCKD+rLr7=tY4asvLG@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Steven Kath <steven.kath@vyatta.com>, netfilter@vger.kernel.org, Pandu Poluan <pandu@poluan.info>

On Saturday 2011-02-12 03:14, Pandu Poluan wrote:

>(sorry for top posting)
>
>Strangely enough, the iptables binary does not complain when I tried:
>
>iptables -t raw -A PREROUTING -p icmp -m state --state
>ESTABLISHED,RELATED -j LOG --log-prefix "RP MATCH:"

Well, `rm -Rf *` also does not complain about files going away --
"Computer is a serious tool" :-)


Oh well, nature. Here's a patch for nature...

parent 44bd4de9c2270b22c3c898310102bc6be9ed2978 (v2.6.38-rc1-187-g44bd4de)
commit ddc00998c0b1aa720720529ebaac73bb142e531f
Author: Jan Engelhardt <jengelh@medozas.de>
Date:   Sat Feb 12 04:24:07 2011 +0100

netfilter: xt_conntrack: warn about use in raw table

nfct happens to run after the raw table only.

Signed-off-by: Jan Engelhardt <jengelh@medozas.de>
---
 net/netfilter/xt_conntrack.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/net/netfilter/xt_conntrack.c b/net/netfilter/xt_conntrack.c
index 4ef1b63..2c0086a 100644
--- a/net/netfilter/xt_conntrack.c
+++ b/net/netfilter/xt_conntrack.c
@@ -272,6 +272,11 @@ static int conntrack_mt_check(const struct xt_mtchk_param *par)
 {
 	int ret;
 
+	if (strcmp(par->table, "raw") == 0) {
+		pr_info("state is undetermined at the time of raw table\n");
+		return -EINVAL;
+	}
+
 	ret = nf_ct_l3proto_try_module_get(par->family);
 	if (ret < 0)
 		pr_info("cannot load conntrack support for proto=%u\n",
-- 
# Created with git-export-patch
