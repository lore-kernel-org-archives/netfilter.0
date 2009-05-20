From: Philip Craig <philipc@snapgear.com>
Subject: Re: conntrack and RSTs received during CLOSE_WAIT
Date: Wed, 20 May 2009 17:31:05 +1000
Message-ID: <4A13B1B9.5000109@snapgear.com>
References: <4A0DE859.7000209@tigertech.com> <alpine.DEB.2.00.0905162348430.4156@blackhole.kfki.hu> <4A0F7FEE.3010405@tigertech.com> <4A139222.2020505@tigertech.com> <alpine.DEB.2.00.0905200904310.10018@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0905200904310.10018@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Robert L Mathews <lists@tigertech.com>, netfilter@vger.kernel.org

Jozsef Kadlecsik wrote:
> Without TCP window tracking in conntrack, *any* RST segment (with proper 
> src/dst ip/port, of course) would destroy the conntrack entry. With window 
> tracking enabled (the default) we can maintain a window of the sequence 
> numbers which are accepted and processed by conntrack. Due to the fact 
> that the firewall sits in the middle and packets which have been seen by 
> the firewall may get lost or even reordered in transit to the destination, 
> it is inpossible to calculate the *exact* window sizes of the two end 
> points. Therefore the window in conntrack wider and conntrack may process 
> packets which otherwise are outside of the window of the receiver.

Is this the same reason why the window tracking accepts pure acks
without checking the sequence?

