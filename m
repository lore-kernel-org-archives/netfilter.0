From: Eric Leblond <eric@regit.org>
Subject: Re: Improve queue handler performance
Date: Tue, 19 Jun 2007 16:30:57 +0200
Message-ID: <1182263457.1834.12.camel@localhost.localdomain>
References: <4671BB67.7020209@saudi.net.sa>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4671BB67.7020209@saudi.net.sa>
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
Content-Type: text/plain; charset="iso-8859-9"
To: Rayed Alrashed <rayed@saudi.net.sa>
Cc: netfilter@lists.netfilter.org

Hi,

Could you send your code I'd like to run it on my platform. I want to
see I I came to the same result and I will try next to optimize
libnetfilter_queue.

In fact, I've done some bench on NuFW and found a similar result. Here's
the article (in french) with some graphs :
http://nufw.org/Tests-de-performance-intensifs-sur.html

BR,

Le vendredi 15 juin 2007 =E0 01:04 +0300, Rayed Alrashed a =E9crit :
> Hello everyone,
>=20
> I am playing with nf_netlink_queue handler and built an empty handler=20
> based on "nfqnl_test.c" from the distribution, it just accept all packet=20
> without any checks at all.
>=20
> To test its performance I installed Lighttpd on the same machine, and=20
> used http_load to benchmark the performance.
>=20
> Without any thing queued to the user space I achieved ~20000K fetches=20
> per second, but when I enabled user space filtering the performance=20
> dropped to ~2600 fetches per second.
>=20
> I used this rule to queue all HTTP traffic to the queue handler:
> # iptables -A myhttp -p tcp --dport 80 -j QUEUE
>=20
> Is this drop in performance normal, and is there any way to improve the=20
> performance.
>=20
> Thanks,
> Rayed



