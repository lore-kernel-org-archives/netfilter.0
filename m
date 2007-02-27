From: Vincent Elderkamp <vincent@ducky.nl>
Subject: Re: FTP Problem
Date: Tue, 27 Feb 2007 16:58:58 +0100
Message-ID: <45E45542.2050104@ducky.nl>
References: <45E33904.4060103@ducky.nl>
	<000a01c75a48$7f786410$0b0ffe0a@NS006819>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000a01c75a48$7f786410$0b0ffe0a@NS006819>
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

Rob Sterenborg schreef:
>> Hi,
>>
>> I'm a new user for netfilter en doesn't have experience with it...
>>
>> I have written a simple firewall script in the past it works perfect,
>> but know the FTP section doesn't work at all....
>>
>> Maybe can somebody help me.
>>
>> Here is my code :
>>
>> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>> iptables -A INPUT -p tcp -i eth0 -s any/0 -d any/0 --dport 21 -j
>> ACCEPT iptables -A OUTPUT -p tcp -o eth0 -s any/0 --sport 21 -d any/0
>> ! --syn -j ACCEPT iptables -A INPUT -p tcp -i eth0 -s any/0 -d any/0
>> --dport 20 -j ACCEPT iptables -A OUTPUT -p tcp -o eth0 -s any/0
>> --sport 20 -d any/0 ! --syn -j ACCEPT 
> 
> Did you "modprobe ip_conntrack_ftp" and "modprobe ip_nat_ftp" ?
> 
> 
> Grts,
> Rob
> 
> 
> 
> 
> 

My machine is a Cobalt Raq 4

AMD K6 III 450 mHz

I think I have all the nessesary modules loaded...



--------------------------------------
Module                  Size  Used by
ipt_TOS                 6272  34
ipt_LOG                10496  17
iptable_nat            11652  0
xt_state                6272  4
xt_tcpudp               7168  185
xt_limit                6784  25
ip_nat_ftp              7424  0
ip_nat                 21420  2 iptable_nat,ip_nat_ftp
iptable_mangle          6912  1
iptable_filter          7168  1
ip_conntrack_ftp       11280  1 ip_nat_ftp
ip_conntrack           50356  5
iptable_nat,xt_state,ip_nat_ftp,ip_nat,ip_conntrack_ftp
ip_tables              18628  3 iptable_nat,iptable_mangle,iptable_filter
x_tables               19204  7
ipt_TOS,ipt_LOG,iptable_nat,xt_state,xt_tcpudp,xt_limit,ip_tables
ipv6                  251552  23
--------------------------------------

