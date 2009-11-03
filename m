From: Mattias =?utf-8?Q?R=C3=B6nnblom?= <hofors@lysator.liu.se>
Subject: Re: Multiple nf_bind_pf to the same protocol
Date: Tue, 03 Nov 2009 11:12:22 +0100
Message-ID: <87639rhq7t.fsf@isengard.friendlyfire.se>
References: <87iqdtnetv.fsf@isengard.friendlyfire.se> <4AEEFB23.407@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AEEFB23.407@trash.net> (Patrick McHardy's message of "Mon\, 02 Nov 2009 16\:30\:43 +0100")
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

Patrick McHardy <kaber@trash.net> writes:

> Mattias R=C3=B6nnblom wrote:
>> Hi,
>>=20
>> with NFQUEUE and the libnetfilter_queue library, is it possible to
>> bind several applications to same protocol (for example, AF_INET)?
>>=20
>> That would be useful if you want to do load balancing on a multicore
>> system, with a thread/process serving each NFQUEUE queue.
>>=20
>> After having a brief look at the NFQUEUE/libnetfilter_queue code, it
>> looks like there's only single netlink fd for all queues, and the
>> library does the demultiplexing. Would that mean I have to have a
>> "front-end" thread distributing different servering threads?
>
> You can bind them to different group numbers for the same AF.
> The latest version of the NFQUEUE target even supports automatic
> balancing between those groups based on a simple flow hash.

Do you by "group number" mean NFQUEUE queue number? If so, how would I
do that? The data comes on a single netlink fd, which is serviced by
one thread, which is suppose to give the data chunk to
libnetfilter_queue (nfq_handle_packet). The libary executes a callback
(depending on queue number) in the context of that thread. At least
that is my understanding of NFQUEUE/libnetfilter_queue.

(Automatic load balancing sounds great btw.)

Best regards,
     Mattias
