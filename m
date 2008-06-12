From: Patrick McHardy <kaber@trash.net>
Subject: Re: conntrackd [ERROR] commit: Invalid argument
Date: Thu, 12 Jun 2008 17:04:06 +0200
Message-ID: <48513AE6.5080808@trash.net>
References: <e1aa27e00806090621r3fa83ac0s7bb89d903de3be41@mail.gmail.com> <200806111545.18856.sabelka@iue.tuwien.ac.at> <484FFCA2.1090500@netfilter.org> <200806111915.32313.sabelka@iue.tuwien.ac.at> <48513A30.1020908@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <48513A30.1020908@netfilter.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Rainer Sabelka <sabelka@iue.tuwien.ac.at>, Marco Barbero <marco.barbero@gmail.com>, netfilter@vger.kernel.org, Netfilter Development Mailinglist <netfilter-devel@vger.kernel.org>

Pablo Neira Ayuso wrote:
> Rainer Sabelka wrote:
>>
>> This is a vitual machine (i686) which 128 MByte of memory running 
>> under VMware server 1.0.4.
> 
> Would you try this patch?
> 
 > [PATCH] add allocation flag to nf_conntrack_alloc

Even if it doesn't help in this case, it makes sense, so if you
don't mind I'll queue it for 2.6.27.
