Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489F91B3
	for <netfilter@vger.kernel.org>; Thu, 23 Nov 2023 13:33:34 -0800 (PST)
Received: from [78.30.43.141] (port=55776 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1r6HKD-001o81-KP; Thu, 23 Nov 2023 22:33:31 +0100
Date: Thu, 23 Nov 2023 22:33:28 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Kamil =?utf-8?B?Sm/FhGNh?= <kjonca@op.pl>
Cc: netfilter@vger.kernel.org
Subject: Re: nft ends with error
Message-ID: <ZV/FKMPgPA1UVGy0@calendula>
References: <8734wxtz3k.fsf@alfa.kjonca>
 <ZV5sxC/YNUDeFgcE@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZV5sxC/YNUDeFgcE@calendula>
X-Spam-Score: -1.8 (-)

On Wed, Nov 22, 2023 at 10:04:04PM +0100, Pablo Neira Ayuso wrote:
> On Wed, Nov 22, 2023 at 07:35:59PM +0100, Kamil Jońca wrote:
[...]
> > --8<---------------cut here---------------start------------->8---
> > table ip filter {
> > ...
> >         map ipsec_in {
> >                 typeof ipsec in reqid . iif : verdict
> >                 flags interval
> >         }
> > ...
> > 
> >   chain INPUT {
> >         type filter hook input priority 0; policy drop
> >         ...
> >         ipsec in reqid . iif vmap @ipsec_in
> >         ...
> >     }
> > ...
> > }
> > --8<---------------cut here---------------end--------------->8---
> > 
> > rules seems to be loaded entirely and works.
> 
> Thanks for this reproducer. Proposed fix:
> 
> https://patchwork.ozlabs.org/project/netfilter-devel/patch/20231122210106.183932-1-pablo@netfilter.org/

For the record:

https://git.netfilter.org/nftables/commit/?id=faa6908fad6053ae9549c45b88d0402cc69cf1ed
