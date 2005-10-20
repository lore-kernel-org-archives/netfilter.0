From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: blocking traffic between two internal interfaces ?
Date: Wed, 19 Oct 2005 23:32:56 -0500
Message-ID: <200510192332.56574.rob0@gmx.co.uk>
References: <20051020041130.0D02EF6F2@sorry.no-ip-here.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051020041130.0D02EF6F2@sorry.no-ip-here.net>
Content-Disposition: inline
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

I mean -i and -o options.

> Iptables -A FORWARD -d 172.20.0.0/16 -m physdev --physdev-in eth1
> -j DROP
>
> This rule works now.. I must had an ESTABLISHED connection in my
> conntrack table since this rule didn't work first time I tried it.

That makes sense. See, you can't evaluate why something doesn't work as 
expected unless you know the whole picture.

> Now Ive restarted my gateway

You can also flush all iptables rules, unload all netfilter modules, 
then reload and restore. You'll start with an empty conntrack table. 
(Someone will mention the new conntrack tool which will work with 
2.6.14 and later.)

> and applied this rule and now I cannot access the 172.20.0.0 net.
>
> Any suggestions?

Was this not the goal? What is to suggest?
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

