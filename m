From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Problems making ipset RPM
Date: Tue, 12 Aug 2008 12:38:21 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0808121237310.31275@fbirervta.pbzchgretzou.qr>
References: <4dd1211b0808120759y79181780hff56c7d6c1a14fb1@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4dd1211b0808120759y79181780hff56c7d6c1a14fb1@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Endres <epablo@pabloendres.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2008-08-12 10:59, Pablo Endres wrote:
>
>I've been trying unsuccessfully to build an RPM of the ipset
>extensions (which by the way a really great).
>
>The main problem is that I can't manage to do a 2 stage install:
>install in one temporary directory in order to package.  This is
>normally done with the DESTDIR variable and it works for the binaries
>but not for the kernel modules.  I've tried some tricks I found in
>other RPMs but they don't seam to work: INST_DIR, INST_PATH,
>0=$(DESTDIR) ....

You can use the Xtables-addons package which carries a mirror of ipset 
alongside in multi-stage compliant fashion (this is however just a side 
effect ;-).
