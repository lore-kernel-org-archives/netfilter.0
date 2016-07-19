From: jalvarez <jalvarez@toulouse.viveris.com>
Subject: Re: netfilter/nftables: chain rule dumps
Date: Tue, 19 Jul 2016 10:59:28 +0200
Message-ID: <578DEBF0.2090707@toulouse.viveris.com>
References: <578636F6.70802@toulouse.viveris.com>
 <20160713144036.GA1385@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20160713144036.GA1385@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 13/07/2016 16:40, Pablo Neira Ayuso wrote:
> On Wed, Jul 13, 2016 at 02:41:26PM +0200, jalvarez wrote:
>> (...)
>> I have been looking at the code of libmnl, libnftnl and nftables, and I
>> currently didn't see any way of doing the following :
>> - dumping the rules for a specific chain or table. I saw it is indeed
>> possible to dump the rules for a specific family as it is done in
>> mnl_nft_rule_dump, but i didn't see any way of doing so for a specific
>> chain.
> There is no support for this selective dumping yet in the kernel, but
> it should be very easy to add by enhancing the rule dumping. You can
> attach .data via netlink_dump_control structure. You only have to
> define a container structure like:
>
>          struct nft_rule_dump {
>                  const char *table;
>                  const char *chain;
>          };
>
> The idea is to strdup() the string that comes with NFTA_RULE_TABLE and
> NFTA_RULE_CHAIN and attach this to the container structure above, then
> use this information from nf_tables_dump_rules(). Don't forget to
> release these two pointers by setting .done callback in
> netlink_dump_control.
>
> The file to modify is net/netfilter/nf_tables_api.c under the kernel
> tree, this should result in a relatively small patch. Would you
> contribute this update?
Thank you for your answer.

I dug into the kernel code yesterday and I have come up with a small 
patch (see below).
I am a complete newbie in kernel development, please feel free to 
correct me if there is anything I did wrong.

The kernel builds ok but I didn't tested my changes yet. Have you an 
idea of what the best approach
should be to test these changes (using User Mode Linux maybe ?) ?

Also, I would like to know what is the exact meaning and expected 
behavior of the idx counter in nf_tables_dump_rules().
My current changes might actually break the expected behavior if it was 
some kind of "rule id counter" instead of "iteration counter". If it is 
possible, I would rather not put the continues in the rules loop, as the 
goal of these changes is mostly to avoid looping through the whole ruleset.

Again, I am very thankful for your help.

Here is the patch :
---

diff --git a/include/net/netfilter/nf_tables.h 
b/include/net/netfilter/nf_tables.h
index 3ae969e..a7c3ddf 100644
--- a/include/net/netfilter/nf_tables.h
+++ b/include/net/netfilter/nf_tables.h
@@ -92,6 +92,19 @@ struct nft_ctx {
         bool                            report;
  };

+
+/**
+ *     struct nft_rule_dump_ctx - nf_tables context for rule dumping.
+ *
+ *     @table: the table the chain is contained in.
+ *     @chain: the chain the rules to be dumped are contained in.
+ */
+struct nft_rule_dump_ctx {
+       const char *table;
+       const char *chain;
+};
+
+
  struct nft_data_desc {
         enum nft_data_types             type;
         unsigned int                    len;
diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
index 3b3ddb4..a11213fa 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -1756,6 +1756,7 @@ static int nf_tables_dump_rules(struct sk_buff *skb,
         const struct nft_table *table;
         const struct nft_chain *chain;
         const struct nft_rule *rule;
+       const struct nft_rule_dump_ctx *ctx = cb->data;
         unsigned int idx = 0, s_idx = cb->args[0];
         struct net *net = sock_net(skb->sk);
         int family = nfmsg->nfgen_family;
@@ -1768,7 +1769,13 @@ static int nf_tables_dump_rules(struct sk_buff *skb,
                         continue;

                 list_for_each_entry_rcu(table, &afi->tables, list) {
+                       if(ctx->table != NULL && (strcmp(ctx->table, 
table->name) != 0))
+                               continue;
+
                         list_for_each_entry_rcu(chain, &table->chains, 
list) {
+                               if(ctx->chain != NULL && 
(strcmp(ctx->chain, chain->name) != 0))
+                                       continue;
+
                                 list_for_each_entry_rcu(rule, 
&chain->rules, list) {
                                         if (!nft_rule_is_active(net, rule))
                                                 goto cont;
@@ -1798,6 +1805,49 @@ done:
         return skb->len;
  }

+
+static int nf_tables_fill_rule_dump_ctx(struct nft_rule_dump_ctx *ctx,
+                                       const struct nlattr * const nla[])
+{
+       const struct nlattr* table_nla;
+       const struct nlattr* chain_nla;
+       char* buf;
+       size_t buflen;
+
+       table_nla = nla[NFTA_RULE_TABLE];
+       if(table_nla != NULL) {
+               buflen = nla_len(table_nla);
+               buf = kmalloc(buflen, GFP_KERNEL);
+               nla_strlcpy(buf, table_nla, buflen);
+               ctx->table = buf;
+       } else {
+               ctx->table = NULL;
+       }
+
+       chain_nla = nla[NFTA_RULE_CHAIN];
+       if(chain_nla != NULL) {
+               buflen = nla_len(chain_nla);
+               buf = kmalloc(buflen, GFP_KERNEL);
+               nla_strlcpy(buf, chain_nla, buflen);
+               ctx->chain = buf;
+       } else {
+               ctx->chain = NULL;
+       }
+
+       return 0;
+}
+
+static int nf_tables_dump_rules_done(struct netlink_callback *cb)
+{
+       if(cb->data != NULL) {
+               struct nft_rule_dump_ctx *ctx = cb->data;
+               kfree(ctx->table);
+               kfree(ctx->chain);
+       }
+       kfree(cb->data);
+       return 0;
+}
+
  static int nf_tables_getrule(struct sock *nlsk, struct sk_buff *skb,
                              const struct nlmsghdr *nlh,
                              const struct nlattr * const nla[])
@@ -1813,9 +1863,14 @@ static int nf_tables_getrule(struct sock *nlsk, 
struct sk_buff *skb,
         int err;

         if (nlh->nlmsg_flags & NLM_F_DUMP) {
+               struct nft_rule_dump_ctx *ctx = kmalloc(sizeof(*ctx), 
GFP_KERNEL);
                 struct netlink_dump_control c = {
                         .dump = nf_tables_dump_rules,
+                       .done = nf_tables_dump_rules_done,
+                       .data = ctx
                 };
+
+               nf_tables_fill_rule_dump_ctx(ctx, nla);
                 return netlink_dump_start(nlsk, skb, nlh, &c);
         }
