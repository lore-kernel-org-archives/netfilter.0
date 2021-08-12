From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables - quota isn't working?
Date: Thu, 12 Aug 2021 16:20:35 +0200
Message-ID: <20210812142035.GC607@breakpoint.cc>
References: <1279582625.93.1628773294634.JavaMail.zimbra@contatogs.com.br>
 <165409782.214.1628777455555.JavaMail.zimbra@contatogs.com.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <165409782.214.1628777455555.JavaMail.zimbra@contatogs.com.br>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pauloric@contatogs.com.br
Cc: netfilter <netfilter@vger.kernel.org>

pauloric@contatogs.com.br <pauloric@contatogs.com.br> wrote:
> I think that I find the 'error'.
> 
> Quota follows same rules that limit?
>
> https://wiki.nftables.org/wiki-nftables/index.php/Rate_limiting_matchings

Yes, they do not 'drop' packets when the quota expires, it just stops
matching (or starts matching, depending wheter its 'until' or 'over'
mode).
