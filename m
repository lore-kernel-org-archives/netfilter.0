From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: OK, IPv4 vs IPv6 is driving me crazy
Date: Fri, 23 Jul 2021 18:04:22 +0200
Message-ID: <20210723160422.GA18109@salvia>
References: <957e7c3e-1494-1688-8074-d0ae68716a29@satchell.net>
 <1146d9a1-418f-baaf-3a11-e89ba6779f90@satchell.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1146d9a1-418f-baaf-3a11-e89ba6779f90@satchell.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Satchell <list@satchell.net>
Cc: netfilter@vger.kernel.org

On Fri, Jul 23, 2021 at 09:01:16AM -0700, Stephen Satchell wrote:
> OK, I think I've answered my own question, at least in part.  Thank GHU for
> virtual machines.  I found an ip6tables.sh, ran it through the process of
> conversion, loaded the result, and did nft list ruleset and save that
> output.  I now have a reference, and the nft translation.

There is also iptables-translate that you can use to obtain a
translation.
