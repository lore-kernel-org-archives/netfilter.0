From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables element not in set
Date: Fri, 23 Jul 2021 01:03:43 +0200
Message-ID: <20210722230343.GA20406@breakpoint.cc>
References: <323b00e1-e94f-1353-59a5-4ddb1d202861@satchell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <323b00e1-e94f-1353-59a5-4ddb1d202861@satchell.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Satchell <list@satchell.net>
Cc: netfilter@vger.kernel.org

Stephen Satchell <list@satchell.net> wrote:
> As the documentation currently reads, you can use set expressions like this:
> 
>   tcp dport {22,8022} accept
> 
> Is there anything in the nftables syntax that permits detecting the absence
> of a match?  Something like
> 
>   tcp not dport {22,8022}

tcp dport != { 22, 8022 } accept
