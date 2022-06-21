From: Florian Westphal <fw@strlen.de>
Subject: Re: Create Rule w/ Source IP Example
Date: Tue, 21 Jun 2022 18:23:28 +0200
Message-ID: <20220621162328.GB12815@breakpoint.cc>
References: <1e1957fe-2bbf-699e-bdfd-28c88fff363a@vt.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1e1957fe-2bbf-699e-bdfd-28c88fff363a@vt.edu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kiernan George <kbg98@vt.edu>
Cc: netfilter@vger.kernel.org

Kiernan George <kbg98@vt.edu> wrote:
> Hi,
> 
> Could you provide an example for adding a rule with an IP address and a
> protocol in it? I am currently getting this error with libnftnl version
> 1.2.2:
> 
> nf_tables kernel ABI is broken, contact your vendor.
> rule.c:355 reason: Numerical result out of range
> 
> I tried following the examples, but unfortunately there is not one that does
> what I am trying to do, and I can't find any documentation on how to use the
> API past what the examples show. I can create tables, chains, maps, but I
> can't get this to work.

examples/nft-rule-add.c is (almost) doing what you want.

diff --git a/examples/nft-rule-add.c b/examples/nft-rule-add.c
index 77ee4805f4a4..a1d41b358eb8 100644
--- a/examples/nft-rule-add.c
+++ b/examples/nft-rule-add.c
@@ -84,7 +84,7 @@ static struct nftnl_rule *setup_rule(uint8_t family, const char *table,
 {
        struct nftnl_rule *r = NULL;
        uint8_t proto;
-       uint16_t dport;
+       uint32_t addr;
        uint64_t handle_num;
 
        r = nftnl_rule_alloc();
@@ -107,10 +107,10 @@ static struct nftnl_rule *setup_rule(uint8_t family, const char *table,
                    offsetof(struct iphdr, protocol), sizeof(uint8_t));
        add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &proto, sizeof(uint8_t));
 
-       dport = htons(22);
-       add_payload(r, NFT_PAYLOAD_TRANSPORT_HEADER, NFT_REG_1,
-                   offsetof(struct tcphdr, dest), sizeof(uint16_t));
-       add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &dport, sizeof(uint16_t));
+       inet_pton(AF_INET, "10.1.2.3", &addr);
+       add_payload(r, NFT_PAYLOAD_NETWORK_HEADER, NFT_REG_1,
+                   offsetof(struct iphdr, saddr), sizeof(uint32_t));
+       add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &addr, sizeof(uint32_t));
 
        add_counter(r);


... gives
 ip protocol tcp ip saddr 10.1.2.3 counter

