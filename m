From: aksingh@hss.hns.com
Subject: sysctl ip_queue_maxlen variable
Date: Thu, 15 Jul 2004 11:17:22 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFE5293A42.0467D741-ON65256ED2.001F2429@hss.hns.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@nl.linux.org
Cc: netfilter@lists.netfilter.org





Hi,

  how does the sysctl ip_queue_maxlen variable
work(net.ipv4.ip_queue_maxlen). This is used by the ip_queue.o module in
the kernel to queue packets that have to be sent to user land using netlink
sockets. I felt that this sysctl variable helped us define the max length
for the queue maintained by ip_queue.o, but when I looked at ip_queue.c ,
the value for the sysctl variable is stored at &sysctl_maxlen, where as
before enqueing a packet using the function __ipq_enqueue_entry, the
present len is compared against the variable queue_maxlen and not against
sysctl_maxlen, why is that so ?? so afterall is the queue max len
configurable ?? i have tried using sysctl from command line on
ip_queue_maxlen, it works fine and allows me to set it to any value
sizeof(int), but is this value usde somewhere inside ip_queue, I could not
find that in ip_queue.c ... any clues ??

regards
Amit
"DISCLAIMER: This message is proprietary to Hughes Software Systems Limited
(HSS) and is intended solely for the use of the individual to whom it is
addressed. It may contain  privileged or confidential information and
should not be circulated or used for any purpose other than for what it is
intended. If you have received this message in error, please notify the
originator immediately. If you are not the intended recipient, you are
notified that you are strictly prohibited from using, copying, altering, or
disclosing the contents of this message. HSS accepts no responsibility for
loss or damage arising from the use of the information transmitted by this
email including damage from virus."


