From: "Lumberjack" <lumberjack@lumberjackvillage.com>
Subject: Re: 2 NICs on same subnet
Date: Fri, 5 Nov 2004 09:52:15 -0500
Message-ID: <006601c4c347$0b504200$2e01a8c0@minka>
References: <20041105123843.GB11016@zion.homelinux.com><20041105124107.GE9379@torres.ka0.zugschlus.de><20041105125421.GA12058@zion.homelinux.com><20041105130424.GF9379@torres.ka0.zugschlus.de>
	<20041105142219.GB12563@zion.homelinux.com>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

>well, I know that it doesn't make much sense. This setup was made to
>"balance" the traffic coming in to the machine. I know that there's
>not much  difference between one NIC running at, say 400 Mbps, or
>two NICs running at 200 Mbps each which will also be 400 Mbps, because
>the machine can't handle more traffic (data (backups) is received via
>network from other machines and written to disks)...but as I've already
>written, this wasn't my decision...

Your decision or not if you are the one to "implement the fix" then you 
should
suggest something that will work and not try to get something else to work 
that
won't work.  At that data rate you would probably have more issues with disk
I/O anyway so a load balancer sounds like a better solution.

Good luck. 



