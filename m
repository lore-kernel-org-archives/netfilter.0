From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Core Router with Multiple Uplink Source Routing
Date: Tue, 17 Jun 2003 19:20:32 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030617232032.GC1654@cannon.eng.us.uu.net>
References: <200306171451.52783.marks@crvinc.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200306171451.52783.marks@crvinc.com>
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
Content-Transfer-Encoding: 7bit
To: Mark Seamans <marks@crvinc.com>
Cc: netfilter@lists.netfilter.org

Your problem definition is vague. What do you want? To route the packets
out with src of A to provider A and the same thing with B?

If so:

ip ro add from A/whatever via gw-A
ip ro add from B/whatever via gw-B

Ramin

On Tue, Jun 17, 2003 at 02:51:52PM -0500, Mark Seamans wrote:

> I have a linux box with a 4 port t1 card.  I have been screwing around with 
> various solutions (ip route, tc, etc...) to direct source traffic via "my" 
> preferred out-going route.
> So this is what I got:
> To sets of IP's:  One from uplink "A", one from uplink "B".
> Wireless and my core equipment are on "A"
> Dialup are on "B"
> Now since I am not running BGP yet, I know that I will have to route them the 
> corrisponding uplink provider.  But, this will be the fallback if BGP fails 
> and the temporary solution why we get BGP working.
> I see various lists and they suggest that iptables is the best way.  If 
> someone out there has this running, please email me any script that would be 
> helpful.  It seems that I always gets a portion, but not the missing link.
> 
> Thanks,
> 
> Mark
> marks@crvinc.com
> 

