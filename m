From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: about iprange
Date: Tue, 25 Jan 2005 11:51:59 -0500
Message-ID: <1106671920.5306.50.camel@jasiiitosh.nexusmgmt.com>
References: <1106251621.41f00f65147cb@imp6-q.free.fr>
	<1106252952.5024.25.camel@hubcap.ljm.dom>
	<1106335800.41f15838d9d26@imp6-q.free.fr>
	<1106660735.41f64d7f087a7@imp5-q.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106660735.41f64d7f087a7@imp5-q.free.fr>
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
To: "jdf [zionarea.org]" <zionarea@free.fr>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Tue, 2005-01-25 at 14:45 +0100, jdf [zionarea.org] wrote:
> Using network addresses like 192.168.0/8 is well, but it's not granular
> enough: just because we cannot provide all the addresses if they don't
> follow this contiguous rule.
> 
> So I'm finally wondering about iprange. Most of linux distributions, with
> the ones I know, don't provide iprange for the kernel. Are there any
> performance or security issue behind this behavior ? Or is it simply a
> 'bad' choice of those distributors ? But maybe it's simply due to the
> kernel version. It appears 2.6.x provide this option at default; but if
> I remember well 2.4.x didn't.
> 
I had asked this same question as we considered enabling iprange rule
creation for the ISCS network security management project
(http://iscs.sourceforge.net).  We were told by the patch's creator that
there is virtually no additional overhead compared to a subnet match
(assuming I understood him correctly!).

We found we needed to accommodate solutions both ways within ISCS, i.e.,
if a gateway supports iprange, we write iptables rules with ranges.  If
not, we use the logic found in SubnetCreator
(http://subnetcreator.sourceforge.net) to break the range into subnets
and then create rules for the resultant subnets.  Hope this helps - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


