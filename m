From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Weird TCP flags?
Date: Fri, 12 Dec 2003 00:20:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312120020.40434.JALaramie@Loudoun-Fairfax.com>
References: <003101c3c065$f61ad790$13fea8c0@melita.com> <200312112346.41936.JALaramie@Loudoun-Fairfax.com> <005401c3c06b$c4f107b0$13fea8c0@melita.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005401c3c06b$c4f107b0$13fea8c0@melita.com>
Content-Disposition: inline
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
To: Ian Hunter <ihunter@hunterweb.net>, netfilter@lists.netfilter.org

On Thursday 11 December 2003 23:52, Ian Hunter wrote:
> There are no users on that box though, and it's not web browser traffic
> because the SOURCE port is 80, not the dest port, so this is web traffic
> being served by that box for sure...
>
> I've seen references to doing --reply-with tcp-reject to this sort of
> packet... ???

Hmmm,  I wouldn't expect a SYN/ACK reply to be on a high port. I'm more of a 
rules and logging kind of guy so I'm afraid you'll need to wait until the 
tcp/ip (i.e. smart) people wake up.

Jeff




