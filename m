From: Edward Shornock <ed@crazeecanuck.homelinux.net>
Subject: Re: blocking all trafic exapt selcter ports
Date: Sat, 23 Apr 2005 05:20:24 -0400
Message-ID: <426A1358.4000106@crazeecanuck.homelinux.net>
References: <a3f524e05042301477b3598d3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a3f524e05042301477b3598d3@mail.gmail.com>
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

Kashif Ali Bukhari wrote:
> i want to block all inbod access to my linux box and want to allow
> dns, http proxy,ssh,telnet,and ftp 
> how can i do this 
> 


First, please see
http://www.catb.org/~esr/faqs/smart-questions.html

iptables -A INPUT -p tcp --dport  21 -j ACCEPT
iptables -A INPUT -p tcp --dport  22 -j ACCEPT
iptables -A INPUT -p tcp --dport  23 -j ACCEPT
iptables -A INPUT -p tcp --dport  53 -j ACCEPT
iptables -A INPUT -p tcp --dport  3128 -j ACCEPT
iptables -P INPUT DROP


or if you compile your kernel/iptables with multiport support

iptables -A INPUT -m multiport -p tcp --dports 21-23,53,3128 -j ACCEPT
iptables -P INPUT DROP

A classic RTFM/STFW case, nonetheless...

