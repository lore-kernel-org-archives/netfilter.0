From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: [ANNOUNCE] ipset-2.3.2
Date: Thu, 3 Jul 2008 19:17:21 +0100 (BST)
Message-ID: <Pine.LNX.4.58.0807031849570.14344@mail3.jubileegroup.co.uk>
References: <Pine.LNX.4.64.0807021449020.32444@blackhole.kfki.hu>
 <Pine.LNX.4.64.0807021536140.4958@bizon.gios.gov.pl>
 <Pine.LNX.4.64.0807021545290.32444@blackhole.kfki.hu>
 <Pine.LNX.4.64.0807021547090.4958@bizon.gios.gov.pl>
 <Pine.LNX.4.64.0807021559170.32444@blackhole.kfki.hu>
 <Pine.LNX.4.64.0807031150290.1816@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0807031150290.1816@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Krzysztof Oledzki <ole@ans.pl>, netfilter@vger.kernel.org

Hi there,

On Thu, 3 Jul 2008, Jozsef Kadlecsik wrote:

> ...  released ipset-2.3.2a, which includes the required bits and
> files with and updated README file on how to compile modular and
> non-modular kernels with ipset support. Please give it a try ...

----------------------------------------------------------------------
prompt$ >>> ./libc.so.6
GNU C Library stable release version 2.3.4, by Roland McGrath et al.
Copyright (C) 2004 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.
Compiled by GNU CC version 3.3.4.
Compiled on a Linux 2.4.29 system on 2005-01-28.
Available extensions:
        GNU libio by Per Bothner
        crypt add-on version 2.1 by Michael Glad and others
        GNU Libidn by Simon Josefsson
        linuxthreads-0.10 by Xavier Leroy
        BIND-8.2.3-T5B
        libthread_db work sponsored by Alpha Processor Inc
        NIS(YP)/NIS+ NSS modules 0.19 by Thorsten Kukuk
For bug reporting instructions, please see:
<http://www.gnu.org/software/libc/bugs.html>.
----------------------------------------------------------------------
prompt$ >>> gcc -v
Using built-in specs.
Target: i686-pc-linux-gnu
Configured with: /home/ged/src/gcc-4.0.2/configure
Thread model: posix
gcc version 4.0.2
----------------------------------------------------------------------

I followed the instructions on the Web page:

http://ipset.netfilter.org/install.html

(it wasn't hard:)

Very smooth, no problems at all.  Thank you very much.

I suppose a 2.4 kernel is out of the question?

I only ask because the place I really _need_ ipsets is on a machine that's
still running a 2.4 kernel - the one that's sending this mail - currently
it has 45,000 ipsets. :)

--

73,
Ged.
