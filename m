From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: conntrack and RSTs received during CLOSE_WAIT
Date: Wed, 20 May 2009 09:42:14 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905200938100.10018@blackhole.kfki.hu>
References: <4A0DE859.7000209@tigertech.com> <alpine.DEB.2.00.0905162348430.4156@blackhole.kfki.hu> <4A0F7FEE.3010405@tigertech.com> <4A139222.2020505@tigertech.com> <alpine.DEB.2.00.0905200904310.10018@blackhole.kfki.hu> <4A13B1B9.5000109@snapgear.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A13B1B9.5000109@snapgear.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philip Craig <philipc@snapgear.com>
Cc: Robert L Mathews <lists@tigertech.com>, netfilter@vger.kernel.org

On Wed, 20 May 2009, Philip Craig wrote:

> Jozsef Kadlecsik wrote:
> > Without TCP window tracking in conntrack, *any* RST segment (with proper 
> > src/dst ip/port, of course) would destroy the conntrack entry. With window 
> > tracking enabled (the default) we can maintain a window of the sequence 
> > numbers which are accepted and processed by conntrack. Due to the fact 
> > that the firewall sits in the middle and packets which have been seen by 
> > the firewall may get lost or even reordered in transit to the destination, 
> > it is inpossible to calculate the *exact* window sizes of the two end 
> > points. Therefore the window in conntrack wider and conntrack may process 
> > packets which otherwise are outside of the window of the receiver.
> 
> Is this the same reason why the window tracking accepts pure acks
> without checking the sequence?

You mean, when the ack flag is not set in the packet, we handle it as it 
was set and had a proper ack field? What else could be done? :-)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
