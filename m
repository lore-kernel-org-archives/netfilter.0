From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: cmd-owner alternative
Date: Sun, 5 Dec 2010 21:56:43 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012052153120.17515@obet.zrqbmnf.qr>
References: <AANLkTikozmxU44ZNfkB91gsrbyM+ysEvPZPvASfJckEV@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikozmxU44ZNfkB91gsrbyM+ysEvPZPvASfJckEV@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alon Bar-Lev <alon.barlev@gmail.com>
Cc: netfilter@vger.kernel.org

On Sunday 2010-12-05 20:37, Alon Bar-Lev wrote:

>Hello,
>
>I see that the cmd-owner was dropped some [long] time ago, I do not
>know the reason, however I need this functionality.

commit 34b4a4a624bafe089107966a6c56d2a1aca026d4
Author: Christoph Hellwig <hch@lst.de>
Date:   Sun Aug 14 17:33:59 2005 -0700

    [NETFILTER]: Remove tasklist_lock abuse in ipt{,6}owner
    
    Rip out cmd/sid/pid matching since its unfixable broken and stands in the
    way of locking changes to tasklist_lock.
    
    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Signed-off-by: Patrick McHardy <kaber@trash.net>
    Signed-off-by: David S. Miller <davem@davemloft.net>


It's a little late to come with "I need this" 5 years after the fact.

>Is there any alternative for this? I mean to set up a static rule that
>assigns specific command-line netfilter acls?

SELinux, SNET, or other LSMs.
