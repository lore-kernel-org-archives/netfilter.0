From: Nathaniel Hall <nathaniel.d.hall@gmail.com>
Subject: Re: REJECT --reject-with icmp-host-unreachable vs DROP
Date: Mon, 27 Mar 2006 09:24:00 -0600
Message-ID: <44280390.8060502@gmail.com>
References: <4427A69D.6010702@eccotours.co.za>
Reply-To: nathaniel.d.hall@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4427A69D.6010702@eccotours.co.za>
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
To: Brent Clark <bclark@eccotours.co.za>
Cc: netfilter@lists.netfilter.org

Brent Clark wrote:

> Hi all
>
> Just something I would like to pick someones brain with.
>
> If I use the default policy of drop, BUT at the end of the chain use 
> the following
>
> $IPT -t filter -A FORWARD -j REJECT --reject-with icmp-host-unreachable
>
> Would that be ok, or does is another ICMP message I can reply back with.
>
> Reason I ask this is because I find that by using the default policy 
> (DROP), some applications keep retrying to make a
> connection etc.
> Where as this approach, seems to slow things down (I stand to 
> correction on this).
>
> If someone could maybe help me understand this or assit I would be 
> most grateful.

I recommend using --reject-with icmp-host-unreachable and here are the 
reasons:

1) What is the only reason you would receive nothing?  When a firewall 
is in place.  That's it.  Everything else you either get a host 
unreachable, network unreachable, port unreachable, reset, etc. 2) What 
do DDoS attacks rely on?  Slow/no connection resets.  If your address 
space is spoofed and you do not send a reject or reset message, the 
victim still has the connection open.  You are aiding the cracker with 
their DDoS by DROPing the connection and not rejecting/reseting it.
3) If I remember right, it is against RFC to DROP a connection without 
rejecting/reseting it.  If anybody could point me to the correct RFC, 
that would be great.

-- 
Nathaniel Hall, GSEC GCFW GCIA


