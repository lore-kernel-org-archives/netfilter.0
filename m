From: Erico Augusto <linux_kernel26@yahoo.com.br>
Subject: Reject all the interfaces
Date: Wed, 22 Dec 2004 00:23:47 -0300
Message-ID: <1103685827.9049.23.camel@che>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi,

I had the simple task to block the connection of 3 workstation(loopback
and eth0) after a certain hour. So, I decided to put the single rule:

iptables -I OUTPUT -j REJECT --reject-with icmp-host-prohibited

After that, a friend of mine told me the following:

It's better to reject the eth0 only, because, with the rule above, I'm
blocking the loopback also, and the services that depends on that
"interface", such as all the unix sockets based applications.

That is my doubt. I read a lot of documentation about the netfilter
architecture, but there is that gap of knowledge. The documentation
never speaks about the differences between unix and tcp sockets.

Instead of search directly in google,I decided to ask here in netfilter
list: Where can I find that kind of information(nefilter x unix/tcp
sockets)?

Thanks,

Erico.




