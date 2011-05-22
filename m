From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sun, 22 May 2011 23:21:39 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105222319130.27638@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu>
 <alpine.LNX.2.01.1105212331570.16146@frira.zrqbmnf.qr> <4DD83187.2060301@googlemail.com> <alpine.LNX.2.01.1105212349310.18080@frira.zrqbmnf.qr> <alpine.DEB.2.00.1105220055320.24174@blackhole.kfki.hu> <4DD86081.1020703@googlemail.com>
 <alpine.DEB.2.00.1105221157540.25858@blackhole.kfki.hu> <4DD8F71E.2010004@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD8F71E.2010004@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

On Sun, 22 May 2011, Mr Dash Four wrote:

> > If you want me to be able to reproduce and fix the issue, please send me the
> > full data you used. I assumed the restore files you sent me contained the
> > case where the segfaults popped up. Apparently it's not, because there's no
> > such commands in them.
> >   
> Try this and let me know how far do you get:
> 
> n priviledged-ports bitmap:port range 1-1023 timeout 0
> a priviledged-ports 1-1023
> n test-net bitmap:ip range 10.1.1.172/29 timeout 0
> a test-net 10.1.1.172/29
> n test-ports bitmap:port range 12770-19999 timeout 0
> a test-ports 12770-12784
> a test-ports 19999
> n test-port bitmap:port range 29950-29950 timeout 0
> a test-port 29950
> COMMIT

Thanks, that helped a lot! The ipset binary doesn't handle different sets 
in a single restore file. I'll fix it in the next days.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
