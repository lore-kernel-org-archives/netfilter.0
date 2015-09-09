From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: ulog dropping packets when rate is 4000 packets/sec or more
Date: Wed, 9 Sep 2015 11:57:21 +0530
Message-ID: <CAA5aLPijmeBmgU_AznRJfRK3OHfgwFY-T8XiWz-1r19QFOALnQ@mail.gmail.com>
References: <CAA5aLPhF4QYbneoceDP+h-5sNretjodn2oHbNTzqa5PzN8nW_A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=UdSQe5/cSsHwjAvzxNZeob56l3MjtO0z3tlmgHOmnlY=;
        b=pCMF8D+TTSiR90fvjNq+Ck8EPnFTIfHx50vK9SYa7WOhVlVk/GzGwq3JBWTkrX9Yw7
         08lxrQ/E4NQWQ1lEmFdt3ohLVWqGzhwdSifT5wSsQ26893fErD/3br+/es7D62U30Cqy
         q7wCMVvXBaXiC4K8/v9pIurOzc3a/lcpGdpuT28/KZOXqK51GExujPLQkYCPUzcH4GC2
         YecqLQhrJL+YJhbuuL+bHdeQtqMr7qob3mhTKXpbdH5fD2C5qkrI97TvpDORvn9a+RV2
         62m+UHsjsdwM68dBuB1imfnzYE5GebZmU0uOVI8gCd9Swq/nnswQTSiYi2voTN83JY9x
         jMmw==
In-Reply-To: <CAA5aLPhF4QYbneoceDP+h-5sNretjodn2oHbNTzqa5PzN8nW_A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Mon, Sep 7, 2015 at 5:45 PM, Akshat Kakkar <akshat.1984@gmail.com> wrote:
> Hi!
>
> I am using JSON plugin of ULOG to log iptables traffic. When the input
> rate  is arond 4000 packets/sec, ulog is not logging all the packets.
> At 4000 pkts/sec, it drops around 0.1 % of pkts.
> At 5000 pkts/sec, it drops around 2.4% of pkts.
> At 6000 pkts/sec, it drops around 3.67% of pkts.
> At 15000 pkts/sec, it drops around 16.7% of pkts.
>
> Is this expected? or am I missing something.

Anybody? Regit?
