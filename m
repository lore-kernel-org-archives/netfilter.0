From: Michael Kilian <michael.kilian@gmail.com>
Subject: Re: Using netfilter in a multi-threaded program
Date: Sat, 13 Jul 2013 15:30:59 -0400
Message-ID: <CAHh8oT7qOmuko-6Sz_Qd7_neNKZVCoea+LfTfR4kjVd2=w+7iw@mail.gmail.com>
References: <CAHh8oT7QQKpKoa_2TU8W=-UaGqsY0s=vGEL2DL-+70xhLGJr5Q@mail.gmail.com>
 <1373640472.12419.7.camel@ice-age.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=QADIixRqTPwRKzAY4gTLa7rvU88ECwM1gPTOR0uQwOY=;
        b=uZVmLvKn+Gs14iySDcxEQo2MhJYiJ3dtdNVZEW6nI9k7k77U+RG3nCZGHyBPI5xwDB
         EhCUld+6HgN2/rsbAVppDp1inOKDJxgsyxcf9JMib29JLuURhiPOdMiqCFLCHdCOO2Pr
         otJyukdIQUN/rvFmFAV8vJVcoRYlSQ0cnMYnmfHQKuZ5NAuzypoejOdyLz8ntHM1FMPr
         WkOdQAnpa8luXzpsEvp9DQm0iKYwu0Tqm5DnUEbHNushjc4QMTOBB/pDQWM6aJblStgo
         NfhR2rvNSDqCdBiCXzf0cHUeytoIF0RQDxGvWWTvoAAMUnk7Rta8qYUACN3lX+9iUCNV
         z4OQ==
In-Reply-To: <1373640472.12419.7.camel@ice-age.regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@regit.org>
Cc: netfilter <netfilter@vger.kernel.org>

This was very helpful.

However I think I'm not quite to the end of this path yet.

I have the following rules in the mangle section of my iptables:

iptables -t mangle -A PREROUTING -p tcp --dport 9999 -j NFQUEUE
--queue-balance 0:1
iptables -t mangle -A PREROUTING -p tcp --sport 9999 -j NFQUEUE
--queue-balance 0:1

I create 2 threads.Each thread does a nfq_open.  So far so good.
Thread 1 has his nfq_handle and thread 2 has his nfq_handle. Thread 1
does a nfq_create_queue on queue 0, and Thread 2 does a
nfq_create_queue on queue 1.

Each thread then opens a netlink handle.  Each thread does this
independently with the handle returned from nfq_open. Each thread gets
an independent fd.

When I run, only one thread receives traffic (queue 0 on thread #1).
I am using iperf -P 8 for example (8 simultaneous
threads/connections).

=46rankly I must be missing something since I don't see any relationshi=
p
between the result of nfq_create_queue (which presumably binds to the
queue number given in the second argument), and the file descriptor we
get from nfnl_fd (unless there is a side-effect of this routine to
bind the queue ID to the nfq_handle!).  I can sort of see how
nfq_handle_packet will make that association (presumably the queue #
is squirreled away in some piece of state and that finds the right
callback, etc.).

I think I've misunderstood the basic structure, especially with
respect to what should be in a thread.  Or perhaps my complete naivete
on iptables means I've screwed up that configuration.

So either I've set my stuff up wrong (you can see the code below), or
the iptables stuff isn't really distributing the requests across
queues, or some of both.

-- Mike

Configuration being run:

kernel: 2.6.32-358.6.1.el6.x86_64
libmnl vs 1.0.3
libnfnetlink vs. 1.0.1
libnetfilter_queue vs. 1.0.2

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <netinet/udp.h>
#include <netinet/tcp.h>

#include <pthread.h>

#include <fcntl.h>
#include <errno.h>
#include <inttypes.h>

extern "C" {
#include <linux/netfilter.h>  /* Defines verdicts (NF_ACCEPT, etc) */
#include <libnetfilter_queue/libnetfilter_queue.h>
}

=2E... uninteresting stuff eliminated....

struct queueStuff {
    int queue;
    int maxqueue;
    queueStuff(int i, int m): queue(i), maxqueue(m) {}
};



static int Callback(nfq_q_handle *myQueue, struct nfgenmsg *msg,
                    nfq_data *pkt, void *cbData) {
    uint32_t id =3D 0;
    nfqnl_msg_packet_hdr *header;
    queueStuff *p =3D (queueStuff *) cbData;

    if ((header =3D nfq_get_msg_packet_hdr(pkt))) {
        id =3D ntohl(header->packet_id);
    }

    // Print the payload; in copy meta mode, only headers will be inclu=
ded;
    // in copy packet mode, whole packet will be returned.
    unsigned char *pktData;
    int len =3D nfq_get_payload(pkt, &pktData);

    numPackets++;

    ip *ipp =3D (ip *) pktData;

    if (!ipp) numNull++;


    if (ipp && ipp->ip_p =3D=3D IPPROTO_TCP) {
        tcphdr *tcpp =3D (tcphdr *)(pktData + sizeof(ip));

        uint32_t headerlen =3D ipp->ip_hl * 4 + tcpp->doff * 4;
        uint32_t paylen =3D ntohs(ipp->ip_len) - headerlen;


        if (tcpp->fin) numFin++;
        if (tcpp->syn) numSyn++;
        if (tcpp->rst) numRst++;
        if (tcpp->psh) numPsh++;
        if (tcpp->ack) numAck++;
        if (tcpp->urg) numUrg++;

        if (!tcpp->fin && !tcpp->syn && !tcpp->rst && !tcpp->psh &&
!tcpp->ack && !tcpp->urg)
            numNone++;

        totalAmount +=3D paylen;
    }

    if ((numPackets % 5000) =3D=3D 0) {
        printf("Queue %d: %d packets, %d NULL, %d fin, %d syn, %d rst,
%d psh, %d ack, %d urg, %d none -- %lld bytes\n",
               p->queue,
               numPackets,
               numNull,
               numFin,
               numSyn,
               numRst,
               numPsh,
               numAck,
               numUrg,
               numNone,
               totalAmount); fflush(stdout);
    }


#if 0
    printf("Packet data for %d / id =3D %d\n", p->queue, id);
    Dump(pktData);
#endif

    // For this program we'll always accept the packet...
    return nfq_set_verdict(myQueue, id, NF_ACCEPT, 0, NULL);

    // end Callback
}



void *processQueue(void *q) {

    queueStuff *qs =3D (queueStuff *) q;

    struct nfq_handle *nfqHandle =3D NULL;
    nfqHandle =3D nfq_open();

    if (!nfqHandle) {
        perror("nfq_open");
        exit(1);
    }

    printf("Unbinding...nobody seems sure why to do this\n");
    if (nfq_unbind_pf(nfqHandle, AF_INET) < 0) {
        perror("nfq_unbind_pf");
        exit(1);
    }


    printf("Binding to process IP packets\n");
    if (nfq_bind_pf(nfqHandle, AF_INET) < 0) {
        perror("nfq_bind_pf");
        exit(1);
    }
    printf("Creating netfilter handle %d\n", qs->queue);
    struct nfq_q_handle *myQueue =3D NULL;
    struct nfnl_handle *netlinkHandle =3D NULL;

    int fd =3D -1;
    ssize_t res;
    char buf[4096];

    printf("Installing queue %d\n", qs->queue);

    if (!(myQueue =3D nfq_create_queue(nfqHandle, qs->queue, &Callback,=
 q))) {
        perror("nfq_create_queue");
        exit(1);
    }

    printf("Myqueue for %d is %p\n", qs->queue, myQueue); fflush(stdout=
);

    // Turn on packet copy mode ... NOTE: only copy_packet really works=
=2E
    int whatToCopy =3D NFQNL_COPY_PACKET;
    // int whatToCopy =3D NFQNL_COPY_META;

    // A little more than the standard header...
    // int sizeToCopy =3D sizeof(ip) + sizeof(tcphdr) + 10;
    int sizeToCopy =3D 10000;

    if (nfq_set_mode(myQueue, whatToCopy, sizeToCopy) < 0) {
        perror("nfq_set_mode");
        exit(1);
    }

    printf("Set mode for %d\n", qs->queue); fflush(stdout);

    if (nfq_set_queue_maxlen(myQueue, qs->maxqueue) < 0) {
        printf("Couldn't set queue max len to %d.\n",qs->maxqueue);
    }
    else {
        printf("Set queue length to %d packets\n", qs->maxqueue);
fflush(stdout);
    }

    netlinkHandle =3D nfq_nfnlh(nfqHandle);

    if (!netlinkHandle) {
        perror("nfq_nfnlh");
        exit(1);
    }

    printf("Got netlink handle for %d\n", qs->queue); fflush(stdout);

    nfnl_rcvbufsiz(netlinkHandle, qs->maxqueue * 1500);

    printf("Set recv buffer size to %d\n", qs->maxqueue*1500); fflush(s=
tdout);


    fd =3D nfnl_fd(netlinkHandle);

    printf("Queue #%d:  fd =3D %d\n", qs->queue, fd); fflush(stdout);

    int opt =3D 1;
    setsockopt(fd, SOL_NETLINK, NETLINK_BROADCAST_SEND_ERROR, &opt,
sizeof(int));
    setsockopt(fd, SOL_NETLINK, NETLINK_NO_ENOBUFS, &opt, sizeof(int));

    printf("Ignoring buffer overflows...folklore\n"); fflush(stdout);

    while ((res =3D recv(fd, buf, sizeof(buf), 0)) && res >=3D 0) {
        // I am not totally sure why a callback mechanism is used
        // rather than just handling it directly here, but that
        // seems to be the convention...

        nfq_handle_packet(nfqHandle, buf, res);
        // end while receiving traffic
    }

    perror("recv");

    nfq_destroy_queue(myQueue);
    nfq_close(nfqHandle);
}


int main(int argc, char *argv[]) {


    int numQueues =3D 1;
    if (argc =3D=3D 2)
        numQueues =3D atoi(argv[1]);

    int maxqueue =3D 10000;
    if (argc =3D=3D 3)
        maxqueue =3D atoi(argv[2]);


    pthread_t theThreads[100];

    for (int i=3D0; i<numQueues; i++) {
        pthread_create(&theThreads[i], NULL, processQueue, new
queueStuff(i, maxqueue));
        sleep(1);
    }

    for (int i=3D0; i<numQueues; i++) {
        pthread_join(theThreads[i], NULL);
    }

    return 0;
}



What I see:

# Generated by iptables-save v1.4.7 on Sat Jul 13 15:13:14 2013
*mangle
:PREROUTING ACCEPT [1307:101481]
:INPUT ACCEPT [588339:1228894985]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [297758:15642665]
:POSTROUTING ACCEPT [297758:15642665]
-A PREROUTING -p tcp -m tcp --dport 9999 -j NFQUEUE --queue-balance 0:1
-A PREROUTING -p tcp -m tcp --sport 9999 -j NFQUEUE --queue-balance 0:1
COMMIT
# Completed on Sat Jul 13 15:13:14 2013
# Generated by iptables-save v1.4.7 on Sat Jul 13 15:13:14 2013
*filter
:INPUT ACCEPT [588350:1228895761]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [297769:15644033]
-A INPUT -i bond0 -p tcp -m tcp --dport 80 -m state --state
NEW,ESTABLISHED -j ACCEPT
-A OUTPUT -o bond0 -p tcp -m tcp --sport 80 -m state --state
ESTABLISHED -j ACCEPT
COMMIT
# Completed on Sat Jul 13 15:13:14 2013

TBL205-ROOT>> iptables-save
TBL205-ROOT>> ./t4 2
Unbinding...nobody seems sure why to do this
Binding to process IP packets
Creating netfilter handle 0
Installing queue 0
Myqueue for 0 is 0x7f95f8000b30
Set mode for 0
Set queue length to 10000 packets
Got netlink handle for 0
Set recv buffer size to 15000000
Queue #0:  fd =3D 3
Ignoring buffer overflows...folklore


Unbinding...nobody seems sure why to do this
Binding to process IP packets
Creating netfilter handle 1
Installing queue 1
Myqueue for 1 is 0x7f95f0000b30
Set mode for 1
Set queue length to 10000 packets
Got netlink handle for 1
Set recv buffer size to 15000000
Queue #1:  fd =3D 4
Ignoring buffer overflows...folklore


Queue 0: 5000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 76 psh, 4999 ack,
0 urg, 0 none -- 9954356 bytes
Queue 0: 10000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 83 psh, 9999 ack,
0 urg, 0 none -- 20194356 bytes
Queue 0: 15000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 87 psh, 14999
ack, 0 urg, 0 none -- 30434356 bytes
Queue 0: 20000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 90 psh, 19999
ack, 0 urg, 0 none -- 40674356 bytes
Queue 0: 25000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 92 psh, 24999
ack, 0 urg, 0 none -- 50914356 bytes
Queue 0: 30000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 94 psh, 29999
ack, 0 urg, 0 none -- 61154356 bytes
Queue 0: 35000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 96 psh, 34999
ack, 0 urg, 0 none -- 71394356 bytes
Queue 0: 40000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 97 psh, 39999
ack, 0 urg, 0 none -- 81634356 bytes
Queue 0: 45000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 99 psh, 44999
ack, 0 urg, 0 none -- 91874356 bytes
Queue 0: 50000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 101 psh, 49999
ack, 0 urg, 0 none -- 102114356 bytes
Queue 0: 55000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 103 psh, 54999
ack, 0 urg, 0 none -- 112354356 bytes
Queue 0: 60000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 105 psh, 59999
ack, 0 urg, 0 none -- 122594356 bytes
Queue 0: 65000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 107 psh, 64999
ack, 0 urg, 0 none -- 132834356 bytes
Queue 0: 70000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 109 psh, 69999
ack, 0 urg, 0 none -- 143074356 bytes
Queue 0: 75000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 111 psh, 74999
ack, 0 urg, 0 none -- 153314356 bytes
Queue 0: 80000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 113 psh, 79999
ack, 0 urg, 0 none -- 163554356 bytes
Queue 0: 85000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 115 psh, 84999
ack, 0 urg, 0 none -- 173794356 bytes
Queue 0: 90000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 117 psh, 89999
ack, 0 urg, 0 none -- 184034356 bytes
Queue 0: 95000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 119 psh, 94999
ack, 0 urg, 0 none -- 194274356 bytes
Queue 0: 100000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 121 psh, 99999
ack, 0 urg, 0 none -- 204514356 bytes
Queue 0: 105000 packets, 0 NULL, 0 fin, 1 syn, 0 rst, 122 psh, 104999
ack, 0 urg, 0 none -- 214754356 bytes
Queue 0: 110000 packets, 0 NULL, 1 fin, 9 syn, 0 rst, 263 psh, 109991
ack, 0 urg, 0 none -- 222752512 bytes
Queue 0: 115000 packets, 0 NULL, 1 fin, 9 syn, 0 rst, 381 psh, 114991
ack, 0 urg, 0 none -- 232954624 bytes
Queue 0: 120000 packets, 0 NULL, 1 fin, 9 syn, 0 rst, 439 psh, 119991
ack, 0 urg, 0 none -- 243194624 bytes
Queue 0: 125000 packets, 0 NULL, 1 fin, 9 syn, 0 rst, 472 psh, 124991
ack, 0 urg, 0 none -- 253434624 bytes
Queue 0: 130000 packets, 0 NULL, 1 fin, 9 syn, 0 rst, 494 psh, 129991
ack, 0 urg, 0 none -- 263674624 bytes
Queue 0: 135000 packets, 0 NULL, 1 fin, 9 syn, 0 rst, 507 psh, 134991
ack, 0 urg, 0 none -- 273914624 bytes
Queue 0: 140000 packets, 0 NULL, 1 fin, 9 syn, 0 rst, 519 psh, 139991
ack, 0 urg, 0 none -- 284154624 bytes
Queue 0: 145000 packets, 0 NULL, 1 fin, 9 syn, 0 rst, 528 psh, 144991
ack, 0 urg, 0 none -- 294394624 bytes
Queue 0: 150000 packets, 0 NULL, 1 fin, 9 syn, 0 rst, 537 psh, 149991
ack, 0 urg, 0 none -- 304634624 bytes
Queue 0: 155000 packets, 0 NULL, 1 fin, 9 syn, 0 rst, 545 psh, 154991
ack, 0 urg, 0 none -- 314874624 bytes

On Fri, Jul 12, 2013 at 10:47 AM, Eric Leblond <eric@regit.org> wrote:
> Hi,
>
> Le vendredi 12 juillet 2013 =E0 09:23 -0400, Michael Kilian a =E9crit=
 :
>> I am a little confused with using netfilter API's using multiple
>> threads to access multiple queues presumably to get better
>> performance.
>>
>> Is there documentation on what is thread-safe?  How about what can b=
e
>> run in parallel?
>
>
>
>> From what I can discern from the API structure you have a single fd =
to
>> the NFQUEUE infrastructure (from nfq_open).  All packets flow over
>> that.
>
> The fd is per-queue so you can multithread using multiple recev threa=
d
> per-fd.
>
> You can find a multithreaded code source example here:
>
> https://redmine.openinfosecfoundation.org/projects/suricata/repositor=
y/revisions/master/entry/src/source-nfq.c
>
> and a documentation here:
>
> https://home.regit.org/netfilter-en/using-nfqueue-and-libnetfilter_qu=
eue/
>>
>> Question #1:  If I have n threads performing recv's on this fd, am I
>> going to get complete packets atomically?  Are multiple simultaneous
>> recv's allowed? Or must this be handled with a single thread (and
>> doesn't this inherently limit the scalability of this)?
>
> One single thread per fd is the way to go.
>
>> Question #2:  If I have multiple queues (for example, using
>> --queue_balance 0:3), it appears that we only see the multiple queue=
s
>> in the call back (which I get to by registering the queue number and
>> the callback to the single nfqHandle using nfq_create_queue).  So is
>> the flow:  single threaded access to the nfqHandle, but once I get t=
o
>> the callback I can handle different nfq_q_handles in different
>> threads?  This seems to only allow packet processing, verdict
>> rendering etc. to be multi-threaded, but not the initial packet read=
=2E
>> Is this correct?
>>
>> Question #3:  It appears that --queue_balance 0:3 must relate to the
>> nfq_q_handles, not the nfq_handle.  Is this right?
>>
>> Ultimately I worry about how to get 10-20 Gbps through this interfac=
e
>> if I end up single-threaded on the initial receive (see Question #1)=
=2E
>> Is there a programming paradigm that allows the recv's to be handled
>> in multiple threads, across multiple CPUs?  For example, in "normal"
>> socket programming, content is distributed across the CPUs,
>> connections can be accepted in parallel, etc.  It would seem to me t=
o
>> be logical to allow the multiple queues specified with the
>> --queue_balance to be treated completely independently in the thread=
s.
>>  And while I am no kernel expert, don't most NICs now deliver the
>> packets across cores today (they certainly can distribute the
>> interrupts across cores).
>
> Latest kernel has cpu fanout support which allow to stay on the same =
CPU
> for a single queue. This way you can load balance flow on your networ=
k
> card and have the packet stay on the same core for treatment (if your
> userspace program is bound to the correct cpu).
>
> BR,
>
>>
>> -- Mike Kilian
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
