From: Thomas Korimort <tomkori@gmx.net>
Subject: Re: Weird/High CPU usage caused by LOG target
Date: Thu, 26 Dec 2019 09:22:05 +0100
Message-ID: <3158285e-4adf-78fe-cf7b-dca9bef811a0@gmx.net>
References: <CAGnHSEkvf0zieVJtPyneZ6PfnzeANmfFxTb=0JpgVb1FXVk0-w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1577348532;
        bh=HplVyB3V1PdLVixtCKVYnopVrqZ5mZ/CARfPK5jV2fA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=F3LJMgGohvUvHeBjpE0KAxwc9t/yjk6OocpYJRFo2+2agpSNlL32o4OdSErSdmJVi
         ncAYWnUN0lVIHFmZ6CtyxW+EU38rSEqgxXcZA2tseuao5E1yzxbmdhnA5Nx2Sk6Stq
         jVHrtN+1jy7lwW/tRaLwTjYZwWYOjAVW2wGO5YOw=
In-Reply-To: <CAGnHSEkvf0zieVJtPyneZ6PfnzeANmfFxTb=0JpgVb1FXVk0-w@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Yan <tom.ty89@gmail.com>, netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org

Hi tom yan!

I also noted such a type of CPU usage on my Raspberry Pi 4 4 GB. I have
also found several privacy concerns on my new powerful Raspberry pi 4
4GB. Maybe there are people highjacking CPU power from Raspberry Pis to
do cryptomining or whatever else in terms of distributed
(super)-computing. I am suspecting that the high usability of the
Raspberry Pi 4 4 GB and generally the RPi series imposes a threat to
companies and people who offer high-priced consumer electronics. That is
why we have to experience such kind of issues on our Raspberry Pi
platforms, because a lot of competitors try to push out the RPi
platforms of their business. For example: cost of a modern Smart Tv:
2000 bucks, cost of a similar sized monitor with 4K/2K capability +
self-maintained RPi 4 4GB running Raspbian Buster as a full-fledged
media center: 350 bucks.

During operation of my RPi 4 4 GB i also noticed high CPU peaks. That
was due to not supported x.264 hardware-encoding (now it is supported).
Furthermore, sometimes the RPi4 4GB gets slow. After the update of the
x.264 codec the situation is now relieved. Though sometimes while using
Kodi also strange phenomena occur in terms of slowed down interface
interaction and reaction. That might be related to high CPU load because
of ASCII logging. People underestimate the CPU usage logging features
are making.

Many greetings, Thomas Korimort.

On 26.12.19 04:05, Tom Yan wrote:
> Hi all,
>
> So I was trying to log all traffics in the FORWARD chain with the LOG
> target in iptables (while I say all, it's just some VPN server/client
> that is used by only me, and the tests were just opening some
> website).
>
> I notice that the logging causes high CPU usage (so it goes up only
> when there are traffics). In (h)top, the usage shows up as openvpn's
> if the forwarding involves their tuns. Say I am forwarding from one
> tun to another, each of the openvpn instance will max out one core on
> my raspberry pi 3 b+. (And that actually slows the whole system down,
> like ssh/bash responsiveness, and stalls the traffic flow.) If I do
> not log, or log with the NFLOG target instead, their CPU usage will be
> less than 1%.
>
> Interestingly, the problem seems to be way less obvious if I am using
> it on higher end devices (like my Haswell PC, or even a raspberry pi
> 4). There are still "spikes" as well, but it won't make me "notice"
> the problem, at least not when I am just doing some trivial web
> browsing.
>
> Let me know how I can further help debugging, if any of you are
> interested in fixing this.
>
> Regards,
> Tom
