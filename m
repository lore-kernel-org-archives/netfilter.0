From: Sylvie Colin <sylvie.colin@aql.fr>
Subject: ipq_read() error
Date: Thu, 20 Nov 2003 15:15:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FBCCC98.2070002@aql.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,
I am using libipq in a C++ program to intercept packets destined to a 
particular host at the Forward hook : the rule "iptables -A FORWARD -j 
QUEUE -d <IPdest>" is installed.
The program waits on multiple file descriptors using select() and, when 
input data gets available on the IPQ netlink socket, it gets the IP 
packet using ipq_read() and sets the verdict to NF_DROP. It works well 
except that sometimes ipq_read returns with the error IPQ_ERR_RECV 
"Failed to receive netlink message" and errno 105-ENOBUFS "no buffer 
space available". I've tried to change the kernel parameter 
net.ipv4.ip_queue_maxlen but it seems to have no effect: the entry 
/proc/net/ip_queue always shows a queue max length of 1024.
Environment: kernel 2.4.20, iptables[-devel]-1.2.6a
Could anyone explain me the reason of this error? Are any packets 
dropped when the error occurs? How can I solve it?
Thanks for help,
Sylvie


**************************************************************************************************
The contents of this email and any attachments are confidential.
It is intended for the named recipient(s) only.
If you have received this email in error please notify the system manager or  the 
sender immediately and do not disclose the contents to anyone or make copies.

** eSafe scanned this email for viruses, vandals and malicious content **
**************************************************************************************************


