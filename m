From: tednolan@bellsouth.net
Subject: Very basic question about nfqnl_test.c
Date: Thu, 18 Feb 2010 00:15:17 -0500
Message-ID: <D7.B9.02874.F5DCC7B4@cdptpa-omtalb.mail.rr.com>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I am completely new to netfilter and libnetfilter_queue.  I was looking for
a way to examine and release network packets, and google and Wikipedia
eventually led me to libnetfilter_queue.

I found the references to the APIs, and it didn't seem too bad, so I started
to write a simple test program, then noticed nfqnl_test.c which seems to
be the "official" simple test program and decided to play with that instead.

I have tried this on a number of different versions of Ubuntu Linux with
several versions of libnetfilter_queue with the same (negative) results.

This particular sequence of events is on ubuntu-9.04-desktop-i386

(uname -a ==
	Linux attrib 2.6.28-18-generic #59-Ubuntu SMP \
	Thu Jan 28 01:23:03 UTC 2010 i686 GNU/Linux
)

I have used the synaptic package manager to install

	libnetfilter_queue1 0.0.16-1
	libnetfilter_queue1-dbg 0.0.16-1
	libnetfilter_queue1-dev 0.0.16-1

I am using the nfqnl_test.c from the libnetfilter_queue-0.0.16/utils
directory.

I can compile with no problem:

	ted@host:~$ gcc -Wall nfqnl_test.c -lnetfilter_queue
	ted@host:~$ 

But when I run the program, this is what I get:

	ted@host:~$ sudo ./a.out
	opening library handle
	unbinding existing nf_queue handler for AF_INET (if any)
	binding nfnetlink_queue as nf_queue handler for AF_INET
	binding this socket to queue '0'
	setting copy_packet mode

The program seems to set up OK, but it then hangs on the recv() loop.
My understanding is that I should be seeing printf() output from the
callback function every time an IPV4 packet is seen, but I can telnet
out to different ports, ping different things etc, and nothing ever
is printed by the test program.

Am I missing some very basic setup step like manually loading some
module?  Am I mistaken in thinking I should be seeing gobs of output
here?

			Thanks,

			Ted
