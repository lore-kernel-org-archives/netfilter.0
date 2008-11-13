From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: INVALID state
Date: Thu, 13 Nov 2008 14:08:08 +0100
Message-ID: <200811131408.08590.christoph.paasch@gmail.com>
References: <491b53e3.2a528c0a.1c10.385b@mx.google.com> <200811131316.57097.christoph.paasch@gmail.com> <1226580485.19007.38.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=RGNJKo2FMta3JlCTOuoVNf6kY9bca0PnSn2vUOLuQrQ=;
        b=ujm7VaJQBiZahHttwVQzP+JfQJyX/ZxGpXeC8G9tuYrB+cUnyVkpLm3C9/zEiTgHno
         o7qCAvHAWiftAZlrJSuofdPa1w3RxPJGJ3O0VKqOOoRdl8mN8KkurBxrptwbb2cXOYEK
         /jbpcBztmhIHFW0uSyf+EpUTHughayea5Cycc=
In-Reply-To: <1226580485.19007.38.camel@enterprise.ims-firmen.de>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: Gilad Benjamini <gilad.benjamini@gmail.com>, netfilter@vger.kernel.org

Hi,

thanks for the fast answer...

On Thu November 13 2008, Thomas Jacob wrote:
> For ICMP packets, I think icmp_new in nf_conntrack_proto_icmp.c doesn't
> allow an echo request for the creation of a new conntrack, but I'm not
> so sure.
That's true, it checks, if the type of the ICMP is one of valid_new 
(containing ECHO, TIMESTAMP, INFO_REQUEST and ADDRESS)

--
Christoph Paasch

www.rollerbulls.be
--
