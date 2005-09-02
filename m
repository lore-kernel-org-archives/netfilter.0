From: Kirk Hoganson <kirk2@lenderlab.com>
Subject: Multiple SNAT source address ranges
Date: Fri, 02 Sep 2005 12:44:55 -0600
Message-ID: <43189DA7.2040604@lenderlab.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I am attempting to create SNAT rules that will round-robin through a 
series of addresses from different ranges as per the man page. 
Apparently I am making mistakes with the syntax, as running my script 
results in some errors.  Can someone tell me how I need to structure 
these rules?  Here are some examples of what I have tried:

$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp 
--dport 80 -j SNAT  --to-source 24.28.18.56 --to-source 24.28.18.57 
--to-source 24.28.18.58

Or:

$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp 
--dport 80 -j SNAT  --to-source 24.28.18.56-24.28.18.63 --to-source 
16.7.15.32-16.7.15.39 --to-source 16.7.87.64-16.7.87.71

How do I specify more than one source address from seperate ranges?

