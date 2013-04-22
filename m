From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Fwd: ipset and counters
Date: Mon, 22 Apr 2013 15:57:45 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1304221554230.16792@blackhole.kfki.hu>
References: <51752B00.8090908@metu.edu.tr> <51753143.8090908@metu.edu.tr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51753143.8090908@metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Husnu Demir <hdemir@metu.edu.tr>
Cc: netfilter@vger.kernel.org

On Mon, 22 Apr 2013, Husnu Demir wrote:

> I want to give a try for COUNTERS properties of IPSET. But I could not
> manage it;
> 
> # ipset create COUNTERS bitmap:ip  counters
> ipset v6.17: Unknown argument: `counters'
> Try `ipset help' for more information.

What does "ipset help bitmap:ip" says? I suspect you have multiple 
binaries at different paths.
  
> I used ipset-20130422 BUILD. And;
> 
> # autogen.sh
> # ./configure
> # make
> # make install
> # make CONFIG_IP_SET_MAX=2048 modules
> # make CONFIG_IP_SET_MAX=2048 modules_install
> 
> # ipset -V
> ipset v6.17, protocol version: 6
> 
> There is a ipset v6.18 bu daily build says 6.17.

6.18 is a bugfix release, without any new feature. The counters will be 
announced in 6.19, but the master branch of the git tree already has got 
it (without bumping the version number).

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
