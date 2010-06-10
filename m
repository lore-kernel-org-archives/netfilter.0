From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH libnetfilter_queue 1/3] Non-modified payload arguments
 are pointer-to-const.
Date: Thu, 10 Jun 2010 15:06:00 +0200
Message-ID: <4C10E338.1060406@netfilter.org>
References: <1275720020-14058-1-git-send-email-netfilter@meta-dynamic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1275720020-14058-1-git-send-email-netfilter@meta-dynamic.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Favro <netfilter@meta-dynamic.com>
Cc: netfilter@vger.kernel.org

David Favro wrote:
> The payload parameters to nfq_set_verdict(), nfq_set_verdict2(), and
> nfq_set_verdict_mark() are not modified by those functions, and
> therefore should have datatype pointer-to-const.  This both causes the
> source-code to more effectively represent what is the purpose of the
> parameter, and eliminates the need to cast away const-ness when calling
> the functions with compilers that enforce strict casting.  All existing
> calling code should not need modification as pointer-to-X automatically
> converts to pointer-to-const-X.

This doesn't seem to break ABI so I'm fine with them. Applied, thanks David.
