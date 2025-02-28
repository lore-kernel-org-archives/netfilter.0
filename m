Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6028BE7
	for <netfilter@vger.kernel.org>; Fri, 28 Feb 2025 14:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740752722; cv=none; b=EGRd2QRSBsn4ZvZOpIl/e0TZ0Z/m3V2Yg/nOzujQyt5cauOwjDltyYzcNBm9IgUla5wBR2iUAm/DCwvw9eL+vhGUqy4wO9OoqVHq7MyI4g/h0ko4zs36dv/Fl1C1WXI169CXWQjdMDgz8Kpq/r/6Mllc2QHjPjhkqUxiDfhhoiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740752722; c=relaxed/simple;
	bh=t26a2ravRR+kZDdnJ+khHoATHGGvjtb0J06nRryuRvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IER/3sXZvDOIMhj82TjFs98Hgj1OffzTV087zC/nVlF52CZnXRw6P1SwS6dCQjq40v11BIIMLKFuA9Z8/qD7TYwTMaPGuyLCQmmRovRAtI1xL5No2P3TSKRvAUhR2ayQ+oV0j13XzLZN1CLwzjb++DBLF1kdcbiEFPO9hJxiaQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1to1IZ-0006VR-LN; Fri, 28 Feb 2025 15:25:07 +0100
Date: Fri, 28 Feb 2025 15:25:07 +0100
From: Florian Westphal <fw@strlen.de>
To: Michael Menge <michael.menge@zdv.uni-tuebingen.de>
Cc: netfilter@vger.kernel.org
Subject: Re: nft reset element crashes with error BUG: unhandled op 8
Message-ID: <20250228142507.GA24116@breakpoint.cc>
References: <20250228151158.Horde.S7bxprjzrKb3P7rZjqTDZz_@webmail.uni-tuebingen.de>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228151158.Horde.S7bxprjzrKb3P7rZjqTDZz_@webmail.uni-tuebingen.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Michael Menge <michael.menge@zdv.uni-tuebingen.de> wrote:
> i want to use a named set in nftables to to restrict outgoing http(s)
> connections only to
> update servers. As the update servers are behind CDNs with multiple changing
> IPs i need
> to automatically update the named set.
> 
> I discovered that "reset element" was added to the nft command which should
> enable me to reset
> the timeout without removing the IPs already in the set, and to keep a clean
> list of IPs.

No, you can update existing element timeouts:
nft add element inet filter updatesv4 {1.2.3.4 timeout 1h expires 1h}

reset will not affect the timeout, only quota or counters.

> Fetch list of IPs, Call
> "nft add element inet filter updatesv4 {a.b.c.d timeout 1h}" and
> "nft reset element inet filter updatesv4 {a.b.c.d}" for each IP
> 
> (I know that i can use multiple IPs, in the add and reset element command)
> 
> In my test I triggered the following error:
> ===
> [root@mail ~]# nft add element inet filter updatesv4 {1.2.3.4 timeout 1h}
> [root@mail ~]# nft list set inet filter updatesv4
> table inet filter {
> 	set updatesv4 {
> 		type ipv4_addr
> 		flags interval,timeout
> 		elements = { 1.2.3.4 timeout 1h expires 59m53s324ms }
> 	}
> }
> [root@mail ~]# nft reset element inet filter updatesv4 {1.2.3.4}
> BUG: unhandled op 8
> nft: evaluate.c:1734: interval_set_eval: Assertion `0' failed.
> Aborted (core dumped)

This should be the right fix, I will submit this formally later:
diff --git a/src/evaluate.c b/src/evaluate.c
--- a/src/evaluate.c
+++ b/src/evaluate.c
@@ -1946,6 +1946,7 @@ static int interval_set_eval(struct eval_ctx *ctx, struct set *set,
 				 ctx->nft->debug_mask);
 		break;
 	case CMD_GET:
+	case CMD_RESET:
 		break;
 	default:
 		BUG("unhandled op %d\n", ctx->cmd->op);

