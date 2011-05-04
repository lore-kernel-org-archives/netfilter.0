From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables 1.4.10 - statically linked
Date: Wed, 4 May 2011 11:32:24 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105041023240.14677@obet.zrqbmnf.qr>
References: <BANLkTikG1rhGATqVpSKGn_7iP256pN+k0A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTikG1rhGATqVpSKGn_7iP256pN+k0A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Ernst <ernst997@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-05-04 09:10, Christian Ernst wrote:

>Hello all
>
>i'm trying to compile iptables 1.4.10  statically linked. The
>challenge i'm facing is that even if i compile the following way i get
>a dynamically linked binary.
>
>Here is my proceeding:
>
>./configure --enable-static --enable-shared=no
>make NO_SHARED_LIBS=1
>make install

libtool-provided --enable-{static,shared} controls the state of built 
librarires, not executables.
Nothing is explicitly provided to make standalone executables
for they do not offer much of value.
