From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: redirect to proxy servere
Date: Thu, 1 Mar 2007 14:00:31 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703011359540.23355@yvahk01.tjqt.qr>
References: <20070301071927.klbsuhgk2sscscs8@mail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070301071927.klbsuhgk2sscscs8@mail.harrisonburg.k12.va.us>
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
To: dhottinger@harrisonburg.k12.va.us
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>


On Mar 1 2007 07:19, dhottinger@harrisonburg.k12.va.us wrote:
>
> I currently redirect all port 80 traffic to my squid proxy server with
> following:
>
> $IPC -A TOSERVERS -p tcp --dport 8080 -d 204.111.40.10 -i $L3 -j LACCEPT
> $IPC -A TOSERVERS -p tcp --dport 8080 -d 204.111.40.10 -i $L3 -j LACCEPT
> $IPC -A TOSERVERS -p tcp --dport 9011:9015 -d 204.111.40.10 -i $L3 -j LACCEPT
> $IPC -A TOSERVERS -p tcp --dport 10000 -d 204.111.40.10 -i $L3 -j LACCEPT
>
> Works great, except all of a sudden my apple computers wont do software
> updates.  So, I would like to not redirect traffic that is destined for
> apple.com or swscan.apple.com's website.  Im not quite sure of the syntax for
> my rule, or if this is even possible.  Any ideas?

Perhaps the problem is not in the "TOSERVERS" chain but the "LACCEPT" one.
Or even somewhere else in the iptables ruleset.



Jan
-- 

