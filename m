From: CC commmunication <commdsl@yahoo.com>
Subject: --syn and NEW are same ? or ?
Date: Sun, 28 Aug 2005 01:55:50 -0700 (PDT)
Message-ID: <20050828085550.39600.qmail@web30205.mail.mud.yahoo.com>
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

Hi
I am a bit confused aobut SYN, ACK and New and Established. Please increase my knowledge by giving you little from important time. I will be very thankful for the kind consideration.
 
is there any difference between chechking --SYN  or using  NEW in iptables command,  as well as is there any difference between --ACK and Estalished ,
i am asking in the sence that , if state of TCP packet can be matched with the checking FLAG bits in tcp header then wts  new in ,,, NEW,ESTABLISHED, RELATED, 
 
 
I can just find that NEW works to check the on the following link , 
(
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -A INPUT -p tcp --dport 22 --syn -m state --state NEW -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
 
will allow ssh connections to your firewall, and gives you the benefit of 
checking both NEW state and the SYN flag.will allow ssh connections to your firewall, and gives you the benefit of 
checking both NEW state and the SYN flag.
 
http://archives.free.net.ph/message/20020724.124732.c3fdc39e.en.html )
 
Where as in netfilter hot to is says (
 

NEW 
   
A packet which creates a new connection.

ESTABLISHED 
   
A packet which belongs to an existing connection (i.e., a reply packet, or outgoing packet on a connection which has seen replies).)

   
And further more in (

   
Taming the Wild Netfilter http://www.linuxjournal.com/article/4815

   
It says  As for the ESTABLISHED, RELATED, NEW and INVALID arguments, they are more than they appear to be. ESTABLISHED permits traffic to continue where it has seen traffic before in both directions. ESTABLISHED obviously applies to TCP connections but also to UDP traffic, such as DNS queries and traceroutes as well as ICMP pings. In fact, packets are first checked to see if the connection exists in the connection tracking table (/proc/net/ip_conntrack). If so, the chains aren't run, the original rule is applied and the packets pass. In some cases, Netfilter is faster than its predecessor because of this check. The RELATED argument covers a multitude of sins. This argument is applied to active FTP, which opens a related connection on port 20, but also applies to ICMP traffic related to the TCP connection. The NEW argument applies to packets with only the SYN bit set (and the ACK bit unse
 t). The INVALID applies to packets that have invalid sets of options, as in an XMAS tree scan.

   
) 

   
Please explain as  i want to know is what is more in NEW , Establishe drather than just checking SYN and ACK flags in tcp header... or does it maintains a state table itself, containing source and estination ip addresses and ports to track the connections passing through...


 
 
		
---------------------------------
 Start your day with Yahoo! - make it your home page 
