From: Jason Opperisano <opie@817west.com>
Subject: Re: smtp/pop and NAT only
Date: Wed, 18 May 2005 11:29:09 -0400
Message-ID: <20050518152909.GA5005@bender.817west.com>
References: <201E6F5AC48C274996A5AD8304FAEF869AB9@p001ex03.porta.local>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <201E6F5AC48C274996A5AD8304FAEF869AB9@p001ex03.porta.local>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, May 18, 2005 at 02:21:50PM +0200, Baake, Matthias wrote:
> No static IP
> 
> in this case this should work.
> 
>   $IPT -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/24 -j MASQUERADE

MASQUERADE is for dynamic IP situations, SNAT is for static IP
situations.  why are we recommending MASQUERADE in a static IP
situation?

-j

--
"Stewie: Now look here...  Jo-LENE. I have an army to raise and I must
 get to Managua at once. I require a window seat and an in-flight Happy
 Meal. BUT NO PICKLES. OH, GOD HELP YOU IF I FIND PICKLES."
        --Family Guy

