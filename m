From: Mike Lancaster <mikelancuk@yahoo.co.uk>
Subject: random and ipt_random.h
Date: Mon, 19 Jun 2006 13:22:36 +0200 (CEST)
Message-ID: <20060619112236.67156.qmail@web25307.mail.ukl.yahoo.com>
Reply-To: Mike Lancaster <mikelancuk@yahoo.co.uk>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Background 
I'm trying to set up iptables to drop a percentage of packets and forward the rest.  The random modules seems to be the way to do this. 
 
Problem 
When I try adding a rule I get the following; 
iptables -A INPUT -p icmp --icmp-type echo-request -m random --average 50 -j DROP 
iptables v1.2.11: Couldn't load match `random':/lib/iptables/libipt_random.so: cannot open sharedobject file: No such file or directory 
Versions I've tried this on are; kernel=2.6.15-1 + iptables=1.3.3, kernel=2.6.9-34 + iptables=1.2.11. 
 
Some digging 
According to iptables/extensions/.random-test 
#!/bin/sh 
# True if random is applied. 
[ -f $KERNEL_DIR/include/linux/netfilter_ipv4/ipt_random.h ] && echo random 
The random extentsion is only built in if ipt_random.h is present in the kernel source. 
I can't find any reference to ipt_random.h for the 2.6 kernel. 
 
Anyone any ideas what I could try next? 
 
Thanks,  
Mike 
 
 






