From: "Javier Govea" <jgovea@magma.ca>
Subject: Proxy Chaining
Date: Fri, 19 Sep 2003 11:36:31 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309191536.h8JFaV48002076@webmail2.magma.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi to all,

I want to setup a chain of proxies and I was wondering if this could be done with 
iptables. Any advice is very welcome. Here is more in detail what I want:

Host A needs to forward all traffic (http, ftp, icmp, ...) to Host B, which in turns 
forwards all traffic to Host C, which in turns forawards everything to its default 
gateway. The hosts do not belong to a LAN only A and B are in the same LAN. 

Is it possible to setup this kind of proxy chaining with iptables?? if so, any 
suggestions on how to do it?? if iptables is not the right tool to solve this problem, 
any suggestions on what can i use???

thanx to all in advance..
Xavier

