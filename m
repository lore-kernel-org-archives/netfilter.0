From: Eric Leblond <eric@regit.org>
Subject: Re: libnetfilter_queue issues
Date: Sat, 12 Jan 2013 23:12:09 +0100
Message-ID: <1358028729.18655.15.camel@tiger2>
References: <50F15A68.3060806@o2.pl>
	  <CAOZ=-EUzjDe8YtZYZA_BjZt_cmP=ivcjUa6R5EecCmNZEEh0Rg@mail.gmail.com>
	 <1358017441.18655.1.camel@tiger2> <50F1D293.4050005@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50F1D293.4050005@o2.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dorian33@o2.pl
Cc: credzba@gmail.com, netfilter@vger.kernel.org

Hello,

Thanks for all these questions, I will improve/update the article thanks
to that.

On Sat, 2013-01-12 at 22:16 +0100, dorian wrote:
> Hi Eric,
> Thanks a lot for reply.
> 
> I read your article but apart from clarifying my doubts it created the
> new ones :)
> 
> Below are the issues....
> 
> 1.- - - - -
> You wrote: "packet can be verdict without order".
> I am very sorry but my English is not perfect so I understand above as
> "having packets in the order 1,2,3,4 the verdict can be set in any order
> (f.ex. in the order 4,1,3,2)"
> Am I right?

Exactly.

> If my above understanding is correct it also contains implied
> information that I can call successfully several times recv() function
> and none of the calls block despite the fact that the verdicts have not
> been set for the recv'ed packets.
> Am I right till now?

Yes. You can read packets, take a coffee and came back later to verdict
them all at once.

> 
> 2. - - - - - -
> Next you wrote
> a) "The packet queue is a real queue"
> and next
> b) "A packet is released when userspace issue a verdict"
> 
> Well, I have some doubts here.
> 
> According to my primitive understanding (but which is the same as at
> http://en.wikipedia.org/wiki/Queue_%28abstract_data_type%29)  the queue
> is First-In-First-Out (FIFO) data structure.
> So statement (b) is not true or not complete.
> 
> Because having several packets in queue (let's say 1,2,3,4) and setting
> verdict for packet 2 doesn't mean that it will be released (=sent) since
> it is  _in the middle_ of the queue.

OK real queue was not a correct term. See explanation below.

> Please explain above.
> 
> Anyway at the bottom you also mentioned about 'packet reordering' which
> suggests that queue you are writing about in the article is not a queue
> or my understanding of therm 'queue' is too primitive.

It is a chained list with the following operation:
      * Enqueue: element is added at the end
      * Dequeue (verdict): element is removed from the chained list.

> 3. - - - - - -
> And "new doubt" appeared after reading your article.
> You wrote: "The send/recv operation need to be protected by lock to
> avoid concurrent writing"
> 
> Well, I wrote a number of  multi-processed programs (run also on
> multi-core CPUs) which used the same file descriptor by each
> child-process and I never found the situation that any locking has been
> required.
> Each read or written messages (=sequence of bytes)  were consistent.
> Of course without locking I do not have control on the order of the
> messages read/written from/to file descriptor but none of the
> read/written data were corrupted (i.e. messages were not mixed)
> 
> So is the lock really required? Why?
> Is it a matter of the fact that 'fd' is the netlink socket?

Humm, you may have a point here. I'm doing this by habit and a check
could be needed.

> 4. - - - - - -
> Another "new doubt" requires longer explanation.
> 
> Using the file 'source-nfq.c' as reference we can found there
> 
>    while ((rv = recv(fd, buf, sizeof(buf), 0)) && rv >= 0) {
>       nfq_handle_packet(h, buf, rv);
>    }

> At the article you wrote: "the kernel sends a message containing packet
> data and related information to a socket and userpace reads this message"
> Does it means that 'buf' contains packet data?
> 
> I am asking about since 'fd' is the only socket I can find in the
> source-nfq.c.
> On the other hand the packet data are accessible via struct nfq_data
> *nfa in callback function and 'nfa' has nothing in common (at least
> documentation does not state it) with the 'buf'.
> 
> And if the 'buf' really contains packet data what for the callback
> function is required?
> Wasn't be simpler to access packet directly from 'buf'?
> 
> Till now I assumed that 'buf' contained only some kind of 
> "libnetfilter_queue internal metadata" which was not interesting for me.

buf is containing a nfnetlink message not the packet by itself. The
protocol messages are nfnetlink formatted.

> Any comment will be appreciated.
> 
> 
> - - - - - - - -
> And that's all.
> I would be be grateful to you for helping me to understand how to use
> the libnetfilter_queue and what can be done using it.
> 
> With best regards,
> Dorian

BR,
--
Eric


> 
> 
> 
> > Hello,
> >
> > On Sat, 2013-01-12 at 07:23 -0600, Felix wrote:
> >> excellent question !
> >> I too am interested in this.
> >>
> >> Another similar, related question is do packets that are not filtered
> >> wait on a verdict for a filtered packet?
> >> Again, if not, it means we can change packet order?
> >> If so,it means we can degrade system performance unrelated to our
> >> filtered packets.
> > I've just wrote an article describing libnetfilter_queue and NFQUEUE. It
> > has been written to answer your questions:
> > https://home.regit.org/netfilter-en/using-nfqueue-and-libnetfilter_queue/
> >
> > Let me know if it is the case and don't hesitate if you have any
> > suggestions.
> >
> > BR,
> > --
> > Eric
> >
> >> Thanks,
> >> Credzba
> >>
> >> On Sat, Jan 12, 2013 at 6:43 AM, dorian <dorian33@o2.pl> wrote:
> >>> Hi all,
> >>> Sorry if the queries has been answered yet but I can't find the reliable
> >>> informations about issues concerned with libnetfilter_queue.
> >>>
> >>> I need to run a program which would firstly fork let's say 10 times (or
> >>> creates 10 threads) and next each child-process (or thread) will include
> >>>
> >>>    while ((rv = recv(fd, buf, sizeof(buf), 0)) && rv >= 0) {
> >>>       nfq_handle_packet(h, buf, rv);
> >>>    }
> >>>
> >>> sequence.
> >>>
> >>> The fork/multiple threads reason usage is that for some packets the
> >>> processing time will be relatively long.
> >>> So I would like to handle next packets in "the meantime" using another
> >>> process (or thread)
> >>>
> >>> But I have 2 doubts which I would like to clarify.
> >>>
> >>> 1. - - - - - -
> >>> Is it possible to handle concurrently several packets with several
> >>> processes ?
> >>> i.e. if the process1 is handling a packet will the process2 receive the
> >>> next existing packet?
> >>>
> >>> The essence of my doubt is:
> >>> if process1 receives the packet1 but the verdict is not issued  will
> >>> next recv() (in process2) be successful and not hold process2 until
> >>> verdict for packet1 is made?
> >>>
> >>> Please confirm.
> >>>
> >>>
> >>> 2. - - - - - -
> >>> Let's assume that we have process1 which handles packet 1, process 2
> >>> which handles packet 2, etc
> >>> Let's say verdict for packet2 is issued before verdict for packet1
> >>>
> >>> Will packet2 leave the queue or has it to "wait" for verdict for packet1 ?
> >>>
> >>> The essence of my doubt is:
> >>> can packet2 leave the queue before packet1 ?
> >>>
> >>> In other words can we change the packets order leaving system ?
> >>>
> >>> Or, maybe, although verdict for packet2 is done it has to wait for
> >>> verdict for packet1 and next both leave the queue in original order?
> >>>
> >>> I would be obliged if you clarify above two matter
> >>>
> >>> Best Regards,
> >>> Dorian
> >>>
> >>> --
> >>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> >>> the body of a message to majordomo@vger.kernel.org
> >>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Eric Leblond <eric@regit.org>
Blog: https://home.regit.org/

