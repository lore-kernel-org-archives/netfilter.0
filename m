From: Mark Seamans <marks@crvinc.com>
Subject: Core Router with Multiple Uplink Source Routing
Date: Tue, 17 Jun 2003 14:51:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306171451.52783.marks@crvinc.com>
Reply-To: marks@crvinc.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a linux box with a 4 port t1 card.  I have been screwing around with 
various solutions (ip route, tc, etc...) to direct source traffic via "my" 
preferred out-going route.
So this is what I got:
To sets of IP's:  One from uplink "A", one from uplink "B".
Wireless and my core equipment are on "A"
Dialup are on "B"
Now since I am not running BGP yet, I know that I will have to route them the 
corrisponding uplink provider.  But, this will be the fallback if BGP fails 
and the temporary solution why we get BGP working.
I see various lists and they suggest that iptables is the best way.  If 
someone out there has this running, please email me any script that would be 
helpful.  It seems that I always gets a portion, but not the missing link.

Thanks,

Mark
marks@crvinc.com


