From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: nft named set address types
Date: Tue, 2 Nov 2021 14:39:33 -0500
Message-ID: <CAOLfK3XW28kgrBGpQvi9eO3h2oQD80kU6tqz0obgSfvkgbF5-A@mail.gmail.com>
References: <CAOLfK3UFmzPfaqZbB5z6kvRuvpmHrFptbf1_LLBfJdPPzVHwqQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4HkKwx2CRFz9vlkW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=J73FLgQbRO++vYkXCDC1q1E4TpKM2kORVkay2ccvcNc=;
        b=a2KuFWQQItWKvR5BWCA1bQLktFnL3agzL/d0ypmvi97ZDQQ/QnKcF1WToHvKT2WsEa
         bTCk6Uifv81d44opLwaQ2Z8zrzfW3d8L1UIYmJTLCiaW1hcn8Dt8nSoSsFzUw1Vi3Njp
         Bxoxm4nlbBNCQTa6z+z6Z6FbddO9jfK03dvfvI76UFajMfxgezgsVZWP5TeU15vBDVd5
         bbGUukpUvVcWMyp9uSEAbWCZrPi7ZBthBHDX9CW72ay1kYWFfJV+UJ9V1m23llLnyxRu
         5uz9ny+YRXXnz7Rpj8VoE/PcqTpIxd3uU5oKSI0h7sL5C+2z6QgAleGpyMVCdyxtqJy7
         G7sg==
In-Reply-To: <CAOLfK3UFmzPfaqZbB5z6kvRuvpmHrFptbf1_LLBfJdPPzVHwqQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Replying to myself...

On Mon, Nov 1, 2021 at 3:46 PM Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
>
> Hello,
>
> I'd like to use the "inet" address family in a named set. I see nft
> supports the following address families [AF] (among others):
>
>        ip       IPv4 address family.
>
>        ip6      IPv6 address family.
>
>        inet     Internet (IPv4/IPv6) address
>                 family.


I'm not sure nftables even would allow an "inet" to be used in a rule such as:

table inet filter {
    chain input {
        inet saddr { 127.0.0.1, ::1 } tcp dport 22 accept
    }
}

Instead, it seems I must do:

table inet filter {
    chain input {
        ip saddr 127.0.0.1 tcp dport 22 accept
        ip6 saddr ::1 tcp dport 22 accept
    }
}

Why does inet not work in the way I am expecting it to?

Thanks for any answers!

-m
