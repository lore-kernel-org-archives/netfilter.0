From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Looking for IPtables developers - Need help at core of
	iptables (not configuration)
Date: Tue, 03 Aug 2004 13:37:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091554632.2039.24.camel@grendel>
References: <5.2.0.9.2.20040727115216.00aa0a30@pop.benesconsulting.com>
	 <5.2.0.9.2.20040727115216.00aa0a30@pop.benesconsulting.com>
	 <5.2.0.9.2.20040802161432.00aac218@pop.benesconsulting.com>
	 <20040803144504.GF26969@sunbeam2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040803144504.GF26969@sunbeam2>
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
To: Harald Welte <laforge@netfilter.org>
Cc: Leon Bene <leon@benesconsulting.com>, Netfilter Mailinglist <netfilter@lists.netfilter.org>

On Tue, 2004-08-03 at 10:45, Harald Welte wrote:
>
> Sorry for being blunt, but what kind of crappy measurement method is
> this?  Who does network latency testing by MS Excel?

I was trying to bite my tongue on this one, but since you responded...
;-) 

I doubt this "test" has anything to do with the network. Excel is going
to load the entire file into memory before displaying it. This means
that if you watch the wire while you "hold down the arrow keys", you are
not going to see any network traffic.

Since more like a display or memory issue on the client.

Chris



