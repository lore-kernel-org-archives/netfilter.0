From: wlagmay@yanbulink.net
Subject: Re: help on load balancing
Date: Thu, 15 Dec 2005 16:21:00 +0300
Message-ID: <1134652860.43a16dbcbf5dd@webmail.yanbulink.net>
References: <1134646377.43a15469eb4ef@webmail.yanbulink.net>
	<62629.193.173.147.3.1134651140.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <62629.193.173.147.3.1134651140.squirrel@webmail.sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

Hi Rob,

Im sorry, I forgot to inform you that the clients are not using this 3 lines to
go directly to the internet, instead the on the same machine I install Squid
proxy server, hoping that with the load balance technique, squid can take
advantage of the connection simultaneously, so my problem actualy is the squid
to use the 3 lines simutaneously.

thanks
Wennie

Quoting Rob Sterenborg <rob@sterenborg.info>:

> On Thu, December 15, 2005 12:32, wlagmay@yanbulink.net wrote:
> ...
> > Squid proxy, Im monitoring the 4 ports via MRTG and I noticed that
> > before It goes to link 2, link 1 must be saturated first or link1
> > will stop and the request is only transfered to link 2. So it seems
> > that it is not doing a load balance, my idea of load balance is
> > utilizing the 3 lines simultaneously.
> ...
>
> Perhaps you can use the nth patch.
> http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-nth
>
>
> Gr,
> Rob
>
>
>
>





