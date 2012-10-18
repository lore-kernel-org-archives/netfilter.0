From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ipset kernel panic
Date: Thu, 18 Oct 2012 14:42:03 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1210181439560.2232@blackhole.kfki.hu>
References: <CADuigkXeFM+N89kwzr8pUPKN5A-qccK5-4juYmutYCcq8XHC4g@mail.gmail.com> <alpine.DEB.2.00.1210150927390.4945@blackhole.kfki.hu> <CADuigkW5n0vxVm3eKykw-pV7WH6xe7YP0cAEQcS5EF5BnNaTkw@mail.gmail.com> <CADuigkWtZzuWRavME_YOx5wfn+dtge=iuXF+HhO540J--D8a7A@mail.gmail.com>
 <alpine.DEB.2.00.1210180929340.2232@blackhole.kfki.hu> <CADuigkVCEYuLdMA=Qgtphr81YnPZROyx5p-fy8imoUnPCViU3g@mail.gmail.com> <alpine.DEB.2.00.1210181330540.2232@blackhole.kfki.hu> <CADuigkVxYZHd==J97_g1ABCE=ExVfKRNabAqzuZhNjV0XCcLnQ@mail.gmail.com>
 <CADuigkXm99qcdm-GcaLSQQt0vreK7WxTs4AXv6sZKH+jxe4hDQ@mail.gmail.com> <alpine.DEB.2.00.1210181425120.2232@blackhole.kfki.hu> <CADuigkUPiUJMEooH7xbngxV_COWTDWpz+QnszPp_7AP4Pmopeg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADuigkUPiUJMEooH7xbngxV_COWTDWpz+QnszPp_7AP4Pmopeg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ricardo Klein <klein.rfk@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 18 Oct 2012, Ricardo Klein wrote:

> yeah... it not shows "revision xx" so I should need to recompile all
> entire kernel or can I just recompile this module?

Just follow the README file from ipset-6.14: compile and install the 
kernel modules from the package. There's no need to recompile the whole 
kernel tree.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
