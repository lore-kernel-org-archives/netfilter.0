From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: wrong info in ipset man pages
Date: Wed, 26 Aug 2015 20:35:43 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1508262028270.9155@blackhole.kfki.hu>
References: <CAA5aLPj0FgFzhbPvtAKF3shX2V9Eeu-cBpkPdODqp6foKW_opA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA5aLPj0FgFzhbPvtAKF3shX2V9Eeu-cBpkPdODqp6foKW_opA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akshat Kakkar <akshat.1984@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, 26 Aug 2015, Akshat Kakkar wrote:

> With regards to ipset type hash:ip,mark, it is mentioned that
> 
> """
> The hash:ip,mark type of sets require two src/dst parameters of the
> set match and SET target kernel modules.
> """
> 
> However as it invoves storing mark, which has nothing to do with
> src/dst parametes, so it should be mentioned something like

No, see below.
 
> """
> The hash:ip,mark type of sets require one src/dst IP/network and
> fwmark of the set match and SET target kernel modules.
> """

Set type specific "direction" parameters were possible only if there were 
no list set type which may contain any kind of set, and if there was no 
possible to swap sets.

The syntax MUST be acceptable for all possible set types, regardless of 
the real meaning of the individual elemet parts in a given set type.

> Besides, as this is the only set which hashes mark also, so exactly
> which IPTABLES module to use should also be mentioned.

Why? The same iptables modules can be used as with all other set types: 
set match and SET target.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
