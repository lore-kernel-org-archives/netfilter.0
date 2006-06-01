From: Vasant Kumar <vasant63@yahoo.com>
Subject: Hello - problem with iptables out of memory : process killed
Date: Thu, 1 Jun 2006 09:47:04 +0100 (BST)
Message-ID: <20060601084704.91905.qmail@web53102.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,
     We have installed IPtables 1.2.7a which is a part
of REDHAT 9.0 on 
our system. 
   
  We are using the following rules to recieve IP
Packets in the USER 
space.
   
  iptables -A INPUT -p udp -m pkttype --pkt-type
mulitcast -j QUEUE
   
  We are using IP queue with stolen attribute to get
the full IP 
packets in the USER space.
   
  ipqueue_set_verdict(ipqhandle,
ipq_pointer->packet_id, NF_STOLEN, 0, 
NULL);
   
  We are running 2 video streams each of 1 Mbps. We
are able to receive 
the total IP packets from these 2 video streams. We
are observing a 
peculiar problem. After 25 minutes, we are seeing the
following message
   
  Out of memory: killing process xxx.
   
  It is killing all the process and logging off.
   
  This phenomenon is observed when run in multiuser
mode (init 3). 
   
  We have downloaded IPtables 1.3.5 from netfilter.org
and installed 
it.
   
  Here also the same phenomenon was observed.
   
  Pl. advise us whether we are making any mistake or
how this problem 
can be overcome?
   
   
  Thanks in advance.
   
  Have a wonderful day.
   
  With best wishes
   
  Vasant


Send instant messages to your online friends http://uk.messenger.yahoo.com 

