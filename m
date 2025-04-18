Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D391CDDBC
	for <netfilter@vger.kernel.org>; Fri, 18 Apr 2025 00:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744935354; cv=none; b=eq1cewBG3bdkasnKEU3QE9/GGTRORdpHWVg9ZxpoU+iz1HSr1cFBnaUj1KWpl8uOSvjZj6QR09rg013FAlszrEja/5wWe9zgnwAqaXgeuYxV1jRGfNEc/rFA8Qq1AgNfvHopF9m/IBJ1Yy1HB9JOepCVtt0r+uf6HAeZNI3nL2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744935354; c=relaxed/simple;
	bh=futBe/n/WtXNAnnWBTHM4shttioIbCniYZh1MQyKMhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKKltx31dab1btwWg36QPsyTLeR2vksnexGaqTJbMPJhAVKDoN9Y8Q+AlVygPnttrbVv2YTP/v1mepwfWputytJ48H3IAQqwxM2D7qky1E6TqmTi+exmBw3VXqOUy7EYz99hzoCv91LqFDwNYzetnV3TUemerLsR3FcyvvfmVu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1u5ZOR-0005a1-HD; Fri, 18 Apr 2025 02:15:43 +0200
Date: Fri, 18 Apr 2025 02:15:43 +0200
From: Florian Westphal <fw@strlen.de>
To: Kevin Vigouroux <ke.vigouroux@laposte.net>
Cc: netfilter@vger.kernel.org
Subject: Re: Can the PCP field be set in the netdev table?
Message-ID: <20250418001543.GB20519@breakpoint.cc>
References: <877c3kvzyk.fsf@laposte.net>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c3kvzyk.fsf@laposte.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

Kevin Vigouroux <ke.vigouroux@laposte.net> wrote:
> Hi!
> 
> I tried in vain to modify the PCP field with many rules. Nothing worked.

Yes, this is broken, likely due to vlan hw tag offload.

>   [ bitwise reg 1 = ( reg 1 & 0x0000001f ) ^ 0x00000020 ]
>   [ payload write reg 1 => 1b @ link header + 14 csum_type 0 csum_off 0 csum_flags 0x0 ]
                             ~~

kernel doesn't handle 1 byte writes to the vlan pseudoheader at this
time, so this will need a userspace/nft fixup to expand this to a 2 byte write.

I can look at it next week (need to create a vlan test setup first).

You could try to disable HW offload of the vlan tag and see if that helps.

with patch, this will emit a 2byte load/store which kernel should be
able to handle:

  [ meta load iiftype => reg 1 ]
  [ cmp eq reg 1 0x00000001 ]
  [ payload load 2b @ link header + 12 => reg 1 ]
  [ cmp eq reg 1 0x00000081 ]
  [ payload load 2b @ link header + 14 => reg 1 ]
  [ bitwise reg 1 = ( reg 1 & 0x0000ff1f ) ^ 0x00000020 ]
  [ payload write reg 1 => 2b @ link header + 14 csum_type 0 csum_off 0 csum_flags 0x0 ]
  [ counter pkts 0 bytes 0 ]

A short in the dark, compile tested only, no idea if this is enough to
make it work.

diff --git a/src/evaluate.c b/src/evaluate.c
--- a/src/evaluate.c
+++ b/src/evaluate.c
@@ -3258,6 +3258,24 @@ static bool stmt_evaluate_payload_need_csum(const struct expr *payload)
 	return desc && desc->checksum_key;
 }
 
+static bool stmt_evaluate_is_vlan(const struct expr *payload)
+{
+	return payload->payload.base == PROTO_BASE_LL_HDR &&
+	       payload->payload.desc == &proto_vlan;
+}
+
+static bool stmt_evaluate_payload_need_aligned_fetch(const struct expr *payload)
+{
+
+	if (stmt_evaluate_payload_need_csum(payload))
+		return true;
+
+	if (stmt_evaluate_is_vlan(payload))
+		return true;
+
+	return false;
+}
+
 static int stmt_evaluate_exthdr(struct eval_ctx *ctx, struct stmt *stmt)
 {
 	struct expr *exthdr;
@@ -3287,7 +3305,7 @@ static int stmt_evaluate_payload(struct eval_ctx *ctx, struct stmt *stmt)
 	unsigned int masklen, extra_len = 0;
 	struct expr *payload;
 	mpz_t bitmask, ff;
-	bool need_csum;
+	bool aligned_fetch;
 
 	if (stmt->payload.expr->payload.inner_desc) {
 		return expr_error(ctx->msgs, stmt->payload.expr,
@@ -3310,7 +3328,7 @@ static int stmt_evaluate_payload(struct eval_ctx *ctx, struct stmt *stmt)
 	if (stmt->payload.val->etype == EXPR_RANGE)
 		return stmt_error_range(ctx, stmt, stmt->payload.val);
 
-	need_csum = stmt_evaluate_payload_need_csum(payload);
+	aligned_fetch = stmt_evaluate_payload_need_aligned_fetch(payload);
 
 	if (!payload_needs_adjustment(payload)) {
 
@@ -3318,7 +3336,7 @@ static int stmt_evaluate_payload(struct eval_ctx *ctx, struct stmt *stmt)
 		 * update checksum and the length is not even because
 		 * kernel checksum functions cannot deal with odd lengths.
 		 */
-		if (!need_csum || ((payload->len / BITS_PER_BYTE) & 1) == 0)
+		if (!aligned_fetch || ((payload->len / BITS_PER_BYTE) & 1) == 0)
 			return 0;
 	}
 
@@ -3334,7 +3352,7 @@ static int stmt_evaluate_payload(struct eval_ctx *ctx, struct stmt *stmt)
 				  "uneven load cannot span more than %u bytes, got %u",
 				  sizeof(data), payload_byte_size);
 
-	if (need_csum && payload_byte_size & 1) {
+	if (aligned_fetch && payload_byte_size & 1) {
 		payload_byte_size++;
 
 		if (payload_byte_offset & 1) { /* prefer 16bit aligned fetch */
