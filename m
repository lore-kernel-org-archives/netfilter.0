From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: VLANs and DNAT
Date: Fri, 25 Jul 2003 14:54:04 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307251451410.1760-100000@localhost>
References: <20030725134033.GC29983@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030725134033.GC29983@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: Damien Mason <kinetic@suse.net.au>, netfilter@lists.netfilter.org

Hi Ramin,

> > > But I cannot specify an interface -i eth1.2 in the prerouting, because 
> > > it occurs pre-routing?
> 
> This is a typo. What he meant was "-o"...

OK, I see now.

Damien, how about you forget about having identical routes on the two 
separate VLANs, which is likely to give you trouble anyway, and have 
static host routes to the individual servers on each VLAN. Then you will 
know from the new destination address (e.g. 192.168.50.10 in your example) 
exactly which VLAN the packet will be routed out over, because there is 
just one host route which it could take. So you don't need to match the 
destination interface name at all.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |




