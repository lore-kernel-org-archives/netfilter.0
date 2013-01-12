From: Eric Leblond <eric@regit.org>
Subject: Re: libnetfilter_queue issues
Date: Sat, 12 Jan 2013 20:04:01 +0100
Message-ID: <1358017441.18655.1.camel@tiger2>
References: <50F15A68.3060806@o2.pl>
	 <CAOZ=-EUzjDe8YtZYZA_BjZt_cmP=ivcjUa6R5EecCmNZEEh0Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOZ=-EUzjDe8YtZYZA_BjZt_cmP=ivcjUa6R5EecCmNZEEh0Rg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: credzba@gmail.com
Cc: dorian33@o2.pl, netfilter@vger.kernel.org

Hello,

On Sat, 2013-01-12 at 07:23 -0600, Felix wrote:
> excellent question !
> I too am interested in this.
> 
> Another similar, related question is do packets that are not filtered
> wait on a verdict for a filtered packet?
> Again, if not, it means we can change packet order?
> If so,it means we can degrade system performance unrelated to our
> filtered packets.

I've just wrote an article describing libnetfilter_queue and NFQUEUE. It
has been written to answer your questions:
https://home.regit.org/netfilter-en/using-nfqueue-and-libnetfilter_queue/

Let me know if it is the case and don't hesitate if you have any
suggestions.

BR,
--
Eric

> Thanks,
> Credzba
> 
> On Sat, Jan 12, 2013 at 6:43 AM, dorian <dorian33@o2.pl> wrote:
> > Hi all,
> > Sorry if the queries has been answered yet but I can't find the reliable
> > informations about issues concerned with libnetfilter_queue.
> >
> > I need to run a program which would firstly fork let's say 10 times (or
> > creates 10 threads) and next each child-process (or thread) will include
> >
> >    while ((rv = recv(fd, buf, sizeof(buf), 0)) && rv >= 0) {
> >       nfq_handle_packet(h, buf, rv);
> >    }
> >
> > sequence.
> >
> > The fork/multiple threads reason usage is that for some packets the
> > processing time will be relatively long.
> > So I would like to handle next packets in "the meantime" using another
> > process (or thread)
> >
> > But I have 2 doubts which I would like to clarify.
> >
> > 1. - - - - - -
> > Is it possible to handle concurrently several packets with several
> > processes ?
> > i.e. if the process1 is handling a packet will the process2 receive the
> > next existing packet?
> >
> > The essence of my doubt is:
> > if process1 receives the packet1 but the verdict is not issued  will
> > next recv() (in process2) be successful and not hold process2 until
> > verdict for packet1 is made?
> >
> > Please confirm.
> >
> >
> > 2. - - - - - -
> > Let's assume that we have process1 which handles packet 1, process 2
> > which handles packet 2, etc
> > Let's say verdict for packet2 is issued before verdict for packet1
> >
> > Will packet2 leave the queue or has it to "wait" for verdict for packet1 ?
> >
> > The essence of my doubt is:
> > can packet2 leave the queue before packet1 ?
> >
> > In other words can we change the packets order leaving system ?
> >
> > Or, maybe, although verdict for packet2 is done it has to wait for
> > verdict for packet1 and next both leave the queue in original order?
> >
> > I would be obliged if you clarify above two matter
> >
> > Best Regards,
> > Dorian
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Eric Leblond <eric@regit.org>
Blog: https://home.regit.org/

