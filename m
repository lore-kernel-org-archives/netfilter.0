From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: TEE target
Date: Thu, 15 Nov 2007 13:19:59 +0100
Message-ID: <000801c82781$d7616d50$0b0ffe0a@NS006819>
References: <000401c82770$f90872c0$0b0ffe0a@NS006819> <Pine.LNX.4.58.0711151043370.30232@mail3.jubileegroup.co.uk>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0711151043370.30232@mail3.jubileegroup.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

G.W. Gaywood wrote:
> Hi there,
[...]
> You might need this:
>
> http://www.iptables.org/projects/patch-o-matic/pom-extra.html

Sorry, but no: the ROUTE target doesn't work on recent kernels, just
like what I cooked from what I already found of TEE didn't.

Sebastian Classen wrote:
> We are now using the TEE-Target in production environment for
> a few weeks now and it seems to work well.
>
> @Jan: Find attached a patch with some little final bug fixes.
> Now it compiles with current stable 2.6.23.1 kernel. Please
> add this to your SVN.
>
> @Rob: I guess the best idea is to fetch it from
> http://dev.computergmbh.de/wsvn/misc_kernel/xt_TEE/ but after
> Jan adds the patches ;)

Yes, thanks! I wanted to use it on 2.6.23.1.

Jan Engelhardt wrote:
> Should have been /include/linux/netfilter/xt_TEE.h - changed
> accordingly. The .h file is what the build depends on, not
> the .c file.
>
> Merged the rest.

Thanks! I'm going to give it a shot.


Grts,
Rob



