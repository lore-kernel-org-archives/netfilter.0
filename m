From: Mike Williams <mike@v6.gaima.co.uk>
Subject: Re: NAT to one net, bridge to another
Date: Thu, 14 Sep 2006 13:07:44 +0100
Message-ID: <200609141307.45172.mike@v6.gaima.co.uk>
References: <200609081250.32329.mike@v6.gaima.co.uk>
	<45093FEB.3050305@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45093FEB.3050305@plouf.fr.eu.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thursday 14 September 2006 12:41, Pascal Hambourg wrote:
> > It'll have 10 nics, all paired off into round-robin bonds, so 5 usuable
> > interfaces. 1 colo facing, 3 private, 1 "public".
>
> What interfaces do you plan to bridge ?

bond0 to bond4 (probably). bond0 being the link to the colo, bond4 to 
the "public" servers.
bond{1,2,3} private networks.

[snip lots of very useful information]

> I assume you plan to bridge the "colo" and "public" interfaces.

Yes, your diagram is correct.

> The bridge catches incoming ethernet frames before the IP stack can see
> them. So an ethernet frame forwarded from colo to public does not hit
> the IP stack, unless it is an ethernet broadcast.

Or destined for an IP/MAC assigned to the bridge interface?
That also explains the necessity for ebtables in addition to ip[6]tables.

> To try to answer your question, you can DNAT IP datagrams transported by
> ethernet frames which are not bridged to another interface.

Thanks very much, exactly what I wanted to hear.

-- 
Mike Williams

-- 
Mike Williams

