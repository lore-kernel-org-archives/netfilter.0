From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Question about NFLOG and conntrack glue
Date: Thu, 27 Oct 2016 21:40:30 +0200
Message-ID: <20161027194030.GA1257@salvia>
References: <CABfb+p379t9n_iMK1mwMUA76fkhhr-76Fp=C-QCdmNN9iqFwkA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABfb+p379t9n_iMK1mwMUA76fkhhr-76Fp=C-QCdmNN9iqFwkA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Peeters <richardpeeters45@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Oct 26, 2016 at 08:27:46AM -0700, Richard Peeters wrote:
> Hi,
> 
> I am referring to commit :
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=a29a9a585b2840a205f085a34dfd65c75e86f7c3
> which was pulled in with 4.4, I am running kernel 4.8, and wondering
> how I would be able to access the attached conntrack info in user
> space.
> 
> My application runs in user space and retrieves packets that match a
> specific criteria from iptables using NFLOG, I would like to get
> conntrack information for said packet.
> 
> I use libnetfilter_log but I do not see any API exposed that will give
> me this information, even if I was able to extract information using
> libnfnnetlink apis,
> ( nfnl_get_pointer_to_data(nfad->nfa, NFULA_CT, struct nf_conn);)
> the best I could get in this app would be a struct nf_conn pointer.
> 
> My question is : since struct nf_conn is not exposed to userspace, how
> is one supposed to use the attached information in userspace? It would
> be great to see some example code.

You can apply this patch on top of libnetfilter_log:

https://patchwork.ozlabs.org/patch/530498/

I requested one small change (see thread for details), it would be
great if you could take it, revamp it and resubmit it so I can apply
this. Thanks.
