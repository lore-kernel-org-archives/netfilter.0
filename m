From: <jwebb@korrnet.org>
Subject: Proxies
Date: Wed, 17 Dec 2003 08:32:52 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <32916.66.4.149.1.1071667972.squirrel@www.korrnet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Hello,

I'm using iptables for a firewall on a school network.

Recently we've noticed a couple of users trying to use proxies to bypass
our filtering.  Ordinarily this is no problem, as we're blocking standard
proxy ports.  However, some users have wised up and started using proxies
on port 80.

We've been blocking based on port, and obviously we can't block all of
port 80 outbound.  Is there any way to block a proxy on port 80 and still
have it be transparent to the users?

The only thing I can think of would be string matching, which I've added. 
But it's my understanding that this really slows things down for one, and
also I wouldn't know how to go about finding the string(s) I need to
block.

Any ideas?  Thanks!



