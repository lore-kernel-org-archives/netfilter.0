From: jonathan <support-squid@bfinance.fr>
Subject: ippool problem
Date: Wed, 07 Dec 2005 13:44:18 +0100
Message-ID: <1133959458.3300.21.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi, 
I am in trouble because I want to migrate checkpoint firewall rules to
iptables. 

The problem is that checkpoint works with address lists and iptables
seems not. 
So is there a way to add a single rule with several IP address for the
source and for the destination ? 

Is there something like IP groups or IP lists or address pool on
iptables ? 

well , I have just found a tool named "ippool", it seems to be the
solution, but I am running iptables-1.3.4 under a kernel 2.6.14 and
according to patch-o-matic info file, this patch only works for kernel <
2.6.10.

What must I do ? Is there something for replacing this tool ?

thanks to help me,
jonathan


