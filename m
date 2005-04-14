From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Problem with DNAT from localhost to LAN via loopback
Date: Thu, 14 Apr 2005 13:06:49 -0500
Message-ID: <425EB139.7010408@riverviewtech.net>
References: <1113492519.425e8c27488ab@imp1-q.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113492519.425e8c27488ab@imp1-q.free.fr>
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
To: Charles Delorme <charles.delorme@suricat.net>
Cc: netfilter@lists.netfilter.org

> My problem is from the linux box when trying "telnet [official WAN IP] 3739"
> which replies "connection refused". "tcpdump -nt -i lo" shows a simple SYN then
> RST. I've add LOG to chains (INPUT/FORWARD/OUTPUT/PREROUTING/POSTROUTING) and
> found this telnet connection does not go via the PREROUTING chain. So it
> doesn't find any local 3739 port listening so it is not redirected to the
> LAN... When I fire up a netcat listing on the port, I can get the connection -
> off course (but as I said before, configuration is more complicated and this
> test was mandatory)

Is this problem localized to just the Linux box it's self or does it extend to your inter LAN connected systems as well?

I was going to ask if you could DNAT internal traffic that was outbound to your WAN IP but after rereading your IPTables rules you are not specifying an interface to apply your rules to so they apply to all and thus you are doing exactly that.  The next question that comes to mind is are you by chance firewalling traffic that would come in the LAN interface and then turn around and go right back out the same LAN interface?  I.e. people set a default policy of DROP and explicitly allow $LAN to $INet and $INet to $LAN but not necessarily $LAN to $LAN.



Grant. . . .

