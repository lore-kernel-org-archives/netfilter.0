Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF3A277CA5
	for <netfilter@vger.kernel.org>; Sat, 11 Oct 2025 14:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760191891; cv=none; b=OW+XO1s09Ofsh5/mrDJcHyb1CGvhFT0CgG6JL8gbpl3S7+f4mj5uxFzIcJmSJhQrpXTCWiLEzIiqXK+pW6O3B78BRNGntoRx2mDvx4wAwu4v87VCLIIGVDevFGgyL1Z1D4sZkfD2PYYnyFQTkNd1vncwjn0ei+4JjTBeX/pGbbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760191891; c=relaxed/simple;
	bh=8y4V8AoiazIsM81v1SJZnW1EOmnkaAhZuCUhqWT5TRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqaxFifcClwHhHAvwqQKgJD949AcLfrsRedLDR1ZVRnV6HcpfD8sPGpx38LkDY8GFpAqzK7t6UBCiD6L0Sp0yjT+Ghq7MhIKYxvp3m4TgSKs39P5JgTw7FCZ0NsdI5RbCifW4w8Lsxxy7SIasQhfep2bj/3li54BRl+CrlA/ZZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 2C62560343; Sat, 11 Oct 2025 16:11:27 +0200 (CEST)
Date: Sat, 11 Oct 2025 16:11:26 +0200
From: Florian Westphal <fw@strlen.de>
To: Cyrus <cyrusrereza@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Is there a way to extend the timeout of elements in an nftables
 set?
Message-ID: <aOpljpaGwHZMH-2J@strlen.de>
References: <CAEcyiz83o-NK263Efj5xfGPuVMUqur7TT-RofZ-WkJirMzB9oA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEcyiz83o-NK263Efj5xfGPuVMUqur7TT-RofZ-WkJirMzB9oA@mail.gmail.com>

Cyrus <cyrusrereza@gmail.com> wrote:
> With ipsets, the timeout of an element in a set gets extended each
> time you `ipset add` it. However, that doesn't happen with nftables
> (v1.1.1) sets - when you `nft add` an element, the timeout is set
> initially but never subsequently updated. Is there another way to do
> this that I'm missing?

You can re-add with a new *expires* value:

$ nft add element t s { 1.2.3.4 timeout 2m  }
$ nft "get element t s { 1.2.3.4 }"
table ip t {
        set s {
                type ipv4_addr
                timeout 1m
                elements = { 1.2.3.4 timeout 2m expires 1m53s544ms }
        }
}
nft "add element t s { 1.2.3.4 timeout 2m expires 2m }"
$ nft "get element t s { 1.2.3.4 }"
table ip t {
        set s {
                type ipv4_addr
                timeout 1m
                elements = { 1.2.3.4 timeout 2m expires 1m58s301ms }
        }
}
