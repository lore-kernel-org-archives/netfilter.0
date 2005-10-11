From: Barry Fawthrop <barry@ttienterprises.org>
Subject: IP Vs DNS
Date: Tue, 11 Oct 2005 17:04:59 -0400
Message-ID: <434C28FB.3000805@ttienterprises.org>
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

Greetings all

with an IPTABLES ruleset you can specify an IP address to be allowed/blocked
iptables INPUT -s 12.12.12.12 -j ALLOW

But can this be done with a DNS name
iptables INPUT -s www.name.com -j ALLOW

since 12.12.12.12 may be www.name.com but it can also be
12.12.15.12 or 12.15.12.19
eg www.nasa.gov this address does vary depending on location and 
sometimes time of day
from a single point I can ping www.nasa.gov and get different IP 
addresses for it.

Yet I would like to allow access but preferably not to a whole range.
Also by allowing a DNS name then if a single IP addresses hosts many 
sites, I can be specific about the site?


Thanks in advance
B


-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.344 / Virus Database: 267.11.14/129 - Release Date: 10/11/2005


