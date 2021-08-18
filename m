From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ulogd packet based logging with CT info
Date: Wed, 18 Aug 2021 09:22:56 +0200
Message-ID: <20210818072256.GA4640@salvia>
References: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
 <20210815143118.GA15248@salvia>
 <CAMEa=fkU4sJjtPHkJ-ZvPOUtnZtOUJmfSqMy+Q4CKf4Lqdde4Q@mail.gmail.com>
 <CAMEa=f=nzCzM-9a5B0VEkjN5zXgCTqobGe-sgN2K0G_5QgjdAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="u3/rZRmxL6MmkK24"
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMEa=f=nzCzM-9a5B0VEkjN5zXgCTqobGe-sgN2K0G_5QgjdAQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
To: =?utf-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Cc: netfilter@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Aug 17, 2021 at 04:42:12PM +0200, Blažej Krajňák wrote:
> Hello Pablo,
> 
> I'm just rewriting input plugin ulog_inppkt_NFLOG.c to include
> conntrack params. I successfully included CT flags from enum
> ip_conntrack_status (assured, reply seen, ...) and CT state and
> direction from NFULA_CT_INFO.

Great.

> However, in NFULA_CT few counters from enum nf_conntrack_attr are
> still 0 value. For ex. ATTR_TIMESTAMP_START / STOP and
> ATTR_ORIG/REPL_COUNTER_PACKETS/BYTES.
> Is it normal, or am I missing some bug at parsing?

You need this kernel patch to add this information to nfnetlink_queue,
compile-tested only.

--u3/rZRmxL6MmkK24
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="x.patch"

diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index eb35c6151fb0..0677531ce8db 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -2669,6 +2669,8 @@ ctnetlink_glue_build_size(const struct nf_conn *ct)
 	       + nla_total_size(0) /* CTA_HELP */
 	       + nla_total_size(NF_CT_HELPER_NAME_LEN) /* CTA_HELP_NAME */
 	       + ctnetlink_secctx_size(ct)
+	       + ctnetlink_acct_size(ct)
+	       + ctnetlink_timestamp_size(ct)
 #if IS_ENABLED(CONFIG_NF_NAT)
 	       + 2 * nla_total_size(0) /* CTA_NAT_SEQ_ADJ_ORIG|REPL */
 	       + 6 * nla_total_size(sizeof(u_int32_t)) /* CTA_NAT_SEQ_OFFSET */
@@ -2726,6 +2728,10 @@ static int __ctnetlink_glue_build(struct sk_buff *skb, struct nf_conn *ct)
 	if (ctnetlink_dump_protoinfo(skb, ct, false) < 0)
 		goto nla_put_failure;
 
+	if (ctnetlink_dump_acct(skb, ct, IPCTNL_MSG_CT_GET) < 0 ||
+	    ctnetlink_dump_timestamp(skb, ct) < 0)
+		goto nla_put_failure;
+
 	if (ctnetlink_dump_helpinfo(skb, ct) < 0)
 		goto nla_put_failure;
 

--u3/rZRmxL6MmkK24--
