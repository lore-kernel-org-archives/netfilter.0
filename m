From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack -F not flushing the table
Date: Thu, 07 Jan 2010 13:42:53 +0100
Message-ID: <4B45D6CD.4090903@netfilter.org>
References: <201001062301.37395.elison.niven@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201001062301.37395.elison.niven@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Elison Niven <elison.niven@gmail.com>
Cc: netfilter@vger.kernel.org

Elison Niven wrote:
> Hi List,
> 
> I am running linux on an embedded powerpc board on which conntrack -F does not 
> seem to flush the entries as seen below:
> 
> # conntrack -C
> 2000
> 
> # # command to flush 
> # conntrack -F
> 
> #conntrack -C
> 2000
> 
> I am able to delete single conntrack entries using conntrack -D but conntrack 
> -F does not work.
> 
> Any ideas on what could be possibly wrong, Am running linux-2.6.22 with all 
> conntrack modules built in the kernel.

Could you post the result of `strace conntrack -F'?
