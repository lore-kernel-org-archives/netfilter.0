From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: FORWARD to a dynamica ip address (ADSL)
Date: Wed, 17 Aug 2005 16:52:06 -0500
Message-ID: <4303B186.6090908@riverviewtech.net>
References: <43031497.3090604@nobarrier.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43031497.3090604@nobarrier.co.za>
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

> how would a forward to add dynamic ipaddress (how would i tell iptables
> about the new number, what can I use)

I would recommend that you have your forward rule in a sub-chain of it's own.  This way you could write a fairly simple external daemon (shell script) that could flush the sub-chain and insert the new rule.  Or if you are really paranoid (not to mention the fact that there is DNS cache timeouts, if you are updating the pointer the old pointer is likely no longer valid, etc) you could insert the new pointer rule at the top of the sub-chain via "-I <sub-chain-name> 1 ..." and then subsequently delete all remaining rules in that sub-chain as it would be used for just that one rule.  This will effectively make it safe for a script to work with the chain with out fear of messing up other things in the firewall.

> can IPTABLES forward to a host name

No.  IPTables will only forward to an IP as far as I'm aware of.



Grant. . . .

