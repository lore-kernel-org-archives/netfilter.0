From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: How to confirm the packet received is IP
Date: Fri, 04 Dec 2015 21:03:00 -0500
Message-ID: <0NYV00F7D4D1D380@vms173021.mailsrvcs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

My apologies for my previous post with a bad title.  I am correcting it
here.

I am in the process of replacing libipq with libnetfilter_queue.
In my old software I had:

int messagetype = ipq_message_type(buf);

which I used to confirm I got an ip packet.  How can I do
that with the new software?

Thanks,
Mike.

--
Michael D. Berger
m.d.berger@ieee.org
http://www.rosemike.net/
 

