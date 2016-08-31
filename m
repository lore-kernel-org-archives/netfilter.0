From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: nf_conntrack_max
Date: Wed, 31 Aug 2016 17:47:32 -0500
Message-ID: <20160831224731.GP28999@harrier.slackbuilds.org>
References: <000e01d203d5$3e576d00$bb064700$@bluemarble.net>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000e01d203d5$3e576d00$bb064700$@bluemarble.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Wed, Aug 31, 2016 at 06:15:55PM -0400, John Ratliff wrote:
> What are the implications of raising 
> net.ipv4.netfilter.ip_conntrack_max?
> 
> I have a pair of firewalls in an active/passive failover setup 
> (using keepalived and conntrackd) that I want to use to NAT several 
> services behind. When I added DNS yesterday, I quickly exceeded the 
> default 65536 value. It never appeared to exceed 85000, so I simply 
> doubled it for the time being.
> 
> When I was reading about this online, there were many suggestions 
> for putting DNS servers outside the firewall.

If the NAT is not a hard requirement, this is what I would do.  But 
since as you say that would be a lot of trouble, yes, just raise the
net.ipv4.netfilter.ip_conntrack_max.

Each entry costs a relatively small amount of RAM.  Since you are 
talking about numerous high availability measures, I am sure your 
organization has not skimped on the firewall machines.  Increase it, 
don't worry.  Check the RAM use while it's working.  Order more RAM 
if there's any doubt. :)

Perhaps you have already seen this unattributed article at the ISC 
Knowledge Base:

https://kb.isc.org/article/AA-01183/

> I am ambivalent about this solution. It will work, but it will 
> require me to duplicate many rules from my main firewall to the 
> packet filter on the individual DNS servers that I Would prefer not 
> be duplicated.
> 
> Would there be a serious performance penalty to simply raising the 
> conntrack_max value to 256k, 512k, or 1024k? Is it best to try and 
> avoid large connection tracking tables like this? I do not know 
> what my average table would be, but I would expect 100k from the 
> data I have so far.

AFAIK the extra memory use will be the only drawback.

One more thing I can add: I believe it is possible to set different 
conntrack timeouts based on protocol/port.  I don't know exactly how 
to do that, but it would make sense for udp/53 to shorten that to 
something like 15 seconds; just a bit beyond the nameservers' and 
resolver clients' timeout values.
-- 
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
