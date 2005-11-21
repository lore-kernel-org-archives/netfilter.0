From: Richard R <richhome@gmail.com>
Subject: Re: Where is TARPIT -- iptables V. 1.3.4
Date: Mon, 21 Nov 2005 13:35:35 -0800
Message-ID: <462d0fec0511211335h3a53f7a2n92e00059e4aa9c7c@mail.gmail.com>
References: <462d0fec0511210948v12bf4046i8836b4ba3797abef@mail.gmail.com>
	<43821AF1.7050409@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43821AF1.7050409@wp.pl>
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
To: ?ukasz Hejnak <sziftgroup@wp.pl>
Cc: NetFilter <netfilter@lists.netfilter.org>

Thanks for the reply.

It looks like the tarpit module provided by pom won't compile in the
2.6.14.2 kernel:

  CC [M]  net/ipv4/netfilter/ipt_string.o
  CC [M]  net/ipv4/netfilter/ipt_REJECT.o
  CC [M]  net/ipv4/netfilter/ipt_TARPIT.o
net/ipv4/netfilter/ipt_TARPIT.c: In function `tarpit_tcp':
net/ipv4/netfilter/ipt_TARPIT.c:123: error: structure has no member
named `nfcache'
net/ipv4/netfilter/ipt_TARPIT.c:197: warning: implicit declaration of
function `dst_pmtu'
make[3]: *** [net/ipv4/netfilter/ipt_TARPIT.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2

Any ideas?

On 11/21/05, ?ukasz Hejnak <sziftgroup@wp.pl> wrote:
> Richard R napisa?(a):
> > am using linux kernel 2.6.14.2
>
> hmm.. well afaik the tarpit extension is only for kernels < 2.6
> *btw, I just checked, here's how it looks
>
> http://svn.netfilter.org/cgi-bin/viewcvs.cgi/trunk/patch-o-matic-ng/patch=
lets/TARPIT/info?rev=3D4018&view=3Dmarkup
> Title: iptables TARPIT target
> Author: "Aaron Hopkins" <lists@die.net >
> Status: Works for me
> Repository: extra
> Requires: linux < 2.6.0
>
> > How do I get TARPIT working on a linux kernel 2.6.14.2 based system?
> well so far (I have also a 2.6.x kernel) I've been using the pom
> and just changing the above in the 'info' file to "> 2.4.0" and it
> didn't complain about a thing ;) I know that's a dirty way of doing it,
> but hey, it's working fine for me :)
>
> --
> Best wishes
> ?ukasz Hejnak
>
>

