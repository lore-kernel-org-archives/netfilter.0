From: Scott MacKay <scottmackay@yahoo.com>
Subject: RHEL 4.5 + brigde + sample QUEUE app=panic
Date: Tue, 11 Mar 2008 07:52:03 -0700 (PDT)
Message-ID: <984706.6721.qm@web52412.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, I have a 64bit system, RHEL 4.5.
I can get more details if needed.
It has the modular ip_queue, netfilter headers, bridge
control package and the like.
For my queue program, I had to get the source for
1.2.11 (the version indicated in the rpm).

I compiled the sample QUEUE from the manpages.
The 2 differences:
1.  I printf the indev and outdev
2.  my verdict returns the payload (m->data_len,
m->payload) from the ipq_get_packet()) as in the end I
want to mangle the packet (but do not in this example)

I added the hooks:

iptables -t mangle -A PREROUTING -i br0 -j QUEUE
iptables -t mangle -A POSTROUTING -o br0 -j QUEUE

I make my br0 bridge from eth0 to eth1.
I modprobe the ip_queue.
So I have the section:
case IPQM_PACKET:
ipq_packet_msg_t *m=ipq_get_packet(buf);
status=ipq_set_verdict(h,m->packet_id,NF_ACCEPT,m->data_len,
m->payload);


I get the expected stream of messages from the test
app but it will, invariably and relatively fast, cause
the system to lock up completely, keyboard LEDs
flashing.

I did go in and remove the payload return (0,NULL) and
it actually seems to be running just fine, a concern
since I need to alter the payload data in the end. 

Does anyone have thoughts as to why I panic when
returning the same payload?

-Scott



      ____________________________________________________________________________________
Looking for last minute shopping deals?  
Find them fast with Yahoo! Search.  http://tools.search.yahoo.com/newsearch/category.php?category=shopping
