Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117521D6195
	for <netfilter@vger.kernel.org>; Thu, 17 Oct 2024 23:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729207838; cv=none; b=H0zQEsVEy8/R5ju4qbu2RqBzNDoh9r+j9wi9zQnvjWAugROaE3Aw6M/ENmafgJ7ecNkpNHkAxf0dowKFRg3Lyqdz+a5srK2TZ4dOnOWLestippwjPQpfischmMkLitvAUAROE7DWAOQrCNUGjxptzU0KlaqqwaVNsWzbpi1/wRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729207838; c=relaxed/simple;
	bh=c3VUVal+IPKzCCKsEVzHWwqufk4UsEm1MkrSBrbxPPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVf609X39MYg4Jtvbn+3nQIoHPZWs1gIFthL1ocs+sM2ZnJScq+xOoRDnhKli0oTrCFlFyBV8My+b9PdvCU51eyUxHx+8F91DqfF4NiLEfy4tOSzGIIv9lG6kiQIAUNWh2A3+MMDifM1HK2vjHWRsPb8W/8I1jXd05dzz+vjXTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1t1Zwt-00011q-GC; Fri, 18 Oct 2024 01:30:31 +0200
Date: Fri, 18 Oct 2024 01:30:31 +0200
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Subject: Re: Most optimal method to dump UDP conntrack entries
Message-ID: <20241017233031.GA3675@breakpoint.cc>
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc>
 <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> We are not worried about being slow in the order of seconds, the
> system is eventually consistent so there can always be a reasonable
> latency.
> Since we only care about UDP, losing packets during that period is not
> desirable but is assumable.
> My main concern is if constantly dumping all the entries via netlink
> can cause any issue or increase resources consumption.

It doesn't need lots of extra memory on kernel side, just for the
some internal tracking ("where were we") and temporary netlink
buffer to assemble the dump chunks returned to userspace.

> > > Also both proc and netlink dumps can miss entries (albeit its rare),
> > > if parallel insertions/deletes happen (which is normal on busy system).
> 
> That is one of the reasons we want to implement this reconcile loop,
> so it can be resilient to this kind of errors, we keep the state on
> the API in the control plane, so we can always rebuild the state in
> the dataplane (recreating nftables rules and delete conntrack entries
> that does not match the current state)

OK, but wouldn't it be better to not need this at all?

The UDP tracker is old and refreshs the timeout for every packet, but
who says it needs to stay that way?

With very simple patch to only refresh in 'reply' dir:

    [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
[DESTROY] udp      17 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
    [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
[DESTROY] udp      17 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819
    [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=49819 dport=12345 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=12345 dport=49819

This is with a unidirectional UDP stream.

diff --git a/net/netfilter/nf_conntrack_proto_udp.c b/net/netfilter/nf_conntrack_proto_udp.c
--- a/net/netfilter/nf_conntrack_proto_udp.c
+++ b/net/netfilter/nf_conntrack_proto_udp.c
@@ -17,6 +17,7 @@
 #include <linux/netfilter.h>
 #include <linux/netfilter_ipv4.h>
 #include <linux/netfilter_ipv6.h>
+#include <net/netfilter/nf_conntrack_acct.h>
 #include <net/netfilter/nf_conntrack_l4proto.h>
 #include <net/netfilter/nf_conntrack_ecache.h>
 #include <net/netfilter/nf_conntrack_timeout.h>
@@ -80,6 +81,35 @@ static bool udp_error(struct sk_buff *skb,
 	return false;
 }
 
+static void nf_ct_refresh_udp(struct nf_conn *ct,
+			      enum ip_conntrack_dir dir,
+			      u32 len, u32 extra_jiffies)
+{
+	/* Only update if this is not a fixed timeout */
+	if (test_bit(IPS_FIXED_TIMEOUT_BIT, &ct->status))
+		return nf_ct_acct_update(ct, dir, len);
+
+	switch (dir) {
+	case IP_CT_DIR_ORIGINAL:
+		/* do not refresh in original dir, else stale dnat mapping
+		 * can be kept alive indefinitely.
+		 */
+		if (nf_ct_is_confirmed(ct))
+			return nf_ct_acct_update(ct, dir, len);
+		break;
+	case IP_CT_DIR_REPLY:
+		extra_jiffies += nfct_time_stamp;
+		break;
+	case IP_CT_DIR_MAX: /* silence warning wrt. unhandled enum */
+		break;
+	}
+
+	if (READ_ONCE(ct->timeout) != extra_jiffies)
+		WRITE_ONCE(ct->timeout, extra_jiffies);
+
+	nf_ct_acct_update(ct, dir, len);
+}
+
 /* Returns verdict for packet, and may modify conntracktype */
 int nf_conntrack_udp_packet(struct nf_conn *ct,
 			    struct sk_buff *skb,
@@ -114,7 +144,7 @@ int nf_conntrack_udp_packet(struct nf_conn *ct,
 			stream = (status & IPS_ASSURED) == 0;
 		}
 
-		nf_ct_refresh_acct(ct, ctinfo, skb, extra);
+		nf_ct_refresh_udp(ct, CTINFO2DIR(ctinfo), skb->len, extra);
 
 		/* never set ASSURED for IPS_NAT_CLASH, they time out soon */
 		if (unlikely((status & IPS_NAT_CLASH)))
@@ -124,7 +154,7 @@ int nf_conntrack_udp_packet(struct nf_conn *ct,
 		if (stream && !test_and_set_bit(IPS_ASSURED_BIT, &ct->status))
 			nf_conntrack_event_cache(IPCT_ASSURED, ct);
 	} else {
-		nf_ct_refresh_acct(ct, ctinfo, skb, timeouts[UDP_CT_UNREPLIED]);
+		nf_ct_refresh_udp(ct, CTINFO2DIR(ctinfo), skb->len, timeouts[UDP_CT_UNREPLIED]);
 	}
 	return NF_ACCEPT;
 }

The obvious counter-argument is "but what if its the reply side that is
sending, and we have a stale SNAT mapping?".

Solution would be to track timestamp of last packet seen per direction,
and then stop refreshing the timeout if one side ceases sending.

I think thats much better than what we have now and there would be no
need to actively zap UDP flows, they would timeout automatically once
one side ceases to transmit.
