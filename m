From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: conntrackd exits during failover when there are around 30000 connections
Date: Thu, 27 Jul 2017 12:40:03 +0200
Message-ID: <CAOkSjBgrFe5Wsqag5UkOgTWMdDkHqPaEjc5VLJhmHoJ4d3GzXg@mail.gmail.com>
References: <733DB87B7669B346B4428487F4A99461230594E8@USMLVA0EM23MSX.ww017.siemens.net>
 <CAOkSjBh+sXpNo2ezv35E+py_d76aWSJ7qZo=wHAs=UgG+_pvMw@mail.gmail.com> <733DB87B7669B346B4428487F4A99461230595B8@USMLVA0EM23MSX.ww017.siemens.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <733DB87B7669B346B4428487F4A99461230595B8@USMLVA0EM23MSX.ww017.siemens.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "PATEL, SAMEER" <sameer.patel@siemens.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 26 July 2017 at 15:49, PATEL, SAMEER <sameer.patel@siemens.com> wrote:
> Hi Arturo,
>
> We're using a distribution based on Debian Jessie. The software versions are below:
>
> libnetfilter-conntrack3: 1.0.4
> libnetfilter-cthelper0: 1.0.0
> libnetfilter-queue1: 1.0.2
> conntrackd: 1.4.2
> kernel: 3.14.68
>

Well, many fixes happened since conntrackd 1.4.2 which is 4 years old.
Same for the kernel.
It is possible if you try a more recent version of both kernel and conntrackd?

> There aren't any errors in the logs. The last things I see are "flushing conntrack table in 60" and "request resync"
>
> Also conntrackd fails to restart until I delete a lock file. This might be more evidence that conntrackd isn't exiting cleanly.
>

True. This reminds my of the debian bug #796877 [0] that I suffered in the past.

Problem is that back then, the conntrackd package didn't include debug
symbols, so even if you run conntrackd with valgrind or gdb to see
where the crash happens, you wont get the symbol names (i.e.
funcionts) so little clues.

Since then, I took over the debian packages and added debug symbols
(starting with 1:1.4.3-2). But then, again, you need a newer version.

[0] https://bugs.debian.org/796877
