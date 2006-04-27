From: Maurice Volaski <mvolaski@aecom.yu.edu>
Subject: Re: iptables is complaining with bogus unknown error
 18446744073709551615
Date: Wed, 26 Apr 2006 21:12:38 -0400
Message-ID: <a06230901c075ca078b8d@[129.98.90.227]>
References: <200604210738.k3L7cBGO010103@mailgw.aecom.yu.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200604210738.k3L7cBGO010103@mailgw.aecom.yu.edu>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org, linux-kernel@vger.kernel.org

Automatic kernel module loading! That is an option and it's off by 
default. When it's off, attempts to load kernel modules are ignored 
internally, and that's why iptables was failing. It tried to load 
xt_tcpudp, but was ignored by the kernel.


>
>At least since 2.6.1.16.1, many calls to iptables no longer function
>at least under 64-bit x86, presumably due to a bug in the netfilter
>kernel code.
>
>The problem is still present in 2.6.17-rc2.
>
>The error from iptables is
>iptables: unknown error 18446744073709551615
>
>Examples of rules that give the error are
>
>1) iptables -A INPUT -i bond0 -s 129.98.90.0/24 -p tcp --dport 548 -j ACCEPT
>2) iptables -A INPUT -i bond0 -s 129.98.90.101/32 -p tcp --dport 497 -j ACCEPT
>3) iptables -A INPUT -i bond0 -s 129.98.90.227/32 -p tcp --dport 22 -j ACCEPT
>
>Example of a rule that does not give the error:
>1) iptables -A INPUT -i bond0 -p ICMP --icmp-type echo-request -s
>129.98.90.13/32 -j ACCEPT
>
>The computer is using IPv4 and not IPv6, which has not been compiled into the
>kernel.
>
>iptables is version 1.3.5.
>
>Kernel configuration related to iptables follows:
>



>lsmod shows
>xt_state                4928  0
>ipt_LOG                 8960  0
>ip_conntrack_ftp       10000  0
>ip_conntrack           57880  2 xt_state,ip_conntrack_ftp
>nfnetlink               8520  1 ip_conntrack
>iptable_filter          5440  0
>ip_tables              22168  1 iptable_filter
>x_tables               17800  3 xt_state,ipt_LOG,ip_tables
>

-- 

Maurice Volaski, mvolaski@aecom.yu.edu
Computing Support, Rose F. Kennedy Center
Albert Einstein College of Medicine of Yeshiva University

