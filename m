From: Mogens Valentin <monz@danbbs.dk>
Subject: Re: TCP_CONNTRACK_ESTABLISHED 5days
Date: Mon, 02 May 2005 16:10:53 +0200
Message-ID: <427634ED.1030204@danbbs.dk>
References: <42762C02.8060300@danbbs.dk>
Reply-To: monz@danbbs.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42762C02.8060300@danbbs.dk>
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
To: netfilter <netfilter@lists.netfilter.org>
Cc: moritz.gartenmeister@access.unizh.ch

Mogens Valentin wrote:
> (Sent this to the linux-net list; seems this list is more appropriate. 
> Sorry for any inconvenient xposting)
> 
> I fail to understand why TCP_CONNTRACK_ESTABLISHED has to be 5 days.
> It's not configurable from /proc, but I see nothing wrong in changing 
> the source to, say, 1 day.
> Would someone educate me, pls.
> 
> /usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c :
> 
> static unsigned long tcp_timeouts[]
> = { 30 MINS,    /*      TCP_CONNTRACK_NONE,     */
>    5 DAYS,     /*      TCP_CONNTRACK_ESTABLISHED,      */
>    2 MINS,     /*      TCP_CONNTRACK_SYN_SENT, */
>    60 SECS,    /*      TCP_CONNTRACK_SYN_RECV, */
>    2 MINS,     /*      TCP_CONNTRACK_FIN_WAIT, */
>    2 MINS,     /*      TCP_CONNTRACK_TIME_WAIT,        */
>    10 SECS,    /*      TCP_CONNTRACK_CLOSE,    */
>    60 SECS,    /*      TCP_CONNTRACK_CLOSE_WAIT,       */
>    30 SECS,    /*      TCP_CONNTRACK_LAST_ACK, */
>    2 MINS,     /*      TCP_CONNTRACK_LISTEN,   */
> };
> 

Sorry, I had missed
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established

Moritz, thanks for pointing that out.
Your suggested 10 minutes seems a bit short, though..

If we keep, say, a browser connection open longer than those 10m, it's 
supposed to either use keepalive, or an established session will simply 
be setup for another 10m, right?
Won't that create some additional load for a busy server, i.e. something 
else that this thought-of browser session?

To the maintainer of ip_conntrack_proto_tcp.c (Paul Russell?):
Wouldn't it be fair to change TCP_CONNTRACK_ESTABLISHED permanently?

-- 
Kind regards,
Mogens Valentin


