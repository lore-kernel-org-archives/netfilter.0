From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT problem with iptables...
Date: Thu, 12 Sep 2002 10:51:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209120951.g8C9pvv09772@vulcan.rissington.net>
References: <3D7F567F.3437E5C7@itdimensions.com> <20020911174019.UNZH287.mta02-svc.ntlworld.com@there> <3D7FE077.EEE22CE@itdimensions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D7FE077.EEE22CE@itdimensions.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 12 September 2002 1:31 am, Marian Stepka wrote:

> Hi Antony;
>
> > iptables -A PREROUTING -t nat -d 192.168.0.230 -j DNAT --to 64.124.175.104
> > iptables -A PREROUTING -t nat -d 192.168.0.231 -j DNAT --to 64.124.175.105
> > iptables -A PREROUTING -t nat -d 192.168.0.232 -j DNAT --to 208.184.248.9
> > iptables -A POSTROUTING -t nat -s 64.124.175.104 -j SNAT --to
> > 192.168.0.230
> > iptables -A POSTROUTING -t nat -s 64.124.175.105 -j SNAT --to
> > 192.168.0.231
> > iptables -A POSTROUTING -t nat -s 208.184.248.9 -j SNAT --to 192.168.0.232
>
> I'd try this solution but it working only partly. When I log what
> happening, only destination address is translated. When I try to ping
> f.g. 192.168.0.230 it is tranlated to 64.124.175.104 but id does not
> goes back. So ping is not successful. But I can ping card directly from
> translating box. So network seems to be set up properly.

Does the destination machine know how to route back to the source machine 
correctly ?   (See my sig below, which quite by chance came out with this one 
for this email !)

Antony.

-- 

90% of network problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

