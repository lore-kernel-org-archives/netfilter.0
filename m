From: cmbb@dslr.net
Subject: netfilter - DROP lists .. efficiency under DDOS?
Date: Mon, 14 Mar 2005 16:34:45 -0500
Message-ID: <98432234187.20050314163445@dslr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

I had an experience with a DDOS attack comprising some 10,000 IPs.
Adding them individually as INPUT DROPS did not work because after 5000
or so IPs, the box became too slow to pickup new packets from the card
quickly enough, so we replaced one problem (flood) with another (random
overruns on the card).

The traffic was about 6mbit of small packets (SYNs and tiny data
packets). About 10,000 packets per second.

The more DROPs, the less packets per second could be handled. Removing
all DROPS meant all packets could be handled .. although that just
pushed the problem onto apache.

My question is this .. how many DROPS can the latest netfilter
adequately cope with before impacting the PPS speed of the linux box?
Would -t raw have been a much better solution here?

My network driver was e1000.o with NAPI compiled. Kernel was latest 2.4
smp kernel. Machine was dual xeon with 2gb of memory. Nothing else of
consequence running on the box.

thanks


