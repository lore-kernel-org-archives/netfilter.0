From: Nick Martin <martinn6@cs.man.ac.uk>
Subject: recv on nfq_fd receiving wrong number of bytes
Date: Wed, 18 Feb 2009 18:52:14 +0000
Message-ID: <499C58DE.4030109@cs.man.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

The situation is:
I have a test set up that sends a UDP packet containing "Hello" to a 
host. There is a rule that queues traffic to this host. Using wireshark 
when sending such a packet when it is not being queued shows that it 
should be either 48,34,20, or 6 bytes long (depending on which parts of 
the frame are received from a netfilter_queue fd, maybe somebody could 
explain that to me?).

The problem is:
recv returns 4 when receiving from the socket, which is too small to be 
anything. It only returns 4 when a packet it queued. When no packet is 
queued it returns -1 and sets errno to EAGAIN.

I'm obviously doing something wrong but I don't know what. This is what 
I've done before I call recv():
1) open a connection to netfilter_queue with nfq_open()
2) unbind, then bind the connection to AF_INET
3) create a queue (queue 0)
4) set the mode to NFNL_COPY_PACKET
5) get a file descriptor for the netfilter_queue connection
6) allocate space for my packet and payload buffers
7) recv from the socket

Here's my code:
http://pastebin.com/m5c702182

And the test script I'm using:
http://pastebin.com/m63ad9715

If anybody has any ideas what might be going on or any good ways to find 
out whats going on I'd appreciate it. Thanks for any help guys.

Regards,

Nick Martin
