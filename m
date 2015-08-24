From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: make modules_install Error : Can't read private key
Date: Mon, 24 Aug 2015 12:53:15 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1508241251250.23047@blackhole.kfki.hu>
References: <CAA5aLPiSBfyEqymTJ0rBU2zjBV2k1ruw9x9N3tJuKWhF8vCe9Q@mail.gmail.com> <alpine.DEB.2.10.1508202024190.2398@blackhole.kfki.hu> <CAA5aLPhJ7H6oYQM4L2Cv1_Wbz-93YxPERVO6c9H8i1gcrsVrYA@mail.gmail.com>
 <CAA5aLPhkdi+9C-tNo_+kLc31yUycQ=n4VUUTJaTyhRBBt_kHSQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA5aLPhkdi+9C-tNo_+kLc31yUycQ=n4VUUTJaTyhRBBt_kHSQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akshat Kakkar <akshat.1984@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Mon, 24 Aug 2015, Akshat Kakkar wrote:

> Please help ...
> 
> On Fri, Aug 21, 2015 at 10:32 AM, Akshat Kakkar <akshat.1984@gmail.com> wrote:
> > o/p of  strace -f make install_modules

There's no install_modules target, but modules_install:

ipset$ make help
  <nothing>              - Compile userspace
  modules                - Compile kernel modules
  install                - Install userspace
  modules_install        - Install kernel modules
  clean                  - Remove generated userspace files
  modules_clean          - Remove generated kernelspace files
  tidy                   - Tidy up the whole source tree
  tests                  - Run testsuite
  sparse                 - Check userspace with sparse
  modules_sparse         - Check kernelspace with sparse
  update_includes        - Update userspace include files
  update_utils           - Update bash utilities
  check_libmap           - Check libipset.map for missing symbols
  tarball                - Create a tarball for a new release

That is run "make modules_install".

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
