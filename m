From: wlagmay@yanbulink.net
Subject: Re: Host blocking
Date: Tue, 17 May 2005 16:17:35 +0300
Message-ID: <1116335855.4289eeef23b5b@webmail.yanbulink.net>
References: <003b01c55acb$841114a0$f00aa9c0@winxp>
	<a0f69e50505170609ada74ed@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e50505170609ada74ed@mail.gmail.com>
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
To: Askar <askarali@gmail.com>
Cc: netfilter@lists.netfilter.org

well I know how to configure transparent proxy, but I realy dont dont know whats
will be the impact to my server and system. and number 2 even though I have a
transparent proxy clients can always define there pereffered proxy isn't it? so
the objective now is to block proxy.ISP.net including its corresponding IP
address. Am I doing the right way?

Thanks,

 wennie

Quoting Askar <askarali@gmail.com>:

> hmm sound like you are running your proxy "squid" in non interception
> mode, so why not give a kick to Interception "transparent" which mean
> you don't have to configure each client to use your proxy i-e it will
> be transparent to them.
>
> http://www.tldp.org/HOWTO/TransparentProxy.html
>
> regards
>
> Askar
>
> On 5/17/05, Wennie V. Lagmay <wlagmay@yanbulink.net> wrote:
> > Our ISP's Proxy server is proxy.ISP.net , our company's own proxy server is
> > proxy.ourcompany.net. Our own proxy server has delay_pool but our ISP proxy
> > server dont have. I want to control our client to use only our company
> proxy
> > server. how can I block the proxy.ISP.net using IP tables so that every
> body
> > can be force to use our compnay proxy server. (note that our company proxy
> > server is connected to our ISP proxy server as cache_peer parent)
> >
> > thanks,
> >
> > wennie
> >
> >
>
>
> --
> I love deadlines. I like the whooshing sound they make as they fly by.
> Douglas Adams
>





