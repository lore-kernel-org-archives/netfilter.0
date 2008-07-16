From: "Curtis Wyatt" <zhackwyatt@gmail.com>
Subject: Re: ipq_get_packet returns wrong data_len value
Date: Wed, 16 Jul 2008 11:33:26 -0700
Message-ID: <7915e7b50807161133g14b61423m589dc07f25936bf6@mail.gmail.com>
References: <7915e7b50807151507m3d1ccadfub7cf1882817c72ca@mail.gmail.com>
	 <20080716062424.GB11639@bayen.regit.org>
	 <7915e7b50807160845j3806f5acr392da01f7136f6c8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=/8Rj+JavmPnL8eGPp2yS1K/jwYmcD9V9/TAdP4ENLEs=;
        b=vJIsHjoGOvxYJt8eY8qARug9o+1kdzm9Sk/d5m2qMMLzjRe4JuPwQ1YuhnL2j/VHvs
         jBD4xz3P92TGwiV9xjHOS4QpfLymFjgdJo9eQLjWwmR5iQT85hoYu5QSX/ohWYspaaDA
         Q05Gxt1DjxfNZB3trEiQ7MR2H7d+TgH2nt/4Y=
In-Reply-To: <7915e7b50807160845j3806f5acr392da01f7136f6c8@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>, Curtis Wyatt <zhackwyatt@gmail.com>, netfilter@vger.kernel.org

On Tue, Jul 15, 2008 at 11:24 PM, Eric Leblond <eric@inl.fr> wrote:
> Hello,
>
> Please use libnetfilter_queue. ip_queue is deprecated since at least two
> years.
>
> About your problem :
>        ntohl(671088640) = 40
>
> BR,
> --
> Eric Leblond

Well I thought that did it but I spoke prematurely.  I guess I don't
understand why I need ntohl on one program on the same machine, and
not in another program.  Anyways, the data_len is ok,  but the payload
is wrong.

Thanks again for the help.

-----------------------------
Curtis
http://gocalipso.com
