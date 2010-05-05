From: Deborah Charan <dcharan@atcorp.com>
Subject: Multiple NFQUEUE numbers not quite working
Date: Wed, 05 May 2010 10:30:20 -0500
Message-ID: <4BE18F0C.1010906@atcorp.com>
Reply-To: dcharan@atcorp.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have the following which has been simplified, I do have checks ...

h6 = nfq_open();
nfq_unbind_pf(h6, AF_INET6);
nfq_bind_pf(h6, AF_INET6);
qh = nfq_create_queue(h6, 1, callback1, data);
qh2 = nfq_create_queue(h6, 2, callback2, data);
nfq_set_queue_maxlen(qh, MAX_QUEUELEN);
nfq_set_queue_maxlen(qh2, MAX_QUEUELEN);

if (nfq_set_mode(qh, NFQNL_COPY_PACKET, BUFSIZE) < 0) ||
            (nfq_set_mode(qh2, NFQNL_COPY_NONE, BUFSIZE) < 0) )
...
I am trying to get a multicast packet, I've tried both of the following:

ip6tables -A INPUT -d ff02::02 -j  NFQUEUE --queue-num 2
ip6tables -A INPUT -p udp --dport 1234 -j NFQUEUE --queue-num 2

I then look at the data that is received, even though ip6tables -L -v 
shows that it has processed the packet, I never get the packet in 
callback2, I do get the packets that should be queued for callback1.  If 
I change the queue-num for qh2 to the same as qh I do get the data.

So I'm guessing it is not a multicast issue, since if I change the 
queue-num to 1 for the rules, it seems to work?

All the calls to the nfq functions pass, I can work around it by using 
one queue and looking at the data, any ideas?  Is the problem that I 
don't copy the packet data?  I just want the headers.

Thanks,
Debbie Charan

