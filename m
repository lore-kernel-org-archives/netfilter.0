From: Monty Ree <montyree2@yahoo.com>
Subject: iptables performance and Dual CPU
Date: Wed, 1 Nov 2006 16:33:53 -0800 (PST)
Message-ID: <20061102003353.36438.qmail@web56115.mail.re3.yahoo.com>
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

Hello...

I have tested iptables using bridge mode.
 
linux centos 3.x 
        kernel 2.6.x 
        Opteron dual CPU 
        2G RAM 
        conntrack enabled 

When I generating lots of of packets throught
iptables, 
one CPU upto 100% but the other CPU just idle..
and the performance degrades... 

As I know the performance of the iptables has
relations with CPU.
But, dual CPU can't help with iptables?
If I set dual bridge, can use dual CPU? 

Anyone who can provide me with some information 
about how to configure SMP system, 
so that both processors share the traffic load??


Thanks... 



 
____________________________________________________________________________________
Get your email and see which of your friends are online - Right on the New Yahoo.com 
(http://www.yahoo.com/preview) 


