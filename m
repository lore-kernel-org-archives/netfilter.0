From: lumberjack@lumberjackvillage.com
Subject: DNAT, Is it possible to find the original destination?
Date: Mon,  1 Nov 2004 09:30:26 -0600
Message-ID: <1099323026.41865692986d5@email.ixwebhosting.com>
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

iptables 1.2.9 on SuSE 9.1

I am using iptables redirection to send things inbound to port 80 to 
localhost:8080:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to 8080

Is there any way that my application can look in the table and see the real 
destination?  I've seen several things in patch-o-matic that do things with 
conntrack but there doesn't seem to be any command, /proc or /dev entry 
available to query "i have a connection from host foo, iptables, who was foo 
really wanting to speak too?".

Thanks,
Jason







