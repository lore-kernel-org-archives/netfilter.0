From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: nfq_get_packet_hw
Date: Fri, 04 Dec 2015 15:49:55 -0500
Message-ID: <0NYU00IFOPV7ZOX0@vms173019.mailsrvcs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am in the process of replacing libipq with libnetfilter_queue.
in my old software I had:

int messagetype = ipq_message_type(buf);

which I used to confirm I got an ip packet.  How can I do
that with the new software?

Thanks,
Mike.
--
Michael D. Berger
m.d.berger@ieee.org
http://www.rosemike.net/
 

