From: KARIM SATTAR <karimas@kfupm.edu.sa>
Subject: Netfilter/Iptables Architecture
Date: Sun, 26 Aug 2007 02:57:47 +0300 (AST)
Message-ID: <673315.1188086267785.JavaMail.karimas@kfupm.edu.sa>
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
Currently I am studying the architecture of netfilter/iptables and 
unfortunately I didnt find much information regarding them. Although 
different articles (such as produced by Russel and other authors) have 
given me the idea to dig more into the Linux firewall.

I have three questions related to the architecture of the 
netfilter/iptables; and if any one can answer it in a little bit 
detailed then I will be very grateful.

1) Through the article "The journey of a packet through the Linux 
2.6.10 network stack" by Harald Welte; I have an idea of how packet has 
been traversed and captured by the different NF hooks. Similarly though 
different papers and a book named Understanding LINUX Network 
INTERNALS; I have found the other part i.e. regarding iptables part 
that how the rules are being saved in a link list and how ipt_do_table 
and other functions have been called and do the operations etc. But I 
didnt find the interconnection between the two architectures. I Meant 
to say that e.g. if NF_HOOK using NP_IP_LOCAL_IN has been called in the 
ip_local_deliver function; <---> ipt_hook (which has been registered 
during initialization)  it will call ipt_do_table. There should be a 
bridge which I have tried to discover but didnt find much.

I am thinking now that either my finding is wrong or there is some 
other function calls or message passing between the two architecture.

2) I have first analyzed the code of iptables which comes with the 
standard kernel; in which I have found the detailed code of iptables 
under ip_tables.c iptables_filter.c etc but when I have downloaded the 
new version of iptables from the website; that one is totally different 
from the one implemented in the Linux Kernel. 

Is the code which is on the website is related to the iptables 
implementation in the user space as I have get this information after 
looking different library files in the package which I have downloaded 
from the website.

3) During the reboot of the system; service iptables has been started 
but I didnt find any service/daemon when I have seen the TOP or ps 
command. 
I want to know that when the init.d started the services so when the 
service iptables started; does the script enable the different hooks 
for the iptables to work.

Thanks for the patience for reading my questions. Although I am not new 
to Linux but to the implementation of it on the Kernel level.

Regards
Karim Asif Sattar

