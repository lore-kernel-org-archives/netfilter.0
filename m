From: "Peter Marshall" <peter.marshall@caris.com>
Subject: ipchains question
Date: Mon, 26 Apr 2004 15:13:13 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <055f01c42bba$23cbb280$49caa8c0@caris.priv>
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

I know this is mostly iptables ... but I have a small question for ipchains
(and yes, I know iptables are better and I use them in most places, I just
have not had time to upgrade one of my servers and I need a rule in place).

Is there a way to do DNAT type functions with ipchains ?  When a connection
hit my firewall from the outside from a specified IP and port, I want to
change its destination and port and allow it in.

Please let me know if this is possible.  Thank you for the help.
Peter




