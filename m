From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Gathering netfilter-related usage information
Date: Wed, 18 Jul 2012 22:11:02 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1207182208230.13646@blackhole.kfki.hu>
References: <CAPfcJat8-b2sYOCzPjAAbZgLPM4Edz6MuusS1EXUVnn7KghvYA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPfcJat8-b2sYOCzPjAAbZgLPM4Edz6MuusS1EXUVnn7KghvYA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero <aborrero@cica.es>
Cc: netfilter@vger.kernel.org

On Wed, 18 Jul 2012, Arturo Borrero wrote:

> I don't know how to collect:
> 
> ? Data about ipset memory usage (kernel pages, bytes or whatever)

"ipset list -terse" lists just the headers of the sets, including the 
amount of allocated bytes for every set.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
