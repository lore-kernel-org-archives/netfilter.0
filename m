From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Loopback security...
Date: Fri, 25 Apr 2008 15:00:10 -0500
Message-ID: <4812384A.2040309@riverviewtech.net>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br> <480DF156.5060801@riverviewtech.net> <480E0CA2.2030902@plouf.fr.eu.org> <480E3FE9.8070008@riverviewtech.net> <480F14C3.3010403@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480F14C3.3010403@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 4/23/2008 5:51 AM, Pascal Hambourg wrote:
> Ah, I see what this is all about. The problem is not the loopback 
> interface, it is the loopback address range 127.0.0.0/8. Some RFC states 
> that "127.0.0.0/8 must not be used outside a host", so the routing code 
> in the Linux kernel discards packets with a source or destination 
> address in this range which are sent or received through a non loopback 
> interface.

Ok.  That very clearly explains why I was seeing what I was seeing. 
Thank you.  It also explains that little (if any thing) will get around 
this with the kernel behaving the way that it is.

<snip>

*nod* (to all)

> What behaviour ? Discarding traffic to or from 127.0.0.0./8 on a non 
> loopback interface ? I guess there have been some patches.

Interesting.



Grant. . . .
