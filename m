From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: NF_STOLEN and packets dropping
Date: Thu, 3 Nov 2011 16:24:49 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1111031611130.19950@frira.zrqbmnf.qr>
References: <CAH3pVZNtYOUHCGzbxi1bO-rMiZRjHgY-N=PW-72mKSSoOzjBFA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAH3pVZNtYOUHCGzbxi1bO-rMiZRjHgY-N=PW-72mKSSoOzjBFA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergey Naumov <sknaumov@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-11-02 14:18, Sergey Naumov wrote:

>Hello.
>
>Is there is a place in linux kernel where I can determine whether
>packet was dropped or not?
>Looking at source code I can guess that if we got NF_DROP while
>iterating through chains, we can determine that packet was droppped,
>but what about NF_STOLEN? Can stolen packets be accepted?

NF_{ACCEPT,DROP,STOLEN} are all mutually exclusive verdicts.
