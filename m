Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F10265CB5
	for <netfilter@vger.kernel.org>; Mon, 21 Apr 2025 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745242055; cv=none; b=NLpXBq+1AJFqYTJNDx3jLpFCfKz+AR+thJ/gI0+2N4+CkLUxmhYST5pvZfVBiGdQQ2Il/krgUXsrl1t6Jn6YAwX6n0YuWTU7xMWGaUD8wFSo+XRyGqGYgF9OzKZjKjuSkJmbg00kbMpZFzl+m8z4lonDvtQmOgkeUTZR2vjeKhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745242055; c=relaxed/simple;
	bh=ABhlaI/kacxou6DGmNkJQKw1dqgyDRmtOZy82wSmHgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1vB8MIkgww930A/wiRGdWaFGamv+cWSgPgBeUr9CwDIVAVMtBamsDcNVSKVBHM3QjhIvKyGxXs6ZyubTRTf1zyXrisrDCPbhdTtdjdcIEV3XeDx9hgVUvwsKnRt9ibyXHrauWvU5B/gOphwEcU7OcyQHuFR7KMqkPQJ6HTCWFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1u6rB8-0001nv-CE; Mon, 21 Apr 2025 15:27:18 +0200
Date: Mon, 21 Apr 2025 15:27:18 +0200
From: Florian Westphal <fw@strlen.de>
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Sunny73Cr <Sunny73Cr@protonmail.com>, netfilter@vger.kernel.org
Subject: Re: How to Achieve Functionality Equivalent to iptables -m owner
 --socket-exist in nft?
Message-ID: <20250421132718.GA6623@breakpoint.cc>
References: <CAC1kPDOzuhA9T2PDrYX8c9833B3QY7ECYDaXKE4zbkyc1FfX1w@mail.gmail.com>
 <9bsxFpl1jZK-Q-1fvltsQ9TIJQbKJLLZ2BOKaF1HF8AAaaczi4Nazmyc_joMqUNu_Gbnii28h2OAIrFKNJyfOXU-C6si-ocGfhl9nabaQrM=@protonmail.com>
 <CAC1kPDPkQXWENzPeCRjmNO1cOFOD90RzPSCEPq-0cNQnfrPx+g@mail.gmail.com>
 <weuaFW4cJd3LV86Dm_XEPqzgsdQlndvgmC3sLnNg4KEH6kM_9IuaVzS3EItenqX_y5N0Ke8Q-eVuv8_oQUYikrH1u9XUyF3ZUploTxzY7OI=@protonmail.com>
 <CAC1kPDNdUO-v5UEJYZgtOL1iZTBBxteUdfaGDAAgVQNEzcoWYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC1kPDNdUO-v5UEJYZgtOL1iZTBBxteUdfaGDAAgVQNEzcoWYQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Chen Linxuan <chenlinxuan@uniontech.com> wrote:
> Is the --socket-exist feature missing in nftable?

meta skuid >= 0
