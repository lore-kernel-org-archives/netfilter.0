From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Conntrack not matching properly - producing serious outages
Date: Thu, 11 Aug 2011 22:21:11 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1108112218430.8518@blackhole.kfki.hu>
References: <1313055975.3628.56.camel@denise.theartistscloset.com>  <alpine.DEB.2.00.1108111207330.5476@blackhole.kfki.hu>  <1313064590.3628.69.camel@denise.theartistscloset.com>  <alpine.DEB.2.00.1108111421090.5476@blackhole.kfki.hu>
 <1313090042.3628.83.camel@denise.theartistscloset.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1313090042.3628.83.camel@denise.theartistscloset.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: netfilter@vger.kernel.org

On Thu, 11 Aug 2011, John A. Sullivan III wrote:

> > That might be related to SACK option handling: some "clever" devices loves 
> > to mangle TCP SEQ/ACK values, but forget about the SACK options. Try to 
> > disable SACK support on both communicating endpoints. If the problem 
> > disappears, then it's a SACK issue.
> > 
> <snip>
> Alas, it is not SACK.  We disabled sack and dsack on both sides of one
> user and it still took all of a few seconds for him to lock up.
> 
> Where do we look next? Thanks - John

Please capture a full TCP session traffic (from the very first SYN to 
the very last ACK) with "tcpdump -s 0 ..." and send me the pcap 
file. Then I'll be able to replay it and check what's going on.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
