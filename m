From: Alex Satrapa <alex@lintelsys.com.au>
Subject: Handling Large Numbers of Interfaces?
Date: Mon, 15 Dec 2003 13:40:53 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FDD1F35.8080703@lintelsys.com.au>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

With tc, I can attach traffic control rules to interfaces. Thus when I 
have 1000 customers connected through my L2TP ISP, I can have 1000 
different sets of rules, each of which is only invoked when traffic 
actually is queued to go over that particular interface.

I can't do the same thing with iptables. The closest I can get is to 
list all 1000 interfaces in one table, with instructions to jump to a 
custom table for each interface. This is undesirable, since each packet 
would be matched against an average of 500 rules before getting to the 
"custom ruleset" that it is supposed to be checked by.

Is there a way to either attach table to an interface, or provide a 
means to jump to one of a set of tables based on interface name?

eg:

iptables -A FORWARD -i ppp+ --lookup-jump fwd-out

Given tables fwd-out-ppp0, fwd-out-ppp1, ..., fwd-out-pppN, that rule 
would jump directly to the required table.

Am I asking the wrong question?  How to other people handle rulesets for 
large numbers of interfaces? Is the ISP's router not the place to be 
offering custom filtering as a value-added service?



