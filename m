From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: Maximum Number of Chains
Date: Wed, 3 Sep 2003 12:22:05 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030903042205.GB3740@propaganda.localdomain>
References: <3F50250D.70405@freespace-networks.net>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3F50250D.70405@freespace-networks.net>
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
To: netfilter@lists.netfilter.org

On Sat, Aug 30, 2003 at 12:16:13AM -0400, Paul Caritj spoke thusly:
>Greetings, I hope everyone is well.
>Though I suspect the subject line adequately conveys my question, I will 
>restate it: Does anyone out there know the maximum number of chains per 
>table?

No idea what is the maximum. But the more rules you add, the slower the
additions become (I think Harald mentioned this previously). 

Also, if you have a long list of rules (eg: 700 different rules within the
FORWARD chain) -- and you decide to remove rule #467. All the rules need to
be copied to a temporary area, rule #467 removed, everything from the
temporary buffer copied back. That adds to the slowness.

I think the devel guys are working on tweaking the table type used in the
2.5/2.6 kernels. They should be able to shed more information, or you can
dig through the archives.

