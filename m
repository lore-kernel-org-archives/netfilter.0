From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: Re: cannot use != with ct status
Date: Wed, 14 Oct 2020 12:25:40 +0200 (CEST)
Message-ID: <alpine.DEB.2.23.453.2010141221380.6472@localhost>
References: <CY4PR1001MB23116E94084D4CC5610C79C2E8050@CY4PR1001MB2311.namprd10.prod.outlook.com> <20201014100402.GA19556@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20201014100402.GA19556@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "Ramsay, Lincoln" <Lincoln.Ramsay@digi.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, 14 Oct 2020, Pablo Neira Ayuso wrote:

> On Wed, Oct 14, 2020 at 04:16:40AM +0000, Ramsay, Lincoln wrote:
> > Hi,
> > 
> > I've just confirmed that I can't make a rule that matches ct status != dnat.
> 
> ct status == dnat and ct state != dnat checks for _exact_ matching.
> 
> Then:
> 
>         ct status dnat
> 
> based on the datatype, provides a shortcut for
> 
>         ct status and dnat == dnat

Sorry, but it looks like really strange. "ct status nat" would be more 
natural to me.

> For inverted matching, please use:
> 
>         ct status and dnat != dnat

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
