From: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Subject: Re: Newbie: why is this packet being dropped/logged?
Date: Mon, 04 Aug 2003 17:08:33 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2E1481.7060907@mega-bucks.co.jp>
References: <3F2DEB07.1060801@mega-bucks.co.jp>	 <1059980959.926.1.camel@elendil.intranet.cartel-securite.net>	 <3F2E0B71.9010408@mega-bucks.co.jp>	 <1059982839.921.10.camel@elendil.intranet.cartel-securite.net>	 <3F2E1026.2040000@mega-bucks.co.jp> <1059984295.921.22.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1059984295.921.22.camel@elendil.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Cedric Blancher wrote:

> 
> This file is not a log. [sni]

Ah ... thanks for the explanation.

> Could you post an iptables-save output for your INPUT chain so we can
> have a complete ruleset description ?

Sure, here it is:

*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [29809:39495741]
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -d 203.179.86.66 -i eth0 -p tcp -m tcp --dport 80 -m state
--state NEW,RELATED,ESTABLISHED -j ACCEPT
-A INPUT -s 219.118.175.0/255.255.255.0 -d 203.179.86.66 -i eth0 -p tcp
-m tcp --dport 22 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p udp -m udp --dport 67 -j DROP
-A INPUT -p tcp -m tcp --dport 113 -j REJECT --reject-with tcp-reset
-A INPUT -p udp -m udp --dport 137 -j REJECT --reject-with
icmp-port-unreachable
-A INPUT -p udp -m udp --dport 138 -j REJECT --reject-with
icmp-port-unreachable
-A INPUT -p tcp -m tcp --dport 138 -j REJECT --reject-with
icmp-port-unreachable
-A INPUT -p udp -m udp --dport 139 -j REJECT --reject-with
icmp-port-unreachable
-A INPUT -j LOG --log-prefix "DROP:" --log-level debug
-A OUTPUT -o lo -j ACCEPT
COMMIT


> It is a bit redundant with previous rule that allows ESTABLISHED and
> RELATED packets, whatever source, destination and protocol they may
> have. So, ESTABLISHED HTTP packets to 203.179.86.66 would not reach your
> rule, being accepted by previous one. Moreover, RELATED is useless, as
> HTTP does not have related connections such as FTP or IRC.

Ok. So I guess NEW is all I need and RELATED and ESTABLISHED are
unnecessary.

Jean-Christian Imbeault


