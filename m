From: "John Arthur" <lists@davey.net.au>
Subject: RE: iptables on Satellite receive only linux PC
Date: Sun, 1 Aug 2004 17:11:39 +0930
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AEEEIGKNFEANJOMAMBCBKENDCGAA.lists@davey.net.au>
References: <D5C9032B2B09C64EA2409D6214E91AC9051215@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC9051215@asimail2.alphanumeric.com>
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
To: Jason Opperisano <Jopperisano@alphanumeric.com>, netfilter@lists.netfilter.org

 
> > Actually assuming that the satellite card is pentanet0 you want
> >
> > echo 0 > /proc/sys/net/ipv4/conf/all/rp_filters
> > echo 1 > /proc/sys/net/ipv4/conf/pentanet0/rp_filters
> >
> > To only turn off spoofing protection on the one interface.
> 
> That achieves the opposite effect.  The above will disable 
> reverse path filtering for all interfaces except pentanet0.  The 
> opposite, would do what you are suggesting:
> 
> # enable reverse-path filtering on all interfaces
> echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
> 
> # disable reverse-path filtering on pentanet0 interface
> echo 0 > /proc/sys/net/ipv4/conf/pentanet0/rp_filter
> 

Yes you're correct. That's what comes from doing things too quickly. ;-)

