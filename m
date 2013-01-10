From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.16.1 released
Date: Thu, 10 Jan 2013 10:06:56 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1301101004540.11247@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1211271510180.15929@blackhole.kfki.hu> <20130109134804.GL31644@workstation> <alpine.DEB.2.00.1301092342440.10144@blackhole.kfki.hu> <alpine.LNX.2.01.1301100011360.21351@nerf07.vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1301100011360.21351@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: Andreas Herz <andi@geekosphere.org>, netfilter@vger.kernel.org

On Thu, 10 Jan 2013, Jan Engelhardt wrote:

> 
> On Wednesday 2013-01-09 23:44, Jozsef Kadlecsik wrote:
> >-			KCFLAGS="-DPACKAGE_VERSION=$(PACKAGE_VERSION)" \
> >+			KCFLAGS="-DPACKAGE_VERSION=$(PACKAGE_VERSION)-DINLINE=$(INLINE)" \
> 
> You seem to be missing a space before -DINL

You're right, thanks! Fortunately that's in the sparse mode compiling 
part, so the patch still can be give a go for testing.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
