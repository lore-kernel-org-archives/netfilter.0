From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ipset kernel panic
Date: Thu, 18 Oct 2012 09:34:18 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1210180929340.2232@blackhole.kfki.hu>
References: <CADuigkXeFM+N89kwzr8pUPKN5A-qccK5-4juYmutYCcq8XHC4g@mail.gmail.com> <alpine.DEB.2.00.1210150927390.4945@blackhole.kfki.hu> <CADuigkW5n0vxVm3eKykw-pV7WH6xe7YP0cAEQcS5EF5BnNaTkw@mail.gmail.com>
 <CADuigkWtZzuWRavME_YOx5wfn+dtge=iuXF+HhO540J--D8a7A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADuigkWtZzuWRavME_YOx5wfn+dtge=iuXF+HhO540J--D8a7A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ricardo Klein <klein.rfk@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 17 Oct 2012, Ricardo Klein wrote:

> it still explode with kernel panic when I try:
> [root@fwbalance bin]# ipset create allowed_macs bitmap:ip,mac range
> 0.0.0.0/0
> 
> CentOS 6.3 64bits
> ipset 6.14 (compiled right now only with --prefix=/usr --libdir=/usr/lib64)

You did not install the kernel modules from the ipset-6.14 package and 
still run the ones from your system.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
