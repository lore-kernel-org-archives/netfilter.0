From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset memory usage
Date: Wed, 26 Aug 2015 20:22:59 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1508261946410.9155@blackhole.kfki.hu>
References: <CAA5aLPgxW=-hJcBLxagCKTgX26mHg9XAmsr-UVoS3s0n50oEDA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA5aLPgxW=-hJcBLxagCKTgX26mHg9XAmsr-UVoS3s0n50oEDA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akshat Kakkar <akshat.1984@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 25 Aug 2015, Akshat Kakkar wrote:

> As per info in 
> http://lists.netfilter.org/pipermail/netfilter/2005-September/062859.html, 
> ipset of iphash of 20Million IPs, takes around only 80MB. I understand 
> that this might be simply multiplication of 20Million with 4 bytes which 
> IP takes if stored normally.
> 
> But when I try to replicate this I am getting size in memory as
> 506,481,176 (around 483MB) for number of entries 16,581,375.
> 
> This comes to around 30Bytes per IP.
> 
> I have got this values from ipset -L command
> 
> Is this much size anticipated?

At that time we had ipset 2.x - now it's 6.x. The algorithm behind the 
hash types has been completely rewritten since then and memory had been 
sacrified for the sake of speed. So that number does not apply to the 
current ipset memory usage.

The memory requirement for the hash types depends on the hashsize (H) and 
the number of elements (N) and it is something like (not counting some 
basic fixed structures):

H * 40byte + (N/4 + N%4) * 4 * element size

The RCU support also increased significantly the memory requirement.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
GGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
