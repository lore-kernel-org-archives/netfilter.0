From: =?ISO-8859-2?Q?=A3ukasz_Hejnak?= <grupy@szift.org>
Subject: Re: Where is TARPIT -- iptables V. 1.3.4
Date: Tue, 22 Nov 2005 10:56:33 +0100
Message-ID: <4382EB51.9090702@szift.org>
References: <462d0fec0511210948v12bf4046i8836b4ba3797abef@mail.gmail.com>	<43821AF1.7050409@wp.pl>
	<462d0fec0511211335h3a53f7a2n92e00059e4aa9c7c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <462d0fec0511211335h3a53f7a2n92e00059e4aa9c7c@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: NetFilter <netfilter@lists.netfilter.org>

Richard R wrote:
> It looks like the tarpit module provided by pom won't compile in the
> 2.6.14.2 kernel:
>   CC [M]  net/ipv4/netfilter/ipt_string.o
>   CC [M]  net/ipv4/netfilter/ipt_REJECT.o
>   CC [M]  net/ipv4/netfilter/ipt_TARPIT.o
> net/ipv4/netfilter/ipt_TARPIT.c: In function `tarpit_tcp':
> net/ipv4/netfilter/ipt_TARPIT.c:123: error: structure has no member
> named `nfcache'
> net/ipv4/netfilter/ipt_TARPIT.c:197: warning: implicit declaration of
> function `dst_pmtu'
> make[3]: *** [net/ipv4/netfilter/ipt_TARPIT.o] Error 1
> make[2]: *** [net/ipv4/netfilter] Error 2
> make[1]: *** [net/ipv4] Error 2
> make: *** [net] Error 2

Hmm.. in fact I've been doing so till 2.6.11.12 and everything was fine,
but now I compiled the 2.6.14.12 and patched it with POM and I'm having
similar errors with this, but in my case the build stops at the
ipt_osf.o, although I suspect that if I disable OSF, it will complain
with the TARPIT as well. So what's wrong? what have been changed in this
branch of the kernel that breaks this?
For the OSF I got this:

   CC [M]  net/ipv4/netfilter/ipt_osf.o
net/ipv4/netfilter/ipt_osf.c: In function `ipt_osf_nlsend':
net/ipv4/netfilter/ipt_osf.c:158: error: structure has no member named
`dst_groups'
net/ipv4/netfilter/ipt_osf.c: In function `osf_init':
net/ipv4/netfilter/ipt_osf.c:824: warning: passing arg 2 of
`netlink_kernel_create' makes integer from pointer without a cast
net/ipv4/netfilter/ipt_osf.c:824: error: too few arguments to function
`netlink_kernel_create'

Anybody into kernel hacking? :)
or maybe is there a simple solution to adapt the ipt_TARPIT.c and
ipt_osf.c to the new kernel?

--
Best wishes
=A3ukasz Hejnak


