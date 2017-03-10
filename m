From: V Kurien <kurien.varugis@gmail.com>
Subject: Re: Dumb question
Date: Thu, 9 Mar 2017 20:57:26 -0800
Message-ID: <CACmTqUn9NNEYrGOCMmkhhb8ma-NgztyLERBGcHv5AzVY-8x2Wg@mail.gmail.com>
References: <CACmTqU=6TD+6CW7HmgbZ0V0ZyNq6hbgjCNXOkTBQirjeu0iBOA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=YGMITd4pB9sMeUoc+czGaQuUxuUQG04fQW4c3alrQmQ=;
        b=A+6OALBRJga9EAlsM8FoAqeXJJ2hjR7BQ0quUcGpRY4fDPIpWa6CT45kh8ulRBCQ2b
         jwyHy/waOTQQqowaweY8tkYSXSnjwe88n+GpdJH/c9LVmR9PFJnb473cqnXbPiAN4jCX
         RA6oxMvSAOe5xlV2zJwNnBsPJz0adAAW8qv3Rz/BaMBrpWd0/ja6hwWBCzZMvmWqZGhU
         CrfnFyjt81df7pXXZLaut7dITDU79IgYei7rLpaL9CYYds/YLo+CGTwI8CdxDifk2Ig7
         LXnOrFWxP6/pSeooJzyLGmVnJfPXnR8H7m/+88snWh8OjgH5ilhKOqj8O37NpkEmzmmg
         g0Xg==
In-Reply-To: <CACmTqU=6TD+6CW7HmgbZ0V0ZyNq6hbgjCNXOkTBQirjeu0iBOA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Please ignore this. The kernel on the machine had been changed from
the generic kernel.

On Thu, Mar 9, 2017 at 8:35 PM, V Kurien <kurien.varugis@gmail.com> wrote:
> Hi all
> I'm trying to use ulogd2 to count flows and so I assume that I have to
> create iptable rules to match the traffic that I care about.
>
> Based on reading on the web, it seemed that I'd have to (this is on a
> stock ubuntu-16.04 with a 4.4 kernel)
>
> Assume that I want to match all TCP packets heading into the host;
>
> (1) Create an iptables rule: iptables -A INPUT -p TCP  -j ULOG --ulog-nlgroup 1
> (2) My ulogd.conf looks like:
> .. all plugins included
>
> stack=ct1:NFCT,ip2str1:IP2STR,print1:PRINTFLOW,emu1:LOGEMU
>
> I get an error when I try to run the iptables command:
>
> iptables: No chain/target/match by that name.
>
> Clearly I am doing something insane, but what?
