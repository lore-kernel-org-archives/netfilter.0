Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7028C182D8
	for <netfilter@vger.kernel.org>; Thu,  1 Aug 2024 18:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722535288; cv=none; b=Gn0qbeE1a+fdAzcaRo0lXZAUFcrP+ZW0ixwlc5memGovMoj3xHve4V5xgWgT1x6DKev0mDZ04VRvICpbob87UXdv4tMWicLYiK6JsTvRWcqY2jzTBOah27vUa2lWRrROFQZqGcRHxJntNMTWGyb8gieGvVqIXXm1gIAp2ez8oxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722535288; c=relaxed/simple;
	bh=JFMohmRWX75JZU3xXdHWWjMuGrxHudblqSMXV1bwbQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUpmfWF7L2svUpuYgWWxazwOTdZ7EDfI/vmmmZXvBLbW7Eay8pNuNmpP//q/2s4J5tST+DAxbviTilNWFq9g5qXIJ3grL4AP5ofSXFESyGyyOeb2P9iyAEwOZHNgHAlxpKlmxR6kiEEVNa89a8/bCjGi03ZAuYAgbt9uS3/Zsjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1sZa72-0002zF-36; Thu, 01 Aug 2024 20:01:16 +0200
Date: Thu, 1 Aug 2024 20:01:16 +0200
From: Florian Westphal <fw@strlen.de>
To: Arne Zachlod <arne@nerdkeller.org>
Cc: netfilter@vger.kernel.org
Subject: Re: libnftables way of deleting a rule
Message-ID: <20240801180116.GA11401@breakpoint.cc>
References: <5dd7c429-94f8-40b6-be32-9de999d3bbdf@nerdkeller.org>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dd7c429-94f8-40b6-be32-9de999d3bbdf@nerdkeller.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Arne Zachlod <arne@nerdkeller.org> wrote:
> I'm porting a program (written in C) that currently uses iptables to
> nftables, trying to not change a lot of the internal concept of said
> program.
> The program currently uses execute() calls and calls iptables directly via
> these. I wanted to at least use libnftables, and everything seems to works
> quite well, I just have a problem with deleting rules.
> I read through the code of libnftables, but I couldn't find a way to get the
> handle of a rule I added. In iptables, this is no problem, you just give the
> rule again to delete it. In libnftables though I need the handle. Currently,
> I'm looking into libnftables-json, but I would prefer not to use it just to
> get the handles. Is there a better way of deleting a rule than parsing the
> JSON for them? Maybe even with libnftables directly?

Depends, if you can remember which rule has which handle assigned then
this would work, modified add example:

+++ a/examples/nft-buffer.c
+++ b/examples/nft-buffer.c
@@ -11,6 +11,8 @@ const char ruleset[] =
 int main(void)
 {
        struct nft_ctx *ctx;
+       char buf[8192];
+       FILE *fp;
        int err;
 
        ctx = nft_ctx_new(0);
@@ -19,16 +21,20 @@ int main(void)
                return EXIT_FAILURE;
        }
 
+       nft_ctx_output_set_flags(ctx, NFT_CTX_OUTPUT_ECHO | NFT_CTX_OUTPUT_HANDLE);
+
+       buf[0] = 0;
+       fp = fmemopen(buf, sizeof(buf), "w+");
+       nft_ctx_set_output(ctx, fp);
+
        /* create ruleset: all commands in the buffer are atomically applied */
        err = nft_run_cmd_from_buffer(ctx, ruleset);
        if (err < 0)
                fprintf(stderr, "failed to run nftables command\n");
 
-       err = nft_run_cmd_from_buffer(ctx, "list ruleset");
-       if (err < 0)
-               fprintf(stderr, "failed to run nftables command\n");
-
        nft_ctx_free(ctx);
+       fclose(fp);
+       fprintf(stderr, "res is %s\n", buf);
 
        return EXIT_SUCCESS;
 }

NFT_CTX_OUTPUT_ECHO makes kernel dump the just-added-rule(s) back and
NFT_CTX_OUTPUT_HANDLE tells nft to postfix each line with '# handle %u'.


