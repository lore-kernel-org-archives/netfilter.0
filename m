From: Andrey Wagin <avagin@gmail.com>
Subject: Re: [PATCH] netfilter: nf_conntrack: fix RCU race in
 nf_conntrack_find_get (v3)
Date: Tue, 14 Jan 2014 15:10:50 +0400
Message-ID: <CANaxB-zSkmVy+TBCa0CyReiSgubBUmyz6iUp8bxByOr7Jb9oGw@mail.gmail.com>
References: <1389188841.26646.87.camel@edumazet-glaptop2.roam.corp.google.com>
	<1389549033-23523-1-git-send-email-avagin@openvz.org>
	<1389558074.31367.187.camel@edumazet-glaptop2.roam.corp.google.com>
	<20140114105147.GA14538@paralelels.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=AqAFeATP6Q8FljZjYpHLwO3jOJsfZlRoVkkBXOCmrX0=;
        b=XF5jR8/JwKtnTq1rq7LnNHbNKQLgRMumP+MnZJNZ3tMKuA9bZvYGbSkgPthP2xI4bX
         enqT1LbUwxkQoeluQKTr0xAcKnD7plfaWkN0mEZrUDwzJSX/r9C0AWNCVsj4BN2O5LTa
         qV3zpRebWchJf5pb6ObsnY5QLVvYUDHSCDNnsxY1O77wJct/yM7j7LMD16NNJhVUHwKB
         FG4uBJcEM1zy3IjV527jOemvEhx/4aM32kZnXBLXLu9P3p3SoUYE/qDhOp1tplw3z3i8
         N19ZJb83Vqssld9jPUOu3CWsfR6QsdLeJLDLWtCb1oPJft7v21KwKEEYggc8WpcamQN0
         dT5g==
In-Reply-To: <20140114105147.GA14538@paralelels.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Vagin <avagin@parallels.com>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, vvs@openvz.org, Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, Cyrill Gorcunov <gorcunov@openvz.org>

>
> Eh, looks like this path is incomplete too:(
>
> I think we can't set a reference counter for objects which is allocated
> from a SLAB_DESTROY_BY_RCU cache. Look at the following backtrace.
>
> cpu1                                    cpu2
> ct = ____nf_conntrack_find()
>                                         destroy_conntrack
> atomic_inc_not_zero(ct)

ct->ct_general.use is zero after destroy_conntrack(). Sorry for the noise.
