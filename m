From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: Logging suggestions
Date: Wed, 13 Apr 2005 01:58:56 -0500
Message-ID: <425CC330.1000602@riverviewtech.net>
References: <0aa401c53f73$5c19a2a0$09603fca@southern>	<20050412161134.GA5964@epsilon.rdc.pl>
	<0b3501c53fe6$e682ffe0$09603fca@southern>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <0b3501c53fe6$e682ffe0$09603fca@southern>
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
To: hareram <hareram@sol.net.in>
Cc: netfilter@lists.netfilter.org, Mariusz Kruk <Kruk@epsilon.eu.org>

> can you point me to how can loggin only new connections
> any docs or examples will be helpfull

iptables -t filter -A FORWARD -i $INet -o $LAN -m state --state NEW -j LOG



Grant. . . .

