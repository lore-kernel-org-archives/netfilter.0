From: "Sascha Reissner" <sascha.reissner@toxicnet.de>
Subject: Re: iptable woes
Date: Tue, 22 Apr 2003 01:28:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002201c3085d$af6246a0$026410ac@honor>
References: <9EC6A5A6B11DA843A551CC9AD9323FAC3014@exchange.musicreports.com>
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
To: "James D. Parra" <JamesP@MusicReports.com>, "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

# (6) PREROUTING chain rules
iptables -t nat -A PREROUTING -i eth1 -p tcp --sport 80 -d PUB.XXX.XXX.XXX
--dport 80 \
-j DNAT --to-destination PVT.XXX.XXX.XXX:80

get that -sport 80 out of that rule above, http requests rarely originate
from port 80 ;)



