From: =?iso-8859-2?B?o3VrYXN6IE5pZXJ5Y2izbw==?= <nofast@welnowiec.net>
Subject: Re: IPSET iptree problem
Date: Thu, 23 Aug 2007 15:09:51 +0200
Message-ID: <op.txij6pdb343eys@comnetlap2.biuro.lan>
References: <C9039844-4303-4FD1-9704-41366AFF5884@stanford.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <C9039844-4303-4FD1-9704-41366AFF5884@stanford.edu>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: netfilter@lists.netfilter.org



Hello Craig,

The answer is no. :(
I think it is something with garbage colector because if
you modify line 32 in file:
/usr/src/linux/net/ipv4/netfilter/ip_set_iptree.c
#define IPTREE_GC_TIME 5*60

to:
#define IPTREE_GC_TIME 1*60

(and recompile kernel modules)

this funny feature is available for one minute instead of 5
( after modules ip_set and ip_set_iptree are loaded
into memory )

After IPTREE_GC_TIME all is ok for some unknown period of
time, but finally this malfunction comes again.

=A3ukasz Nierych=B3o

> =A3ukasz (and Jozsef),
> I am experiencing the same problem you cited below.
> The funny thing is that I am almost sure that it was working for several =
=20
> weeks, but now I see the exact behavior in your email.
> Did you ever find a solution to this?

