From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: unknown option "--map-set"
Date: Wed, 12 Aug 2015 11:29:28 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1508121126170.15443@blackhole.kfki.hu>
References: <CAA5aLPg=UhPp0wODZc8qtx3FwnReM+3Qs4zFm9_8Fgap8LMvtg@mail.gmail.com> <CAA5aLPiHDNwK_mxiaTVYYCmZpkr1wyyjbMCa4CmQDhPrVVv3Yg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA5aLPiHDNwK_mxiaTVYYCmZpkr1wyyjbMCa4CmQDhPrVVv3Yg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akshat Kakkar <akshat.1984@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, 12 Aug 2015, Akshat Kakkar wrote:

> Well, it looks that the Sep 16 Snapshot didnt have the code for
> map-set option. But thats strange as the code was committed on Sep 14,
> so it should have been there.
> 
> Am I missing some very basic thing over here?

The date of the commit is when it was committed in my iptables tree. Then 
it was pulled to Pablo's tree and then the iptables snapshot created. So 
the snapshot at Sep 16 was released earlier than Pablo pulled the changes 
from my tree (which was committed there at Sep 14).

Best regards,
Jozsef 
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
