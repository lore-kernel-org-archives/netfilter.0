From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Chain Policy DROP versus ACCEPT and logging
Date: Sun, 12 Oct 2003 10:00:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065967220.5801.10.camel@tarkus>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

I have seen many setups where the default CHAIN Policy is to accept
packets by default versus dropping them. 
From my perspective a firewall should implicitly deny everything, hence 
INPUT and FORWARD should be DROP. 
Then rules are put in to allow what you want. 
But, one seems to lose some logging capabilities with such a setup.
Is their a way to log the default INPUT and FORWARD policies for dropped
packets with them set to DROP as opposed to having them set to ACCEPT
and putting in logs for any deny rules.

Thanks,
Ted



