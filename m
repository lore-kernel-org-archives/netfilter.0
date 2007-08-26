From: Amir Perlman <amirp@oversi.com>
Subject: Accept packets when QUEUE is down
Date: Mon, 27 Aug 2007 00:38:42 +0300
Message-ID: <46D1F2E2.3030301@oversi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,


I have an application that monitors packets being forwarded through the 
machine using a simple rule in the iptables.


Chain FORWARD (policy ACCEPT)
target   prot opt source               destination
QUEUE      all  --  anywhere             anywhere


When the application is down (or queue is full) all packets will be 
dropped. For a specific application that I have, I need the opposite 
behavior so by default packets will be accepted and not dropped in the 
case the user space application fails to pick them off the queue. Is 
there a way I can configure the kernel in a way that it will accept 
packets when the application fails to clear packets from the QUEUE 
instead of dropping them ?


Thanks in advance


-Amir



