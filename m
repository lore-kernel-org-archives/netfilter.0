From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnetfilter_conntrack callbacks and nfct_destroy
Date: Tue, 03 Aug 2010 15:19:48 +0200
Message-ID: <4C581774.6050800@netfilter.org>
References: <1280816654.1349.643.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1280816654.1349.643.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On 03/08/10 08:24, Andrew Beverley wrote:
> I have 2 questions regarding libnetfilter_conntrack please:
> 
> - When using nfct_callback_register() and then nfct_query(), is the
> callback that is subsequently generated a synchronous callback? (It
> appears to be, I'd just like positive confirmation).

The callback is invoked if we succesfully receive the reply message from
the ctnetlink subsystem.

> - Should nfct_destroy() be called after each use of nfct_new() to
> prevent memory leaks? I assume that the answer is yes, but only one of
> the examples in the source code use it.

Yes, nfct_new() requires nfct_destroy() afterwards in order to avoid
memory leaks.
