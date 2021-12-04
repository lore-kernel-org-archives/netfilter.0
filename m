From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Meaning of "." (dot) in netfilter
Date: Sat, 4 Dec 2021 18:45:43 +1100
Message-ID: <YascpztWuzJgKRgq@slk1.local.net>
References: <CAK3NTRAQE7UD9_0EuzyS0UGQ_s++Dg_hbZPXscHBrStnGJHGjw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:date:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=WzYbQixtEx0KS/ZlBu83PT1ZVIAaCCusOpVsAtnAPp4=;
        b=XODDrs75y6Mt1shO8VbPrsuiMWdQfGi58SsoDAoSoKh1v61969XcmnTCzIXl7Li8wy
         k09QRbzqqyBy7joRE/+ngQ7Mfj3TKCBjHSythyTeimVbF/j1/nosPQbAAmRfIF078Yy8
         4jwu2iG08+EQRFIgOcunEFLXGZWDzQi+Fi2BkFF0097OKcG0dGRBzSt6Y9ZtIkLZP6IW
         gQRYdrnYthF0tPyTU1+QXViC8Pq0JRDUoyqJkxBKUpYZIMrqxbZn51PYm0904CyJtnvs
         w+6vU1zgQ2zqppvliRWbV0ScAUjvtlzjeuVKX/DXQExE4CUsYSEv58Ieu+SFeR9I+txF
         diFA==
Sender: Duncan Roe <duncan.roe2@gmail.com>
Content-Disposition: inline
In-Reply-To: <CAK3NTRAQE7UD9_0EuzyS0UGQ_s++Dg_hbZPXscHBrStnGJHGjw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Netfilter Development <netfilter-devel@vger.kernel.org>

Hi Ross,

On Fri, Dec 03, 2021 at 10:33:55PM -0800, Ross Boylan wrote:
> https://wiki.nftables.org/wiki-nftables/index.php/Simple_ruleset_for_a_home_router
> include a number of rules like
>
>         ip protocol . th dport vmap { tcp . 22 : accept, udp . 53 :
> accept, tcp . 53 : accept, udp . 67 : accept}
> with possibly 2 different uses of ".", namely 'ip protocol .'  and 'udp . 67'.
> What do those "."'s mean?
>
> I've looked in available documentation, but can't tell.
>
> Thanks.
> Ross Boylan

"." is the symbol for concatenation. It's been missing from the man page
forever.

I was going to submit a patch to add "." but wasn't really sure when you could
use it so I never did.

The rule defines a Verdict Map (vmap) whose elements are a concatenation of ip
protocol and Transport Header (th) Destination Port (dport). Accept tcp.ssh,
udp.domain, tcp.domain and udp.bootps (udp & tcp are IP protocols).

Post back if I didn't explain well enough.

cc: netfilter-devel in the hope someone could update the man page.

Cheers ... Duncan.
