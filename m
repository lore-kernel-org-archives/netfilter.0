From: Vieri Di Paola <vieridipaola@gmail.com>
Subject: Re: NFQUEUE/iptables and kernel warning messages for net/ipv4/tcp_output.c
Date: Wed, 19 Feb 2020 20:37:47 +0100
Message-ID: <CABLYT9iGmGJCmaJn5epgtGr+35Z3CMECut=dHjBcKBe5OkeqDQ@mail.gmail.com>
References: <CABLYT9gNPFh7RpwE8P3uZyLKBM-_6ctpg7_8BPo4iCN3PWMQOQ@mail.gmail.com>
 <20200218123958.GJ19559@breakpoint.cc> <CABLYT9j6a+QT=7BdeSbJY2AnbHhKz72OQTJ8x5nL6_4TBeZT3Q@mail.gmail.com>
 <20200218132107.GK19559@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dLaLtKWOAc+qpJz5+RVqWLirVZRppQnKvncg5gvNTrY=;
        b=LSp7opfLOb6IOukw8tLt4VVZS1ux0hoYtGZRUB47sPkQVPXb3wQKh5RMGgf8wutJZC
         kH7EzFIZHQTHhEPgnK0plki2iSq8Unr65YQeBqalqI2rV9GyKAUkVxxyZyAX6PuIf2SI
         HgW2873DtlxQDAc2q+uMwyLecARL3Zq2YDyOF48KAWf6i2VeNSbreAwsxwOyLWqIKzCS
         Zuh9jqGvjAoIljCugcb0kMm8LaPb+24UQtI/gp9w4dKshKfpZRn8KwuGDoz6XxF2K7UJ
         ZlOLNMXJDirlev6lpT47j60d7nBUC0GjQXLiEy+B0/UhabBF/VQV9wXPEN2fTIHONtjd
         tnzw==
In-Reply-To: <20200218132107.GK19559@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

On Tue, Feb 18, 2020 at 2:21 PM Florian Westphal <fw@strlen.de> wrote:
>
>
> This means your kernel headers are older than 3.10.
> It should be part of /usr/include/linux/netfilter/nfnetlink_queue.h .

Actually I have 4.19. I also had to define another constant.
In any case, it compiled OK, and the problem was not seen again for a
test period of at least 15 hours (I usually had several of these
kernel warnings almost each hour, so 15 hours in a weekday is
significant).
I then removed your patch, recompiled and ran suricata in nfq "accept"
mode (default). It was set as "repeat mode" before. It hasn't been
running long enough yet (7 hours), but for now I haven't seen any
kernel warnings in "accept mode".

So all I can say for now is that it seems I'm getting these kernel
warnings when using Suricata in nfq repeat mode.

I'll ask the Suricata ML what they think about that.

Thanks,

Vieri
