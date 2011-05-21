From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sat, 21 May 2011 21:58:36 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105212154180.23473@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD8158D.4040306@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Sat, 21 May 2011, Mr Dash Four wrote:

> gave up when I reached 16777216! ipset though was still insisting that the
> hash size is "full":
> 
> maxelem 15000 hashsize 4194304

When you asked about maxelem and hashsize, I wrote:

> > Is this a constraint coming from the "maxelem" value or the hash size? 
> > Could this be corrected by increasing either of these?

> Yes, of course: use larger maxelem. The initial hash size value can also 
> be increased, that way you can spare some internal resizings.

You still have "maxelem 15000". That means there can be at the maximum 
15000 element in the hash, and in another words, ipset regards the set 
full when its elem count reaches 15000.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
