Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AA11B4127
	for <netfilter@vger.kernel.org>; Mon, 23 Dec 2024 16:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734970510; cv=none; b=gR98sAWW3aW3t2WRYlE3ig8sW6y6DSRBVBur2KQ+/dlkqOu7AGTBGNkJ8WNe+xB78XVDuexNLGqZPb1f77A0Oe8lTbWdh5qFU/JJRZ8JvYAi+S/6g9c65uTh6FEWS8fdFXLU5J5ivBnKgW6ie0Hc/XXKZmQ3+6vGmDZFCYhzyH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734970510; c=relaxed/simple;
	bh=ozPOxB1FlBrR5QoJt8/+hqHqboRj5zw9sSBm6MqCo6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MIdintZChGwkoNT3Cd6DEynJwtBa1Y41rbCv+MC+HbAnzKh0ubKYELplOsIeaCpnUoMH193q66/KyTo1TZIWZydohvYOhnUlxxBZ0xd0qOLh6R4/sJQvOEMRQGeUCEsqj7JdWt3CQ3tBSDx5MwWirOM+dsJDljaxn0TY2XzbVUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tPl5F-0003SQ-VS; Mon, 23 Dec 2024 17:15:05 +0100
Date: Mon, 23 Dec 2024 17:15:05 +0100
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Subject: Re: nftables portmap map
Message-ID: <20241223161505.GA12569@breakpoint.cc>
References: <CABhP=tZtzqX8vfL5zdqxx6sdZWT56iWAhW35-=U8Z16HZBs-ug@mail.gmail.com>
 <20241223125151.GA7005@breakpoint.cc>
 <CABhP=tbjB4H1NXxC+_xJFM0pGby3YX_V9PP-XqLVMr3xZUpQwg@mail.gmail.com>
 <CABhP=tbWy7tQh1XKGAsQqQ5LzaUbrwz7iGvFaK_iEpP9LMH0kQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=tbWy7tQh1XKGAsQqQ5LzaUbrwz7iGvFaK_iEpP9LMH0kQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> l4proto . th dport map @hostport-map-v6
> Error: transport protocol mapping is only valid after transport protocol match
> add rule inet cni-kindnet prerouting dnat ip6 to ip6 daddr . meta
> l4proto . th dport map @hostport-map-v6
>                                      ~~~~
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Looks like a bug, fixed in nft 1.1.1
