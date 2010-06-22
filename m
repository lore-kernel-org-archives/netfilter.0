From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: h323 ALG .
Date: Tue, 22 Jun 2010 15:15:38 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1006221513380.2393@blackhole.kfki.hu>
References: <AANLkTilxYbk1LBMGelD3NAzSeUXmKm_oWmepxVL8M9Hb@mail.gmail.com> <alpine.DEB.2.00.1006221348240.2393@blackhole.kfki.hu> <AANLkTikkysjYCFbZAsmnCDSX6ExiAGaQPue--XtGws4r@mail.gmail.com> <alpine.DEB.2.00.1006221435590.2393@blackhole.kfki.hu>
 <AANLkTimByxaiayUJc6JxD04N91-I2rU1f7p_Dko-v9QN@mail.gmail.com> <alpine.DEB.2.00.1006221449380.2393@blackhole.kfki.hu> <AANLkTimfiiRfsPtOO0va7Q_1xoJsfCBSCUCVCadv-myx@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimfiiRfsPtOO0va7Q_1xoJsfCBSCUCVCadv-myx@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Tue, 22 Jun 2010, ratheesh k wrote:

> On Tue, Jun 22, 2010 at 6:30 PM, Jozsef Kadlecsik
> <kadlec@blackhole.kfki.hu> wrote:
> >
> > Technically the same happens with H.323, except that that is a more
> > complex protocol.
> 
> This is perfectly fine . Suppose  ftp client is  on wan side and want
> to establish a connection to a server sitting on lan side . what will
> happen ? . This is my question . 

Your rules block the connection.

> Will this work in case of H323 ?

The same happens with H.32: your rules block the connection.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
