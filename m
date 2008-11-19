From: "JC Janos" <jcjanos245@gmail.com>
Subject: Re: Xtables-addons 1.6
Date: Tue, 18 Nov 2008 16:20:31 -0800
Message-ID: <7259d7020811181620n1ca06f84oe9d6d1f5f0a680c7@mail.gmail.com>
References: <alpine.LNX.1.10.0811181840170.2316@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=YaPRA2xUhP3qJWVUGh27W9qmvHhO25ckYZxjSqMzJSg=;
        b=U7TiXPWbQYgYc+2HybUTuw8A8ZdWoTwjUAooLM30IeiuCEVxwKfzkuBHi1BU9/gBjx
         lFafu4s4dHXUWZLJnZb6THEHeCjgbgRNd9sHYguaEfyAxm/u240mCsc0YLa6zkC1i09U
         H6Jl+7E5q7TvQXrt3/mRvDUvXAQ0ONKpeBUps=
In-Reply-To: <alpine.LNX.1.10.0811181840170.2316@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Netfilter Developer Mailing List <netfilter-devel@vger.kernel.org>, netfilter@vger.kernel.org

Jan,

On Tue, Nov 18, 2008 at 9:42 AM, Jan Engelhardt <jengelh@medozas.de> wrote:
> which incorporates a newer version of ipset (after the many releases it
> did ;-)

If we already have built & installed the latest ipset from its svn:
repository is it ok to use it instead?

Can the xtables-addons build be informed of a preexisting ipset?
'configure --help' doesn't seem to have an option for it.

Thanks.

--JC
