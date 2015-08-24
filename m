From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: make modules_install Error : Can't read private key
Date: Mon, 24 Aug 2015 19:21:47 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1508241912110.28598@blackhole.kfki.hu>
References: <CAA5aLPiSBfyEqymTJ0rBU2zjBV2k1ruw9x9N3tJuKWhF8vCe9Q@mail.gmail.com> <alpine.DEB.2.10.1508202024190.2398@blackhole.kfki.hu> <CAA5aLPhJ7H6oYQM4L2Cv1_Wbz-93YxPERVO6c9H8i1gcrsVrYA@mail.gmail.com> <CAA5aLPhkdi+9C-tNo_+kLc31yUycQ=n4VUUTJaTyhRBBt_kHSQ@mail.gmail.com>
 <alpine.DEB.2.10.1508241251250.23047@blackhole.kfki.hu> <CAA5aLPisw07FDgaBH3gzNp3jDHmV1qgjKvBKWpGghpini81Wpw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA5aLPisw07FDgaBH3gzNp3jDHmV1qgjKvBKWpGghpini81Wpw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akshat Kakkar <akshat.1984@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Mon, 24 Aug 2015, Akshat Kakkar wrote:

> The o/p of strace -f make modules_install is attached as it is very big.

You should have sent such a huge file privately to me only, instead of 
the whole mailing list...

Searching the log for "key":

[pid 31645] execve("/bin/perl", ["perl", 
"/usr/src/kernels/3.10.0-229.11.1"..., "sha256", "./signing_key.priv", 
"./signing_key.x509", "/lib/modules/3.10.0-229.11.1.el7"...], [/* 103 vars 
*/]) = 0

So apparently SL 7 wants to sign the kernel modules. However it doesn't 
work because the required private and public key files are assumed to be 
in the working directory.

I don't have RedHat based systems. Read 
https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/System_Administrators_Guide/sect-signing-kernel-modules-for-secure-boot.html 
and decide that you need signed kernel modules or not, and if yes, then 
where your key files are located. Then possibly symlinking them into the 
ipset source directory is enough for a successful, signed module 
installation.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
