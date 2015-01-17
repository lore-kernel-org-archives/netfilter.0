From: =?UTF-8?Q?St=C3=A9phane_Charette?= <stephanecharette@gmail.com>
Subject: Re: netfilter queues only seeing IPv4/TCP traffic
Date: Sat, 17 Jan 2015 15:32:49 -0800
Message-ID: <CA+HxBUKZRv97kYdOib62dyh9MxiHv4M+eNL0EfUDSYY5ACGOrA@mail.gmail.com>
References: <CA+HxBU+RUU7NCTx3W1KeWaC-iDWs+JdicqmbVGmgDH4v7mENyA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=9ot1Y+rz8ML0V2z3OpwzFV3HcwtQY6/DteZV92juRFA=;
        b=AVkYTxiuV+xSsbMI9N+J+8NuBAzUH0aUpGtuMDtwfMKPKM1g0SoIVuEKOIxLvP0mHm
         QJbsn0xWieKdAnHermV3HRA7W/XOOcRx/Ey4l0AdZzKOXiTMCcJ6iGGpvgmqwapeVA1E
         apYHiFXqwuwwY0D4q4Qp3RsN+Ve1Rwf9KYF1wcug0eUqzQJBlpPihByOxCljP5uFJNt2
         lMq22M4ylyJWGWquzl/RgE1V5J7Rfs9guyciVR0zVKbRhUCNyLuyPPI1q5yyuEg+b0Cn
         GT1Z0GFhEa+AguzGSluchAClgIqMRkmQGhAGVyIxpPWU3ChfvGIvzIjU4VdRs7WaWTBt
         zujg==
In-Reply-To: <CA+HxBU+RUU7NCTx3W1KeWaC-iDWs+JdicqmbVGmgDH4v7mENyA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On Fri, Jan 16, 2015 at 10:04 PM, St=C3=A9phane Charette
<stephanecharette@gmail.com> wrote:
> I have netfilter queues setup more-or-less like the Doxygen pages des=
cribe:
> ...
> All is well, but I'm only seeing IPv4+TCP packets.


Replying with the answer in case this comes up for anyone else in the
future doing a google search on the archives.

Thanks to "evilman_home" on the #netfilter channel in irc, the
solution was found.  My iptables rules included this problematic line:

iptables --table filter --append MYQ --jump NFQUEUE --queue-balance
0:3 --queue-bypass

The issue was my app was only opening queue zero.  I mistakenly
thought since I opened up just 1 queue, all traffic would be sent to
that single queue.  Turns out the ICMP, UDP, and other traffic was
going to other unopened queues.  Changing that line to this solved the
problem:

iptables --table filter --append MYQ --jump NFQUEUE --queue-num 0 --que=
ue-bypass

St=C3=A9phane
