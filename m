From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: Load Balancers and conn_track
Date: Wed, 13 Apr 2005 18:59:03 -0500
Message-ID: <425DB247.5010305@riverviewtech.net>
References: <1403218a05041304471c9f17c7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1403218a05041304471c9f17c7@mail.gmail.com>
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
To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Cc: netfilter <netfilter@lists.netfilter.org>

> If I have two servers (say web servers) located behind a layer4
> switch, that act as a load balancer.
> server1 and server2 have the IPs (say) 1.2.3.4 & 1.2.3.5
> and the load balancer is  1.2.3.6
> Of course the DNS of the sites will point to 1.2.3.6 and clients from
> outside will see this.
> Now, will conntrack understand that the replies from 1.2.3.4 are
> really established connections that were destined for 1.2.3.6 ??

On which system (1.2.3.4, 1.2.3.5, or 1.2.3.6) are you asking if conntrack will see the replies as ESTABLISHED?  I'm personally not familiar with load balancers at all.  When the traffic comes in to 1.2.3.4 or 1.2.3.5 do they see the destination as 1.2.3.6 or do they see the destination as themselves, 1.2.3.4 / 1.2.3.5 respectively?  Does the load balancer do any DNATing or SNATing of traffic?  I would be tempted to say that your servers 1.2.3.4 and 1.2.3.5 should only worry about traffic coming in to them selves and make sure that the load balancer is sending packets to the various servers statefully.

Or, are you asking what will conntrack on a firewall that is SNATing at a client's location sending data to 1.2.3.6 think when packets come back from something other than 1.2.3.6?  If this is the case I think this could break a LOT of things.  In that case conntrack will not recognize the traffic as ESTABLISHED b/c the source IP will be different than the destination IP that the traffic was going out to.

See if you can't explain your scenario a little bit better and I'll see if I can't help you any more then.



Grant. . . .

