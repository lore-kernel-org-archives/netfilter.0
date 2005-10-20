From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: blocking traffic between two internal interfaces ?
Date: Thu, 20 Oct 2005 06:11:17 +0200
Message-ID: <36361.8196141489$1129781539@news.gmane.org>
References: <200510192240.12970.rob0@gmx.co.uk>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510192240.12970.rob0@gmx.co.uk>
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
To: '/dev/rob0' <rob0@gmx.co.uk>, netfilter@lists.netfilter.org


On Wednesday 2005-October-19 22:07, Seferovic Edvin wrote:
> I have two internal interfaces ( eth1 // 172.19.0.0 & eth2 //
> 172.20.0.0 ), and I would like to block traffic between those two
> networks. Somehow Ive failed because any rules that should forbid
> traffic between those 2 networks didn't work. I still could access
> webserver on the eth2 - 172.20.10.1 from a station with IP address
> 172.19.1.100 ! Then Ive applied rule in PREROUTING chain in nat

Thou shalt not filter in the nat table.

	I knew this one ;)

> Iptables -t nat -A PREROUTING -s 172.19.0.0/16 -d 172.20.0.0/16 -j
> DROP

I would use interfaces, not IP addresses.

	You mean - physdev matching?

> Rules in FORWARD and INPUT chain just wouldn't work. Is this the

What did you try in FORWARD?

	Iptables -A FORWARD -d 172.20.0.0/16 -m physdev --physdev-in eth1 -j
DROP

This rule works now.. I must had an ESTABLISHED connection in my conntrack
table since this rule didn't work first time I tried it. Now Ive restarted
my gateway and applied this rule and now I cannot access the 172.20.0.0 net.


Any suggestions?

Thank you in advance.

Regards,

Edvin Seferovic


