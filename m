From: Jason Opperisano <opie@817west.com>
Subject: Re: rewriting destination port of outbound packets
Date: Fri, 11 Mar 2005 06:36:43 -0500
Message-ID: <1110541003.4767.8.camel@hubcap.ljm.dom>
References: <42309DEA.4040308@sunwave.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <42309DEA.4040308@sunwave.net>
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

On Thu, 2005-03-10 at 14:20, Mason Schmitt wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> I am attempting to configure a Linux box (mandrake 10.1 - iptables
> 1.2.9) to redirect http, ftp, real, winmedia, quicktime, and nntp to a
> Netapp NetCache transparent caching proxy.
> 
> Here is my network layout:
> 
> ~       Net
> ~        |
> ~  Linux router/fw
> ~        |
> - ------switch-------
> |             |
> clients     cache
> 
> Starting first with http, I have made use of fwmark and iproute2 to
> first mark traffic from our network to destination port 80 and then
> route that traffic, out the same interface it came in on, to the web
> cache.  The problem I am trying to resolve is that the traffic that I am
> routing to the cache still has the  destination port 80.  I think this
> needs to be 3128 (The cache accepts connections on port 3128).
> 
> So, is it possible to rewrite the destination port in this scenario?

yeah--at some point in your packet mangling:

  iptables -t nat -A PREROUTING -i $INSIDE_IF -p tcp --dport 80 \
    -j DNAT --to-destination $NETCACHE_IP:3128

as an aside--your life would be infinitely easier if you added a third
NIC to the Linux router/fw and put the netcache on that segment...IMHO

-j

--
"Dear Baby, Welcome to Dumpsville. Population: You"
	--The Simpsons


