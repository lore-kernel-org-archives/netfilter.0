From: "Florian Effenberger" <floeff@arcor.de>
Subject: host names and IPs
Date: Fri, 18 Apr 2003 13:57:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003301c305a1$c04ab1a0$0500a8c0@effenberger>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi,

I have a question to the gurus on this list ;-)

I'm on Linux 2.4.20 with iptables 1.2.7a. I have a syntax as follows:

===
iptables -A INPUT -p tcp -s www.myhostname.com --dport 53 -j ACCEPT
===

Now it seems that www.myhostname.com is resolved only the first time the
rule is set and that a fixed IP address is stored.

However, www.myhostname.com has a dynamically assigned address and I would
like to have iptables resolve the IP address everytime.

Is that possible? If yes, how? Or will it produce too much load?

Thanks
Florian


