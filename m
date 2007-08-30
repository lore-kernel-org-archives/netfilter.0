From: KARIM SATTAR <karimas@kfupm.edu.sa>
Subject: iptables: Unknown error 4294967295
Date: Thu, 30 Aug 2007 12:42:26 +0300 (AST)
Message-ID: <5418410.1188466946209.JavaMail.karimas@kfupm.edu.sa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

Hi

I am getting the error as mentioned below; the problem arose when I  
have changed the data structure of the ipt_entry which stores the rules 
 and other information. I have changed in the also other appropriate 
initialization of the structure in ip_nat_rule and other files.
I have just added one variable of type unsigned int. Can any one have 
idea regarding this problem.

Before adding this variable, iptables was working fine.
Can any one help me in this problem.

[root@localhost ~]# service iptables start
Flushing firewall rules: iptables: Unknown error 4294967295
iptables: Unknown error 4294967295
iptables: Unknown error 4294967295
iptables: Unknown error 4294967295
iptables: Unknown error 4294967295
iptables: Unknown error 4294967295
iptables: Unknown error 4294967295
                                                           [FAILED]
Setting chains to policy ACCEPT: raw iptables: Unknown error 4294967295
nat iptables: Unknown error 4294967295
mangle iptables: Unknown error 4294967295
filter iptables: Unknown error 4294967295
                                                           [FAILED]
Unloading iptables modules:                                [  OK  ]

All the modules have been loaded as permanent modules rather than as 
loadable modules.


