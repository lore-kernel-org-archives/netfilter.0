From: icovnik <icovnik@gmail.com>
Subject: NFLOG with threads
Date: Tue, 16 Jan 2018 09:28:07 +0100
Message-ID: <CA+ZTgCsnZQgmWCKzTdW5QqfLwNDpj09syhnh8Y-HnF2iq605rA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=IvUS+00gU8gEgIDxsDQj4feAJyLgLBpK6T6XYe7GrUw=;
        b=ZPY/PMUzTmAJlonisZ/1OQEkr0ecmrjYyPA9Wm1mpoXNQmEDU/sr372ZvRLe+ug4h9
         7VBsKRbQx/3ldc9Wlf/S0256DWnsNY3okafHqKUMiSzKv3JIsPcgcJpEwjr7ltikSm62
         Sgu0yQFGVEK/Oax0mhS1o0JKIsyyk2Qje7FRdsm+63fNVv81ozmGG9kdcmK1mU5sfj/o
         FwyHBfIdCbEaH2/qedEK7jyn6h1Uqvx1+GuWwHIb+KaQDrs9nvde4tuoVEelFSNoPR8m
         /XkFANd6CgQ0iyI+4aCGMHqkDLaH2pXOCWErqUro6ASZNkay1ZcPobk4SHLMnylTYbb6
         U3RQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I am trying to create some IP accounting software based on NFLOG /
libnetfilter_log. When I started to use threads (to spread load to
multiple CPUs) I got some strange behavior. The logic of my
application is like this:

1. "capture" packets with iptables:

iptables -t mangle -F
iptables -t mangle -A POSTROUTING -j NFLOG \
    --nflog-group 5 --nflog-range 60 --nflog-threshold 1
iptables -t mangle -A PREROUTING -j NFLOG \
    --nflog-group 6 --nflog-range 60 --nflog-threshold 1

2. in C source create 2 threads, attach each thread to its nflog group:

    int g = 5; // or 6 for the other thread
    if (!(h = nflog_open())) exit(1);
    if (nflog_bind_pf(h, AF_INET) < 0) exit(1);
    if (!(gh = nflog_bind_group(h, g))) exit(1);
    nflog_set_nlbufsiz(gh, NFLOG_BUFFER_SIZE);
    if (nflog_set_mode(gh, NFULNL_COPY_PACKET, PACKET_BYTES_COPIED) < 0)
        exit(1);
    fd = nflog_fd(h);

    if (g == 5) {
        nflog_callback_register(gh, &got_packet5, &g);
    } else if (g == 6) {
        nflog_callback_register(gh, &got_packet6, &g);
    }

    printf("main loop %d\n", g);

    while (1) {
        if ((rv = recv(fd, buf, 0xffff, 0)) <= 0) {
            perror("recv()");
            exit(1);
        }
        printf("recv %d\n", g);
        fflush(stdout);
        nflog_handle_packet(h, buf, rv);
    }

3. test:

I tried to ping some host to get few nice packets, outgoing packets
should be captured with group 5, incoming with group 6. In main loop I
get nice output of "got 5"s and "got 6"s. Everything works nicely.

4. The problem:

When testing (practically run from terminal, wait 5 sec, ^C, run
again, ... etc) and getting all that "got XY"s, the callback functions
get called back in 3 different ways. As far as I can tell the program
run that way until I kill it:

- only got_packet5 gets called for all outgoing packets, got_packet6
is never run

- the other way - got_packet6 called for all incoming packets, no got_packet5

- sometimes everything works as you would imagine - got_packet5 is
called for every "got 5" and got_packet6 for every "got 6".

So my questions:

- Am I doing someting wrong? I stripped the C source to absolute
minimum to show what am I doing.

- Is the callback mechanism of NFLOG thread-safe? Should this work?

- Is there some recommended way to get multiple NFLOGs into threaded program?

Thank you.

ico
