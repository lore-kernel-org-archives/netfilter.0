From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Can iptables or other firewall solutions can do this for me?
Date: Mon, 12 Feb 2007 19:43:56 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0702121943290.26360@yvahk01.tjqt.qr>
References: <b66ddc900702120716p6c9f1d5dibb6ad85ea4fc8df@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b66ddc900702120716p6c9f1d5dibb6ad85ea4fc8df@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: howard chen <howachen@gmail.com>
Cc: netfilter@lists.netfilter.org


On Feb 12 2007 23:16, howard chen wrote:
>
> We have a web server, recently received a lot of requests from oversea
> proxy. The requests are to spam our applications (i.e. leave
> comments). They don't success, since they never get the correct
> captacha.
>
> But the problem is: They are doing requests & requests forever (even
> with no success). This lead to:
>
> 1. Waste of CPU time of our web server
> 2. Waste of oversea bandwidth
>
> Can iptables or related tools or packages can do this for me?
>
> p.s. Since they are changing proxy all the time, so might be need a
> automatic solutions,

Block their proxies using TARPIT.



Jan
-- 
ft: http://freshmeat.net/p/chaostables/

