From: "John Black" <black@arbbs.net>
Subject: iptables question.
Date: Tue, 17 Feb 2004 09:52:55 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <403238d7.275c.0@arbbs.net>
Reply-To: black@arbbs.net
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

I'm trying to install a gateway/router with Red Hat 9 kernel 2.4.24 and the stock
iptables 1.2.7, with full NAT compiled into the kernel. I have read the howto
at netfilter.org, even have the same line of code.  But it sill will not change
the source address.

here is the line of code and the result of the command <iptables -t nat -L -n>


iptables -t nat -A POSTROUTING  -o eth0 -j SNAT --to Ext_ip
target prot opt source     destination 
SNAT   all  --  0.0.0.0/0  0.0.0.0/0   to:Ext_ip

thanks
John 













http://www.arbbs.net/

