From: Andrea Ratto <andrearatto@yahoo.it>
Subject: irc dcc incoming transfers truncated after a while
Date: Thu, 31 Mar 2005 13:13:58 +0200
Message-ID: <1112267638.21083.14.camel@localhost.localdomain>
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

Hello List!
I am running a SuSE based router and NAT gateway. It uses the
SuSEFirewall iptables based script, which saved me a lot of tweaking.
Everything works great except irc dcc file transfers. I am not talking
about uploads from internal network (those works because I use forwarded
ports) but about downloads. After a minute or so the firewall blocks
some packages killing the transfer.
Of course i have modprobed ip_nat_irc and ip_conntrack_irc that SuSE
didn't load by default, but the problem remains. So I was wondering if
there is something I still need to do (some iptables command to make use
of the modules?). I haven't found any doc so I am asking the list.
Thank very much. Bye




