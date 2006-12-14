From: jwlargent <jwlargent@vlsmaps.com>
Subject: Shouldn't this rule catch all packets
Date: Thu, 14 Dec 2006 13:16:01 -0600
Message-ID: <4581A2F1.10305@vlsmaps.com>
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
To: NetFilter <netfilter@lists.netfilter.org>

I was trying to debug some errors in my iptables setup so I added the 
following rules to my OUTPUT, just to see what packets were going out.

iptables -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -j ACCEPT

When I do iptables -L OUTPUT -v it shows some packets are falling 
through to the last rule.
Shouldn't the first rule catch all the packets?

Jeff

