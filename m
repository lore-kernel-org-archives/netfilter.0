From: "jgalvez@webpipe.net" <jgalvez@webpipe.net>
Subject: Re: A secure router, by MAC address
Date: Wed, 20 Oct 2004 13:28:34 -0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098300513.5684.15.camel@6-allhosts>
References: <1098297965.5686.9.camel@6-allhosts>
	<1098299562.8628.48.camel@porky>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1098299562.8628.48.camel@porky>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@lists.netfilter.org

Eric,

I looked into NuFW, but it seems more complex that what I need.  The
biggest drawback to it is the requirement for each client to be running
authentication software.

All I really need are a few specific rules, if traffic is coming in on
this interface from this IP and mac, allow it, otherwise redirect ts
localhost if destination port is 80.

-Josh

On Wed, 2004-10-20 at 13:12, Eric Leblond wrote:
> Hi,
> 
> It really looks like you want to distinguish between well know users and
> a set of mobile users.
> NuFW (http://www.nufw.org) is done to distinguish between users because
> it's an authentication firewall. It authenticates connection in a secure
> manner, so you're sure of the identity of users that you let go accross
> your firewall.
> 
> You can easily manage to build a solution comparable to the one you
> describe below with NuFW. With more flexibility and more security.

> BR,


