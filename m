From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: Fwd: ipset and counters
Date: Tue, 7 May 2013 15:40:12 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1305071535090.16401@blackhole.kfki.hu>
References: <51752B00.8090908@metu.edu.tr> <51753143.8090908@metu.edu.tr> <alpine.DEB.2.00.1304221554230.16792@blackhole.kfki.hu> <5175432F.2060304@metu.edu.tr> <alpine.DEB.2.00.1304221921001.19576@blackhole.kfki.hu> <loom.20130506T151314-549@post.gmane.org>
 <alpine.DEB.2.00.1305061535250.12392@blackhole.kfki.hu> <003a01ce4a68$7ccb5e40$76621ac0$@com> <alpine.DEB.2.00.1305062022050.15306@blackhole.kfki.hu> <002b01ce4b1b$1e766980$5b633c80$@com> <alpine.DEB.2.00.1305071409560.16401@blackhole.kfki.hu>
 <002c01ce4b27$5026a240$f073e6c0$@com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <002c01ce4b27$5026a240$f073e6c0$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tian fang <tianfang@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 7 May 2013, tian fang wrote:

> And I have the last question ,what is the maximum number of the ipset bytes
> counters ?

You cannot have either byte or packet counters, only both. If a set is 
defined with counters, then all its elements are created with counters.

The limit is the physical RAM of your machine.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
