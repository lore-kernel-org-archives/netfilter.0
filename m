Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B511F891F
	for <netfilter@vger.kernel.org>; Mon, 21 Oct 2024 13:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518828; cv=none; b=rMJB3QSNJt117ziE4AO9waPQb9I9BuzYlTk2uj/QEw+uxYuLPIwVfvgqTIU3msAHSgSwnXU2c7h5H88knuKVrPWAmSPeOsuEz4iWeebiYodZU8vQxbGRYWZQA9U4dMMVhiB8EbRc5bIYrDGhPnQ96pQooMvhYzRo1CE7acYPO/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518828; c=relaxed/simple;
	bh=JcC6wXhGX8R+jnVs7vixj4MVGCrjTz0pqgK2K07lsFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRvT+fCKcOJ4TO82rY69BOO7wLjV02JgV2/nYCHnuZlyK/aiEGrXGZHGIYwMsSqYuuCuXoL4fU3b8mbExtFqAySltnGAwtUCrEVA09PrOQtUXrCT0X6GPEyTkHJ4oeakpu6mosdzkdVJ1jmRe4hD/MvF/53mpoGcYVx8HcaN85M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1t2sqs-0004fn-IF; Mon, 21 Oct 2024 15:53:42 +0200
Date: Mon, 21 Oct 2024 15:53:42 +0200
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: Florian Westphal <fw@strlen.de>,
	Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org
Subject: Re: Most optimal method to dump UDP conntrack entries
Message-ID: <20241021135342.GB15761@breakpoint.cc>
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc>
 <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
 <20241017233031.GA3675@breakpoint.cc>
 <CABhP=tY=YnMPSMH0-T2oxHyE2Uzoy=RnHQmO4DRQ_Go8xzMGeg@mail.gmail.com>
 <20241018113318.GA28324@breakpoint.cc>
 <CABhP=tZronr5azSE9mrr+hTKWFVb41jYQ2FzoWDahwVf1Zt4zQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=tZronr5azSE9mrr+hTKWFVb41jYQ2FzoWDahwVf1Zt4zQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> On Fri, 18 Oct 2024 at 13:33, Florian Westphal <fw@strlen.de> wrote:
> > Same as what happens now, 2nd packet follows NAT mapping of first one.
> 
> This looks like the way to go ... if you can send me a patch I can do
> some testing next week and report back

Here is a better patch, renew only when responses are seen.
This means that once either initiator or responder ceases to send
packets entry will time out.

Subject: netfilter: nf_conntrack_proto_udp: renew timeout only for bidirectional traffic

In commit e15d4cdf27cb
("netfilter: conntrack: do not renew entry stuck in tcp SYN_SENT state")
I changed TCP conntrack to let tcp entries time out in case initial SYN
packets never see SYN/ACK reply.  This allows NAT rules to be
re-evaluated again.

Do something similar for UDP and renew the timeout if the current
packet is the opposite direction as the last one.

Signed-off-by: Florian Westphal <fw@strlen.de>
---
 include/net/netfilter/nf_conntrack.h   |  3 ++-
 net/netfilter/nf_conntrack_proto_udp.c | 33 +++++++++++++++++---------
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/include/net/netfilter/nf_conntrack.h b/include/net/netfilter/nf_conntrack.h
index cba3ccf03fcc..e0c098e2705d 100644
--- a/include/net/netfilter/nf_conntrack.h
+++ b/include/net/netfilter/nf_conntrack.h
@@ -25,7 +25,8 @@
 #include <net/netfilter/nf_conntrack_tuple.h>
 
 struct nf_ct_udp {
-	unsigned long	stream_ts;
+	unsigned long stream_ts;
+	enum ip_conntrack_dir last_dir;
 };
 
 /* per conntrack: protocol private data */
diff --git a/net/netfilter/nf_conntrack_proto_udp.c b/net/netfilter/nf_conntrack_proto_udp.c
index 0030fbe8885c..33fcf52eeaf4 100644
--- a/net/netfilter/nf_conntrack_proto_udp.c
+++ b/net/netfilter/nf_conntrack_proto_udp.c
@@ -80,6 +80,16 @@ static bool udp_error(struct sk_buff *skb,
 	return false;
 }
 
+static bool udp_ts_reply(struct nf_conn *ct, enum ip_conntrack_dir dir)
+{
+	bool is_reply = READ_ONCE(ct->proto.udp.last_dir) != dir;
+
+	if (is_reply)
+		WRITE_ONCE(ct->proto.udp.last_dir, dir);
+
+	return is_reply;
+}
+
 /* Returns verdict for packet, and may modify conntracktype */
 int nf_conntrack_udp_packet(struct nf_conn *ct,
 			    struct sk_buff *skb,
@@ -87,8 +97,9 @@ int nf_conntrack_udp_packet(struct nf_conn *ct,
 			    enum ip_conntrack_info ctinfo,
 			    const struct nf_hook_state *state)
 {
+	unsigned long status, extra;
+	enum ip_conntrack_dir dir;
 	unsigned int *timeouts;
-	unsigned long status;
 
 	if (udp_error(skb, dataoff, state))
 		return -NF_ACCEPT;
@@ -97,15 +108,19 @@ int nf_conntrack_udp_packet(struct nf_conn *ct,
 	if (!timeouts)
 		timeouts = udp_get_timeouts(nf_ct_net(ct));
 
+	extra = timeouts[UDP_CT_UNREPLIED];
 	status = READ_ONCE(ct->status);
-	if ((status & IPS_CONFIRMED) == 0)
+	if ((status & IPS_CONFIRMED) == 0) {
 		ct->proto.udp.stream_ts = 2 * HZ + jiffies;
+		ct->proto.udp.last_dir = IP_CT_DIR_MAX;
+	}
+
+	dir = CTINFO2DIR(ctinfo);
 
 	/* If we've seen traffic both ways, this is some kind of UDP
 	 * stream. Set Assured.
 	 */
 	if (status & IPS_SEEN_REPLY) {
-		unsigned long extra = timeouts[UDP_CT_UNREPLIED];
 		bool stream = false;
 
 		/* Still active after two seconds? Extend timeout. */
@@ -114,18 +129,14 @@ int nf_conntrack_udp_packet(struct nf_conn *ct,
 			stream = (status & IPS_ASSURED) == 0;
 		}
 
-		nf_ct_refresh_acct(ct, ctinfo, skb, extra);
-
-		/* never set ASSURED for IPS_NAT_CLASH, they time out soon */
-		if (unlikely((status & IPS_NAT_CLASH)))
-			return NF_ACCEPT;
-
 		/* Also, more likely to be important, and not a probe */
 		if (stream && !test_and_set_bit(IPS_ASSURED_BIT, &ct->status))
 			nf_conntrack_event_cache(IPCT_ASSURED, ct);
-	} else {
-		nf_ct_refresh_acct(ct, ctinfo, skb, timeouts[UDP_CT_UNREPLIED]);
 	}
+
+	if (udp_ts_reply(ct, dir))
+		nf_ct_refresh_acct(ct, ctinfo, skb, extra);
+
 	return NF_ACCEPT;
 }
 
-- 
2.45.2

