From: Lists <lists@nyc.rr.com>
Subject: Firewall suggestions needed
Date: 27 Oct 2003 19:12:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067299953.20617.3.camel@bluedevil2>
References: <FDAFEC98D318F74CA26B5A26F2B4965227C54E@exchange.jfctechnologies.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDAFEC98D318F74CA26B5A26F2B4965227C54E@exchange.jfctechnologies.com>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


Is there a firewall program that reads and writes firewall rules using
iptables?  By this I mean that it uses the rules stored in netfilter,
and doesn't first store rules in its own memory and then translate those
into iptables commands.  This would allow it to see any rule changes
made by external programs that run iptables commands.

Thanks for your help.

Apologies if this is a duplicate.



