From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: Matching metainformation cgroup fails on input, works on output.
Date: Wed, 8 Dec 2021 09:07:32 -0500
Message-ID: <CANf9dFMcpnqO-at25EKfxad7fX=yT9s0A7EDBgac1doL3fGxpg@mail.gmail.com>
References: <874k7j31no.fsf@laptop.lockywolf.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hat0FPflogtC7heS/OmZ9sck6vWm0NktBt3pY1vUOlE=;
        b=ULpbXQlGm38pQICnByt4WxoBuxawTz6Cum7NAmBhDUHyvnQgJp0+N8I2rFGfOcXZVI
         U206eAw3AJ3fMC5vftDfAUJxRbzDwTcGJohEDEYB7ULm0FxoW7WQuoskWLAXZ2YORqUh
         vbsY6BNfBI71vXST9taTFl6A222jiGpzbw5ZPna+aR1aEhmFVS/9PhdvGxVnZQFV/iij
         gbQQEITj31glKfCMbL/1TPTj3RUsR/Du21I893fkxNs3c5XsP9cP6IgRKssEb6P2ELc5
         TBz+qF8RpalSuBYW9MGqyWNdZaLi4DvXylEnDMomUEtTJs0K888yDKqYoRhydjMA+cZ9
         SE8A==
In-Reply-To: <874k7j31no.fsf@laptop.lockywolf.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Nikishkin <lockywolf@gmail.com>
Cc: netfilter@vger.kernel.org

What is the complete output of 'nft list ruleset'?

Is it possible you have an earlier INPUT rule that matches and allows
packets that match connection-tracking "established" state, such as:

        chain INPUT {
                type filter hook input priority filter; policy drop;
                ct state established,related counter packets 391638047
bytes 93651768866 accept
                ct state invalid drop
                [...]

-Martin


On Wed, Dec 8, 2021 at 4:39 AM Vladimir Nikishkin <lockywolf@gmail.com> wrote:
>
> Hello, everyone.
>
> I have a weird problem!
>
> This is my nft code:
>
> ```
> nft add counter filter test-icmp-output
> nft add counter filter test-icmp-input
> nft add rule filter OUTPUT meta cgroup != 0x001000 ip daddr 8.8.8.8 ip protocol icmp counter name test-icmp-output
> nft add rule filter INPUT  meta cgroup != 0x001000 ip saddr 8.8.8.8 ip protocol icmp counter name test-icmp-input
> ```
>
> Pinging 8.8.8.8 works. The packets are visible on tcpdump too.
> The cgroup id 0x001000 does not exist, so every packet should match.
>
> Still, the output counter counts the expected number of packets, the
> second stays 0.
>
> What am I doing wrong?
>
> --
> Your sincerely,
> Vladimir Nikishkin (MiEr, lockywolf)
> (Laptop)
