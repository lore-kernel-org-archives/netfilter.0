From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: How to get rule handle when adding a rule using libnftnl?
Date: Thu, 1 Feb 2018 19:20:37 +0100
Message-ID: <20180201182037.recv7u3ava6ohmc2@salvia>
References: <CADB9fJF-rpjBo=DXeO7sxeH-9U4y5LytGWba5nUG_xfPkar-qg@mail.gmail.com>
 <20180201170614.7aiziqewvivb5eqw@salvia>
 <CADB9fJGJfSDpoz+DCTXjfw9+ZoTD2Sm27rWx7_Pbi6q-YMVyVQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADB9fJGJfSDpoz+DCTXjfw9+ZoTD2Sm27rWx7_Pbi6q-YMVyVQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Grunt <gruntblue@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, Feb 01, 2018 at 09:17:17PM +0300, Eric Grunt wrote:
> Thank you for your prompt answer -
> I will try this, just need to do some more research about how to
> access the kernel's response.

Similar to what we do in examples/nft-rule-get.c, but do *not* set the
NLM_F_DUMP flag, since that is only useful to request listings.
