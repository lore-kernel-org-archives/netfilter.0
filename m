Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A93A37163
	for <netfilter@vger.kernel.org>; Tue,  9 Jan 2024 11:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.41.52] (port=57246 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1rNAdX-001XWx-Fv; Tue, 09 Jan 2024 12:51:17 +0100
Date: Tue, 9 Jan 2024 12:51:14 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Aurel Wisse <nf@awisse.ca>
Cc: netfilter@vger.kernel.org
Subject: Re: Question about the man page
Message-ID: <ZZ0zMpQiT9SVR0+E@calendula>
References: <UG0Z5S.ENR86OM60VRI2@awisse.ca>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <UG0Z5S.ENR86OM60VRI2@awisse.ca>
X-Spam-Score: -1.9 (-)

On Wed, Dec 20, 2023 at 10:02:54AM -0500, Aurel Wisse wrote:
> Hello,
> 
> I am studying the man page in order to learn the syntax of nftables.
> I have a question about the sections ICMPV6 TYPE TYPE and ICMPVX CODE TYPE.
> 
> The keyword for ICMPV6 TYPE TYPE is `icmpx_code`
> The keyword for ICMPVX CODE TYPE is `icmpv6_type`.
> 
> Is this correct?

Fix:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20240109114834.156400-1-pablo@netfilter.org/

Thanks for reporting.
