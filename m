From: Patrick McHardy <kaber@trash.net>
Subject: Re: Multiple nf_bind_pf to the same protocol
Date: Tue, 03 Nov 2009 11:50:29 +0100
Message-ID: <4AF00AF5.9070205@trash.net>
References: <87iqdtnetv.fsf@isengard.friendlyfire.se> <4AEEFB23.407@trash.net> <87639rhq7t.fsf@isengard.friendlyfire.se>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87639rhq7t.fsf@isengard.friendlyfire.se>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-15?Q?Mattias_R=F6nnblom?= <hofors@lysator.liu.se>
Cc: netfilter@vger.kernel.org

Mattias R=F6nnblom wrote:
> Patrick McHardy <kaber@trash.net> writes:
>=20
>> Mattias R=F6nnblom wrote:
>>> Hi,
>>>
>>> with NFQUEUE and the libnetfilter_queue library, is it possible to
>>> bind several applications to same protocol (for example, AF_INET)?
>>>
>>> That would be useful if you want to do load balancing on a multicor=
e
>>> system, with a thread/process serving each NFQUEUE queue.
>>>
>>> After having a brief look at the NFQUEUE/libnetfilter_queue code, i=
t
>>> looks like there's only single netlink fd for all queues, and the
>>> library does the demultiplexing. Would that mean I have to have a
>>> "front-end" thread distributing different servering threads?
>> You can bind them to different group numbers for the same AF.
>> The latest version of the NFQUEUE target even supports automatic
>> balancing between those groups based on a simple flow hash.
>=20
> Do you by "group number" mean NFQUEUE queue number? If so, how would =
I
> do that?

Yes. You can specify the netlink group number in the nfq_create_queue()
call.

> The data comes on a single netlink fd, which is serviced by
> one thread, which is suppose to give the data chunk to
> libnetfilter_queue (nfq_handle_packet). The libary executes a callbac=
k
> (depending on queue number) in the context of that thread. At least
> that is my understanding of NFQUEUE/libnetfilter_queue.

You can start multiple processes and bind each one to a seperate queue.
Alternatively you can create multiple queue handles in a multithreaded
programm.
