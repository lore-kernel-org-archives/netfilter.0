From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: blocking traffic between two internal interfaces ?
Date: Thu, 20 Oct 2005 07:22:19 +0200
Message-ID: <37468.0948247716$1129785761@news.gmane.org>
References: <200510192332.56574.rob0@gmx.co.uk>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510192332.56574.rob0@gmx.co.uk>
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

On Wednesday 2005-October-19 23:11, Seferovic Edvin wrote:
> I would use interfaces, not IP addresses.
>
> 	You mean - physdev matching?

>I mean -i and -o options.

	Packet do come in on the eth1 but I dont think that they will leave
eth2 because ( for example only ) - what happens when I try to access
services on IP of eth2? Is another routing decision made or are they just
kept in eth2? 

> Iptables -A FORWARD -d 172.20.0.0/16 -m physdev --physdev-in eth1
> -j DROP
>
> This rule works now.. I must had an ESTABLISHED connection in my
> conntrack table since this rule didn't work first time I tried it.

>That makes sense. See, you can't evaluate why something doesn't work as 
>expected unless you know the whole picture.

	I try to keep the whole pic in my head, but when you work the whole
night long - that is not so easy ;)

> Now Ive restarted my gateway

>You can also flush all iptables rules, unload all netfilter modules, 
>then reload and restore. You'll start with an empty conntrack table. 
>(Someone will mention the new conntrack tool which will work with 
>2.6.14 and later.)

	Yes ... It was me who asked about the possibility to clear the
conntrack table because I couldn't unload the iptable-modules. They are
"being used" :( . So I think Ill have to wait until 2.6.14....

> and applied this rule and now I cannot access the 172.20.0.0 net.
>
> Any suggestions?

>Was this not the goal? What is to suggest?

	Maybe some other more elegant solution ;) Not every solutions is the
best one. But sure - goal reached ;) Thank You very much !

Regards,

Edvin Seferovic


