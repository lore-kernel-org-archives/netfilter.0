From: Kovacs Krisztian <hidden@balabit.hu>
Subject: Re: LVS and fault-tolerant Firewall.
Date: Wed, 17 Sep 2003 10:09:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F6816BF.4040006@balabit.hu>
References: <NDBBKABJBJCIJNAELLKEIECJJDAA.jimm@simutronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NDBBKABJBJCIJNAELLKEIECJJDAA.jimm@simutronics.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jimm@simutronics.com
Cc: "LinuxVirtualServer.org users mailing list." <lvs-users@linuxvirtualserver.org>, netfilter@lists.samba.org


   Hi,

James Miller wrote:
> Yes, but you can not run iptables/netfilter and maintain connection tracking
> with keepalived(vrrp).. so if you fail over, established/related traffic
> will not be known to .
> 
> For some folks this isn't an issue.  For me is a show-stopper.  I'm sure
> there are good reasons why the netfilter folks can't come up with conntrack
> state-sharing mechanism.

   This is not true. Harald has published a paper last year at OLS2002, 
which gives an overview how connection tracking failover could be 
implemented for Netfilter. There are no theoretical problems with the 
approach, I've created some proof-of-concept code this spring. However, 
it's far from being usable in a real-world environment, at the moment, and 
this is the primary reason it has not been released to the public yet. You 
can get slightly more information from my presentation at the second 
Netfilter Workshop, available in OpenOffice.org Impress format at 
http://home.sch.bme.hu/~piglet/nf-ha/nfws_ha.sxi

-- 
   Regards,
     Krisztian KOVACS


