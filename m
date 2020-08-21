From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Fwd: Issue migrating "iptables -m socket --transparent" into
 nftables
Date: Fri, 21 Aug 2020 17:23:33 +0200
Message-ID: <20200821152333.GA22135@salvia>
References: <CAKcfE+ZhO2O6nanU=ABJB8ptpB8VvjCK1wmzQ8TMFx+U-0_8nw@mail.gmail.com>
 <CAKcfE+anbh1OoHt7vgyYRt89J-fjsKK48Fzy8SCm3RP=HQQcOw@mail.gmail.com>
 <32610365.DCq6cjG4UW@deimos>
 <20200819075832.GA3994@salvia>
 <CAKcfE+Yyo-zj9Oxh4Oth6yK7SoXVfa2mQrK9-11Q5NHc09uXzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="vtzGhvizbBRQ85DL"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKcfE+Yyo-zj9Oxh4Oth6yK7SoXVfa2mQrK9-11Q5NHc09uXzQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Balazs Scheidler <bazsi77@gmail.com>
Cc: Nirgal =?iso-8859-1?Q?Vourg=E8re?= <contact_vgernf@nirgal.com>, netfilter@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2020 at 05:15:21PM +0200, Balazs Scheidler wrote:
> Hi,
> 
> Here's the accompanying nftables patch, just in case Pablo didn't do it.

Thanks Balazs, this looks good to me!

> Pablo do you want me to submit these as a pull request?

You can just send them via git format-patch to
netfilter-devel@vger.kernel.org.

> All I did for testing was that it did compile this ruleset and attempted to
> submit it via netlink to the kernel, which it refused, as I didn't patch my
> kernel.

I'm attaching the kernel patch, compiled-tested only by now.

> ```
> table inet haproxy {
>   chain prerouting {
>      type filter hook prerouting priority -150; policy accept;
>      socket transparent 1 socket wildcard 0 mark set 0x00000001
>    }
> }
> ```

Thanks.

--vtzGhvizbBRQ85DL
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-netfilter-nft_socket-add-wildcard-support.patch"

From 6c7ffee435cead6d6b97eef62455e77a35537fd8 Mon Sep 17 00:00:00 2001
From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Wed, 19 Aug 2020 09:47:40 +0200
Subject: [PATCH] netfilter: nft_socket: add wildcard support

Add NFT_SOCKET_WILDCARD to match to wildcard socket listener.

Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
---
 include/uapi/linux/netfilter/nf_tables.h |  2 ++
 net/netfilter/nft_socket.c               | 25 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/uapi/linux/netfilter/nf_tables.h b/include/uapi/linux/netfilter/nf_tables.h
index 42f351c1f5c5..fed3514395a5 100644
--- a/include/uapi/linux/netfilter/nf_tables.h
+++ b/include/uapi/linux/netfilter/nf_tables.h
@@ -1008,10 +1008,12 @@ enum nft_socket_attributes {
  *
  * @NFT_SOCKET_TRANSPARENT: Value of the IP(V6)_TRANSPARENT socket option
  * @NFT_SOCKET_MARK: Value of the socket mark
+ * @NFT_SOCKET_WILDCARD: Socket listener is bound to any address
  */
 enum nft_socket_keys {
 	NFT_SOCKET_TRANSPARENT,
 	NFT_SOCKET_MARK,
+	NFT_SOCKET_WILDCARD,
 	__NFT_SOCKET_MAX
 };
 #define NFT_SOCKET_MAX	(__NFT_SOCKET_MAX - 1)
diff --git a/net/netfilter/nft_socket.c b/net/netfilter/nft_socket.c
index 637ce3e8c575..684a7e493f45 100644
--- a/net/netfilter/nft_socket.c
+++ b/net/netfilter/nft_socket.c
@@ -14,6 +14,23 @@ struct nft_socket {
 	};
 };
 
+static void nft_socket_wildcard(const struct nft_pktinfo *pkt,
+				struct nft_regs *regs, struct sock *sk,
+				u32 *dest)
+{
+	switch (nft_pf(pkt)) {
+	case NFPROTO_IPV4:
+		nft_reg_store8(dest, inet_sk(sk)->inet_rcv_saddr == 0);
+		break;
+	case NFPROTO_IPV6:
+		nft_reg_store8(dest, ipv6_addr_any(&sk->sk_v6_rcv_saddr));
+		break;
+	default:
+		regs->verdict.code = NFT_BREAK;
+		return;
+	}
+}
+
 static void nft_socket_eval(const struct nft_expr *expr,
 			    struct nft_regs *regs,
 			    const struct nft_pktinfo *pkt)
@@ -59,6 +76,13 @@ static void nft_socket_eval(const struct nft_expr *expr,
 			return;
 		}
 		break;
+	case NFT_SOCKET_WILDCARD:
+		if (!sk_fullsock(sk)) {
+			regs->verdict.code = NFT_BREAK;
+			return;
+		}
+		nft_socket_wildcard(pkt, regs, sk, dest);
+		break;
 	default:
 		WARN_ON(1);
 		regs->verdict.code = NFT_BREAK;
@@ -97,6 +121,7 @@ static int nft_socket_init(const struct nft_ctx *ctx,
 	priv->key = ntohl(nla_get_u32(tb[NFTA_SOCKET_KEY]));
 	switch(priv->key) {
 	case NFT_SOCKET_TRANSPARENT:
+	case NFT_SOCKET_WILDCARD:
 		len = sizeof(u8);
 		break;
 	case NFT_SOCKET_MARK:
-- 
2.20.1


--vtzGhvizbBRQ85DL--
