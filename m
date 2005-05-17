From: Askar <askarali@gmail.com>
Subject: Re: Host blocking
Date: Tue, 17 May 2005 18:09:04 +0500
Message-ID: <a0f69e50505170609ada74ed@mail.gmail.com>
References: <003b01c55acb$841114a0$f00aa9c0@winxp>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <003b01c55acb$841114a0$f00aa9c0@winxp>
Content-Disposition: inline
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
To: "Wennie V. Lagmay" <wlagmay@yanbulink.net>
Cc: netfilter@lists.netfilter.org

hmm sound like you are running your proxy "squid" in non interception
mode, so why not give a kick to Interception "transparent" which mean
you don't have to configure each client to use your proxy i-e it will
be transparent to them.

http://www.tldp.org/HOWTO/TransparentProxy.html

regards

Askar

On 5/17/05, Wennie V. Lagmay <wlagmay@yanbulink.net> wrote:
> Our ISP's Proxy server is proxy.ISP.net , our company's own proxy server =
is
> proxy.ourcompany.net. Our own proxy server has delay_pool but our ISP pro=
xy
> server dont have. I want to control our client to use only our company pr=
oxy
> server. how can I block the proxy.ISP.net using IP tables so that every b=
ody
> can be force to use our compnay proxy server. (note that our company prox=
y
> server is connected to our ISP proxy server as cache_peer parent)
>=20
> thanks,
>=20
> wennie
>=20
>=20


--=20
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

