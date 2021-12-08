From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: Re: delete matching rule like it can be done in case of iptables
Date: Wed, 8 Dec 2021 13:06:56 +0100 (CET)
Message-ID: <b2a3f94-ee47-1751-5e9b-c772a2e5a29d@netfilter.org>
References: <5e5887f6-69f4-7aca-175c-d4b6faf90eb1@gmail.com> <Ya4L/rS/mCwzqt25@salvia> <af021a3d-b4d4-28d4-df66-12a16f7977f2@gmail.com> <4bc86df1-3971-7729-6a41-477262879b90@tootai.net> <742f7f1d-a182-c1a1-7f7e-788f51fb03fb@gmail.com>
 <72cffe4b-aee3-abd4-042b-83f576f4be13@tootai.net> <a3b6fdcb-daca-53f4-2640-aef7d3258f77@jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a3b6fdcb-daca-53f4-2640-aef7d3258f77@jubileegroup.co.uk>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "G.W. Haywood" <netfilter@jubileegroup.co.uk>
Cc: Netfilter list <netfilter@vger.kernel.org>

Hi,

On Wed, 8 Dec 2021, G.W. Haywood wrote:

> On Tue, 7 Dec 2021, Daniel wrote:
> 
> > myhandle=$(echo `$nft -sa list chain $1 $2 $3 |grep -F $4|grep -oP '(#
> > handle ).*'`|cut -d " " -f 3)
> 
> To me, quite apart from the reliance on a bunch of system utilities 
> which I'd really prefer to avoid in an operation of this kind, that 
> looks unnecessarily complex and rather fragile.
> 
> This whole discussion suggests that something is missing from nft.

I know not all kind of rulesets can be managed thus, but I suggest to rely 
heavily on sets, maps in nft. In lots of cases one can achieve technically 
static rules while the ruleset is fully dynamic, because all the 
modifications happen in the sets/maps.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
