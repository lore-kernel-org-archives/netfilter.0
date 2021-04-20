From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd inverted NAT address, endianness issue?
Date: Tue, 20 Apr 2021 11:18:53 +0200
Message-ID: <20210420091853.GA23774@salvia>
References: <CAOAu+xL2ao_r-FK=XYFR3PORvE-E7zLOx0giRGjbB1E5cpUhrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="C7zPtVaVf+AK4Oqc"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOAu+xL2ao_r-FK=XYFR3PORvE-E7zLOx0giRGjbB1E5cpUhrw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
To: Tao Gong <gongtao0607@gmail.com>
Cc: netfilter@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

On Mon, Apr 19, 2021 at 01:03:47PM -0700, Tao Gong wrote:
> Hi,
> 
> I'm using conntrackd for firewall failovers. When I examine the
> conntrack table, I found the second firewall (the rule it is syncing
> to) has inverted natdst (or reply_dst) addresses:
> 
> Firewall1:
> ```
> root@OpenWrt:~# conntrackd -i |grep "66.x.25.6"
> udp      17 src=172.25.100.137 dst=66.x.25.6 sport=53093 dport=443
> src=66.x.25.6 dst=76.y.1.128 sport=443 dport=53093 [ASSURED] [active
> since 7128s]
> tcp      6 ESTABLISHED src=172.25.100.137 dst=66.x.25.6 sport=58033
> dport=443 src=66.x.25.6 dst=76.y.1.128 sport=443 dport=58033 [ASSURED]
> [active since 7129s]
> ```
> 
> Firewall2:
> ```
> root@OpenWrt2:~# conntrackd -e |grep "66.x.25.6"
> tcp      6 ESTABLISHED src=172.25.100.137 dst=66.x.25.6 sport=58033
> dport=443 [ASSURED] [active since 7234s]
> udp      17 src=172.25.100.137 dst=66.x.25.6 sport=53093 dport=443
> [ASSURED] [active since 7233s]
> root@OpenWrt2:~# conntrackd -c
> root@OpenWrt2:~# conntrackd -i |grep "66.x.25.6"
> tcp      6 ESTABLISHED src=172.25.100.137 dst=66.x.25.6 sport=58033
> dport=443 src=66.x.25.6 dst=128.1.y.76 sport=443 dport=58033 [ASSURED]
> mark=0 [active since 5s]
> udp      17 src=172.25.100.137 dst=66.x.25.6 sport=53093 dport=443
> src=66.x.25.6 dst=128.1.y.76 sport=443 dport=53093 [ASSURED] mark=0
> [active since 5s]
> ```
> 
> Note how the second dst (natdst) is inverted. Surely the traffic isn't
> going through on a failover.
> Is this an endianness bug in encoding/decoding?
>
> Setup: (Yes I'm mixing big and little endians)
> Firewall1: OpenWrt on a x86_64 (little endian), kernel 4.14.180
> Firewall2: OpenWrt on a MIPS (big endian), kernel 4.14.209
> conntrack-tools 1.4.5 for both

It's a bug. Could you try this patch that I'm attaching?

--C7zPtVaVf+AK4Oqc
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="x.patch"

diff --git a/src/build.c b/src/build.c
index 477199723d62..63e47c796230 100644
--- a/src/build.c
+++ b/src/build.c
@@ -66,7 +66,14 @@ ct_build_u32(const struct nf_conntrack *ct, int a, struct nethdr *n, int b)
 }
 
 static inline void
-ct_build_u128(const struct nf_conntrack *ct, int a, struct nethdr *n, int b)
+ct_build_be32(const struct nf_conntrack *ct, int a, struct nethdr *n, int b)
+{
+	uint32_t data = nfct_get_attr_u32(ct, a);
+	addattr(n, b, &data, sizeof(uint32_t));
+}
+
+static inline void
+ct_build_be128(const struct nf_conntrack *ct, int a, struct nethdr *n, int b)
 {
 	const char *data = nfct_get_attr(ct, a);
 	addattr(n, b, data, sizeof(uint32_t) * 4);
@@ -279,18 +286,18 @@ void ct2msg(const struct nf_conntrack *ct, struct nethdr *n)
 	switch (nfct_get_attr_u8(ct, ATTR_ORIG_L3PROTO)) {
 	case AF_INET:
 		if (nfct_getobjopt(ct, NFCT_GOPT_IS_SNAT))
-			ct_build_u32(ct, ATTR_REPL_IPV4_DST, n, NTA_SNAT_IPV4);
+			ct_build_be32(ct, ATTR_REPL_IPV4_DST, n, NTA_SNAT_IPV4);
 		if (nfct_getobjopt(ct, NFCT_GOPT_IS_DNAT))
-			ct_build_u32(ct, ATTR_REPL_IPV4_SRC, n, NTA_DNAT_IPV4);
+			ct_build_be32(ct, ATTR_REPL_IPV4_SRC, n, NTA_DNAT_IPV4);
 		break;
 	case AF_INET6:
 		if (nfct_getobjopt(ct, NFCT_GOPT_IS_SNAT)) {
-			ct_build_u128(ct, ATTR_REPL_IPV6_DST, n,
-				      NTA_SNAT_IPV6);
+			ct_build_be128(ct, ATTR_REPL_IPV6_DST, n,
+				       NTA_SNAT_IPV6);
 		}
 		if (nfct_getobjopt(ct, NFCT_GOPT_IS_DNAT)) {
-			ct_build_u128(ct, ATTR_REPL_IPV6_SRC, n,
-				      NTA_DNAT_IPV6);
+			ct_build_be128(ct, ATTR_REPL_IPV6_SRC, n,
+				       NTA_DNAT_IPV6);
 		}
 		break;
 	default:
diff --git a/src/parse.c b/src/parse.c
index e97a721c99ff..eedba66c29db 100644
--- a/src/parse.c
+++ b/src/parse.c
@@ -29,7 +29,8 @@
 static void ct_parse_u8(struct nf_conntrack *ct, int attr, void *data);
 static void ct_parse_u16(struct nf_conntrack *ct, int attr, void *data);
 static void ct_parse_u32(struct nf_conntrack *ct, int attr, void *data);
-static void ct_parse_u128(struct nf_conntrack *ct, int attr, void *data);
+static void ct_parse_be32(struct nf_conntrack *ct, int attr, void *data);
+static void ct_parse_be128(struct nf_conntrack *ct, int attr, void *data);
 static void ct_parse_str(struct nf_conntrack *ct,
 			 const struct netattr *, void *data);
 static void ct_parse_group(struct nf_conntrack *ct, int attr, void *data);
@@ -108,12 +109,12 @@ static struct ct_parser h[NTA_MAX] = {
 		.size	= NTA_SIZE(sizeof(struct nfct_attr_grp_port)),
 	},
 	[NTA_SNAT_IPV4]	= {
-		.parse	= ct_parse_u32,
+		.parse	= ct_parse_be32,
 		.attr	= ATTR_SNAT_IPV4,
 		.size	= NTA_SIZE(sizeof(uint32_t)),
 	},
 	[NTA_DNAT_IPV4] = {
-		.parse	= ct_parse_u32,
+		.parse	= ct_parse_be32,
 		.attr	= ATTR_DNAT_IPV4,
 		.size	= NTA_SIZE(sizeof(uint32_t)),
 	},
@@ -192,12 +193,12 @@ static struct ct_parser h[NTA_MAX] = {
 		.max_size = NTA_SIZE(NTA_LABELS_MAX_SIZE),
 	},
 	[NTA_SNAT_IPV6]	= {
-		.parse	= ct_parse_u128,
+		.parse	= ct_parse_be128,
 		.attr	= ATTR_SNAT_IPV6,
 		.size	= NTA_SIZE(sizeof(uint32_t) * 4),
 	},
 	[NTA_DNAT_IPV6] = {
-		.parse	= ct_parse_u128,
+		.parse	= ct_parse_be128,
 		.attr	= ATTR_DNAT_IPV6,
 		.size	= NTA_SIZE(sizeof(uint32_t) * 4),
 	},
@@ -234,7 +235,14 @@ ct_parse_u32(struct nf_conntrack *ct, int attr, void *data)
 }
 
 static void
-ct_parse_u128(struct nf_conntrack *ct, int attr, void *data)
+ct_parse_be32(struct nf_conntrack *ct, int attr, void *data)
+{
+	uint32_t *value = (uint32_t *) data;
+	nfct_set_attr_u32(ct, h[attr].attr, *value);
+}
+
+static void
+ct_parse_be128(struct nf_conntrack *ct, int attr, void *data)
 {
 	nfct_set_attr(ct, h[attr].attr, data);
 }

--C7zPtVaVf+AK4Oqc--
