From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: testing if a named set exists?
Date: Sat, 2 Oct 2021 12:52:45 +1000
Message-ID: <YVfJfRVCARWtZVCI@slk1.local.net>
References: <CAOLfK3UBEvRg8AQbLibVo9xp6tZjaE7_S1+uDyhhbR7Nj_eYhA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:date:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=1+A9UkOiSDNJd/dyEjBAyB3ATBU7Is6mwIUxcQxkwkA=;
        b=RsJPFDOr2cPjiEaF1Yxac4QuNOFAEStxG7a3NSzybjArSXyhRHvOHEG0z+vESi6jZX
         YAEkL9a9miRjiYGwL+KuQmK8HG+ob2fn8CgJXcQcvNpnBQd7aGt+ZCkze7e3SCfQpnHx
         mdeAXn0h5HZc9ytzfXxpyO9yACwx6yXhagv2dLbg1QXC9nPKkuOdMeTgG+sphfyJBmVj
         VqdufaEJXFmtt0yfzPmtUV52v3eGp1J+mv6z0REDTXikc/XnXPsY2vp0d3pMUmPiYUhz
         Jn6Y6jKw64Ix65MliAnLdQ8WFQ7LB3i3WpgxGjkqePnsUd5F8O7TAn3zVkSfkaxWAt0P
         gFdw==
Sender: Duncan Roe <duncan.roe2@gmail.com>
Content-Disposition: inline
In-Reply-To: <CAOLfK3UBEvRg8AQbLibVo9xp6tZjaE7_S1+uDyhhbR7Nj_eYhA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: Netfilter <netfilter@vger.kernel.org>

On Fri, Oct 01, 2021 at 08:16:17PM -0500, Matt Zagrabelny wrote:
> Hello,
>
> I'd like to do something like the following:
>
> if exists $named_set
>     nft add rule ip filter output ip daddr $named_set accept
> else
>     nft add rule ip filter output ip daddr $default_set accept
>
> Does anyone know if I can accomplish this with nftables?
>
> Thanks,
>
> -m
How about

> if nft list ruleset | grep -q "$named_set"; then
>   nft add rule ip filter output ip daddr $named_set accept
> else
>   nft add rule ip filter output ip daddr $default_set accept
> fi

You can restrict the search to a table, e.g. instead of "ruleset"
put "table $my_table"

Cheers ... Duncan.
