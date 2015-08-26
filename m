From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: ipset memory usage
Date: Wed, 26 Aug 2015 11:38:47 +0530
Message-ID: <CAA5aLPiOw7LT0xsnW7FQ2ZiFR-4oqF4Ljn9hPreLVqb3oxjLag@mail.gmail.com>
References: <CAA5aLPgxW=-hJcBLxagCKTgX26mHg9XAmsr-UVoS3s0n50oEDA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=Y30vcbr4sLFi0gjypTXcAuJJoIr9NOgougKjqIbY0D4=;
        b=KNMD2WikVJfbmyU/GTVQjo84blysa22Sb76uWapfebwq6OpIyeYA+6Po6vmfgx2Nyg
         JGndRb8p8KPdexEdORoh+tCFyzpEsa4Kl+iR8JoJ/xFgHBToZ0F6UDP9RYnqlArcQI2o
         X5oQuQrq6bHW93EIi9CRcwHxKFmYJvEkDwfh9H/9OCceIrnCMGOrAqkIQ7+4sulCKOUI
         5bacSeccwRtH4o0Mdrw4QLSkM6w5URmK6emQa1Rijq9Tfr/Z9vX8iwBEvTq+/PmAblHZ
         lePLTtnFTYIG/OeYcAIFt1ioMfJlxeSFHEODgD1S313StwYpWUUCaCdJX6B9leK9RN7k
         fYzA==
In-Reply-To: <CAA5aLPgxW=-hJcBLxagCKTgX26mHg9XAmsr-UVoS3s0n50oEDA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Anybody?

On Tue, Aug 25, 2015 at 5:35 PM, Akshat Kakkar <akshat.1984@gmail.com> wrote:
> As per info in http://lists.netfilter.org/pipermail/netfilter/2005-September/062859.html,
> ipset of iphash of 20Million IPs, takes around only 80MB. I understand
> that this might be simply multiplication of 20Million with 4 bytes
> which IP takes if stored normally.
>
> But when I try to replicate this I am getting size in memory as
> 506,481,176 (around 483MB) for number of entries 16,581,375.
>
> This comes to around 30Bytes per IP.
>
> I have got this values from ipset -L command
>
> Is this much size anticipated?
