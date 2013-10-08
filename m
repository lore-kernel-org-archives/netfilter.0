From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset compile error
Date: Tue, 8 Oct 2013 21:20:14 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1310082117530.20997@blackhole.kfki.hu>
References: <5253A5F7.1090403@metu.edu.tr> <alpine.DEB.2.00.1310081008350.22464@blackhole.kfki.hu> <alpine.DEB.2.00.1310081029390.22464@blackhole.kfki.hu> <5253E85D.3060202@metu.edu.tr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5253E85D.3060202@metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Husnu Demir <hdemir@metu.edu.tr>
Cc: netfilter@vger.kernel.org

On Tue, 8 Oct 2013, Husnu Demir wrote:

> /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c: In
> function ?hash_netnet4_kadt?:
> /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:141:
> error: unknown field ?cidr? specified in initializer

I could reproduce it: this is a strange gcc initialization issue of 
unnamed union elements and I rearranged the code to solve it. Please pull 
the changes from the git tree, it should compile now cleanly.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
