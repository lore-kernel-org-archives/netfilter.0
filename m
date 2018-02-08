From: Rob Thomas <xrobau@gmail.com>
Subject: Re: linux martian packets
Date: Thu, 8 Feb 2018 16:44:48 +1000
Message-ID: <CAC5zRjMcKGLvQDtc63mbYi_JNak=uThjUV9hNgVfOs+jXsoUFQ@mail.gmail.com>
References: <62fbf8b2-9536-6bf4-9fb1-825307d29262@bluemarble.net> <20180207230211.GA2303@dimstar.local.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=v+MuOqEaSLqGnDy7fu+0+vNdGj0ePYOAQMcHLDUS0o4=;
        b=XcEHC7RyR04nm4AkRNKYmOOKbtiq9bd1RK88W8ZMhfEnHWiulIBSD9awa3mFrCUdMj
         55dL2xh1rTUopMb1SfXGdUdqy9F0zR0xG/B+5/VOITRaZRGQjjYJe29sI5d179YtPhiY
         vSbsDJsjbPuraMOlWukT3RIEkhsxZ5jdcICt34aNs4W25161zyoWcj9wzPUD3k/AgKbz
         8EE5bsnScLyY6qnhj9QdtjLs4nTrlOK7PAeC1wh74322peLYSPm/pafYnLPHvA3kyuyw
         rBgJe6t40uhUR/lI6hJ/SFmHjgpg+SKLZw0sNU69wGL6J7w5vef696PLzkLOVG3Sgm4C
         cW/Q==
In-Reply-To: <20180207230211.GA2303@dimstar.local.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> Yes indeed - tcpdump gets in before any of the iptables rules so you will see
> incoming packets that are subsequently dropped.
>
> You must have an iptables rule that is dropping them, so I suggest to use watch
> of iptables -L to see which rule increments its counter when you ping from 10.9.

It's also possible that the kernel route-path filter is dropping the
traffic if it's coming in the 'wrong' intreface.

You can check /proc/sys/net/ipv4/conf/*/rp_filter and set it to 0 and
see if that fixes it.

--Rob
