From: "Daniel J. Brennan" <djbrennan@comcast.net>
Subject: Re: Network number getting mangled
Date: Tue, 1 Mar 2005 17:17:30 -0500 (EST)
Message-ID: <Pine.LNX.4.58.0503011711120.11531@spm.home.djb.net>
References: <Pine.LNX.4.58.0503011618080.11531@spm.home.djb.net>
	<20050301220459.GA31857@bender.817west.com>
Mime-Version: 1.0
In-Reply-To: <20050301220459.GA31857@bender.817west.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org


> 
> your example of 10.0.168.0/22, actually does define a network
> ID--10.0.168.0 - 10.0.171.255
> 
> as to what value you actually want--i have no idea.
> 
> say what you mean and mean what you say.

Thanks for the reply. But I am confused. I need to revisit the math, but
the public IP space range is XX.XX.168.0 - XX.XX.175.255. It has a netmask 
of 255.255.242. As I said the private space mirrors this IP space.
This is a legitimate public IP subnet. How do I define it to iptables,
since the public IP space is not as I would expect in iptables either.

Thanks,
Dan

