From: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Subject: Re: resets received for embryonic SYN_RECV sockets
Date: Fri, 31 Aug 2012 20:16:38 -0700
Message-ID: <CAJygYd1xD4_D=ernHTqoApTbLWseSupRxE6OkfkARBacC_Bdbw@mail.gmail.com>
References: <CANaOhebiw9N1kisgAb2dAUjQFj-s_W_XhJjCDek3_7b8QMScDg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=vH30NAJSYulnhdPS7jY3j5euhtrM/m5KZqJIWTVBrW8=;
        b=EL/cjOks6kv3fZX85hzn1fjwztrCUQOC6HsNolP/kj5V/sa7bH5V7WzDIEKi6UoqBK
         bGmtEg5n/yCHS9uiCcisGrkV0WRj28Y7ZzVR8QQgdqiyzr49I+BwRZZ+knAzYGwyQGNS
         VYjSR/QUQBGiKsihC9XI+SKpvEAU2jLFPuI70TP7HnyOa5iJXMx7KXoT0pQ3lyxf4KLr
         Kdy795q/RALPvV2uLh5BSTrzfEQel96n5BQEg4dz17dhotz1Ztf+2KnbIHn2wDISTT+E
         +bF83RcV56VrTxBFjGgAdyEOfxFrqxg/4mIJB4Y3WyuAfEA4LlOMOPPsfsyYIhC6cY7B
         SGpA==
In-Reply-To: <CANaOhebiw9N1kisgAb2dAUjQFj-s_W_XhJjCDek3_7b8QMScDg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kay <kay.diam@gmail.com>
Cc: netfilter@vger.kernel.org

check  http://lxr.linux.no/linux+v3.5.3/net/ipv4/tcp_minisocks.c#L707

It mean the client sent a RST after it receive a SYN+ACK. Which maybe
just malicious client behavior.

On the other hand, when you look at these counters, you would have to
calcuate either a rate (increase per second or a ratio compare to some
other event). It will tell you whether something is just accumalative
for a long time or something that is happening really really often.

Cheers.

On Fri, Aug 31, 2012 at 2:08 AM, kay <kay.diam@gmail.com> wrote:
>
> Dear community,
>
> I'm new in network stack optimization and I have rather big subj value
> on back end servers:
>
> 2479229 resets received for embryonic SYN_RECV sockets
>
> I've googled for it but didn't find exact explanation of this value.
> How can I catch it using tcpdump and how can I avoid it?
>
> sysctl custom values:
> net.ipv4.tcp_timestamps = 1
> net.ipv4.tcp_window_scaling = 1
> net.ipv4.tcp_fack = 1
> net.ipv4.tcp_sack = 1
> net.ipv4.ip_forward = 0
> net.ipv4.conf.default.rp_filter = 1
> net.ipv4.conf.default.accept_source_route = 0
> net.ipv4.tcp_tw_reuse = 1
> net.ipv4.tcp_tw_recycle = 1
>
> I have attached netstat -s. CentOS 6.2, kvm virtual machine.
>
> P.S. Also I use ipvs + keepalived.
