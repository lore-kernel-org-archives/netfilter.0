From: Marco <marco.nicoloso@fastwebnet.it>
Subject: Re: Iptables fails on -m state --state!
Date: Fri, 18 Feb 2005 21:16:21 +0000
Message-ID: <42165B25.3010800@fastwebnet.it>
References: <4214DD69.50903@fastwebnet.it>
	<49063.142.169.215.10.1108661774.squirrel@142.169.215.10>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <49063.142.169.215.10.1108661774.squirrel@142.169.215.10>
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
To: Samuel Jean <sj-netfilter@cookinglinux.org>
Cc: netfilter@lists.netfilter.org

Samuel Jean wrote:

>On Thu, February 17, 2005 1:07 pm, Marco said:
>  
>
>>Hi there,
>>
>>even if the corresponding module is built into the kernel and loaded,
>>iptables fails (No chain/target/match with that name, or something like
>>that).
>>
>>What can I do?
>>    
>>
>
>Please show us the output of :
>
>cat /proc/net/ip_tables_matches | grep state
>
>And show us the rule you did input.
>
>  
>
>>Thanks
>>
>>Marco Nicoloso
>>
>>
>>    
>>
>
>Best regards,
>Samuel
>
>
>  
>
cat /proc/net/ip_tables_matches | grep state doesn't return anything but 
the contents of ip_tables_matches are:

tcp
udp
icmp

while the rules are (I post my script entirely):
#!/bin/bash
/sbin/iptables -v -P INPUT DROP
/sbin/iptables -v -P OUTPUT DROP
/sbin/iptables -v -P FORWARD DROP
/sbin/iptables -v -N bad_tcp_packets
/sbin/iptables -v -N allowed
/sbin/iptables -v -N tcp_packets
/sbin/iptables -v -N udp_packets
/sbin/iptables -v -N icmp_packets
/sbin/iptables -v -A bad_tcp_packets -p TCP --tcp-flags SYN,ACK SYN,ACK 
-m state --state NEW -j REJECT --reject-with tcp-reset      #Fails
/sbin/iptables -v -A bad_tcp_packets -p TCP ! --syn -m state --state NEW 
-j LOG --log-prefix "New not syn:"                                      
#FAILS
/sbin/iptables -v -A bad_tcp_packets -p TCP ! --syn -m state --state NEW 
-j DROP   #FAILS
/sbin/iptables -v -A allowed -p TCP --syn -j ACCEPT
/sbin/iptables -v -A allowed -p TCP -m state --state ESTABLISHED,RELATED 
-j ACCEPT      #FAILS
/sbin/iptables -v -A allowed -p TCP -j DROP
/sbin/iptables -v -A tcp_packets -p TCP -s 0/0 --dport 21 -j allowed
/sbin/iptables -v -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed
/sbin/iptables -v -A tcp_packets -p TCP -s 0/0 --dport 80 -j allowed
/sbin/iptables -v -A tcp_packets -p TCP -s 0/0 --dport 113 -j allowed
/sbin/iptables -v -A udp_packets -p UDP -s 0/0 --source-port 53 -j ACCEPT
/sbin/iptables -v -A udp_packets -p UDP -s 0/0 --source-port 2074 -j ACCEPT
/sbin/iptables -v -A udp_packets -p UDP -s 0/0 --source-port 4000 -j ACCEPT
/sbin/iptables -v -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
/sbin/iptables -v -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT
/sbin/iptables -v -A INPUT -p ALL -i eth0 -s 192.168.0.240/28 -j ACCEPT
/sbin/iptables -v -A INPUT -p ALL -i lo -j ACCEPT
/sbin/iptables -v -A INPUT -p UDP -i eth0 --dport 67 --sport 68 -j ACCEPT
/sbin/iptables -v -A INPUT -p ALL -i eth1 -m state --state 
ESTABLISHED,RELATED -j ACCEPT   #FAILS
/sbin/iptables -v -A INPUT -p TCP -i eth1 -j tcp_packets
/sbin/iptables -v -A INPUT -p UDP -i eth1 -j udp_packets
/sbin/iptables -v -A INPUT -p ICMP -i eth1 -j icmp_packets
/sbin/iptables -v -A INPUT -m limit --limit 3/minute --limit-burst 3 -j 
LOG --log-level DEBUG --log-prefix "IPT INPUT packet died: "   #FAILS
/sbin/iptables -v -A FORWARD -p tcp -j bad_tcp_packets
/sbin/iptables -v -A FORWARD -i eth0 -j ACCEPT
/sbin/iptables -v -A FORWARD -m state --state ESTABLISHED,RELATED -j 
ACCEPT   #FAILS
/sbin/iptables -v -A FORWARD -m limit --limit 3/minute --limit-burst 3 
-j LOG --log-level DEBUG --log-prefix "IPT FORWARD packet died: "   #FAILS
/sbin/iptables -v -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
/sbin/iptables -v -A OUTPUT -p ALL -s 14.0.217.49 -j ACCEPT
/sbin/iptables -v -A OUTPUT -p ALL -o eth1 -j ACCEPT
/sbin/iptables -v -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j 
LOG --log-level DEBUG --log-prefix "IPT OUTPUT packet died: "   #FAILS



