From: "Billy Crook" <billycrook@gmail.com>
Subject: Re: IP gets lost during redirection
Date: Thu, 14 Aug 2008 17:43:26 -0500
Message-ID: <a43edf1b0808141543m7002b43le09b7dfe93d0fd72@mail.gmail.com>
References: <g82aqt$kes$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=BcOZ9bzpvW6W/JikX+1cgmWoQ459x1ZvbsBm7k6HobU=;
        b=OD1owwwc/7Q/Ss2ruc2gQGXCtfVIP+qpqwYTBWFlEmzxJbzgDnkycTa7ys+H4whGFW
         8Z8xe3sZWMqjeQSL2BHiqsnsU8WX2l2xlESSCTVJSRfZgF8iTLgfb+wmf0sIpoA7a86O
         Xto5dssTDqolq4LCAElqZWZphr8GZ5bufqoBY=
In-Reply-To: <g82aqt$kes$1@ger.gmane.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Smith <ml375mail-pof@yahoo.de>
Cc: netfilter@vger.kernel.org

How is the first machine "redirecting"?

The most simple solution is to configure the 'different machine's to
use the first machine as their default gateway, then use masquerading
on the first machine.  If you can not use the first machine as the
default gateway of the 'different machine's then what you want is not
possible.

On Thu, Aug 14, 2008 at 17:15, John Smith <ml375mail-pof@yahoo.de> wrote:
> Hi,
>
> I got a server (first machine) which is reachable via the internet.
> Depending on kind of Request (HTTP, FTP...) it redirects internally to a
> different machine. This machine (second machine) is running apache2 for
> example. Everthing works fine.
> Yet the apache logs on the second machine always list the redirecting
> machine (first machine) as the requesting adress/ip and not the ip adress
> of the requesting client from the internet.
>
> How can I fix this? I'm sorry to be so unspecific about the configuration
> of iptables on the redirecting machine, but this is all I know about it.
> However I can get more information if it is needed for the solution and
> you can exactly say what you need.
>
> Greets, John
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
