From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: conntrack and RSTs received during CLOSE_WAIT
Date: Wed, 20 May 2009 10:43:21 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905201025480.10018@blackhole.kfki.hu>
References: <4A0DE859.7000209@tigertech.com> <alpine.DEB.2.00.0905162348430.4156@blackhole.kfki.hu> <4A0F7FEE.3010405@tigertech.com> <4A139222.2020505@tigertech.com> <alpine.DEB.2.00.0905200904310.10018@blackhole.kfki.hu> <4A13B1B9.5000109@snapgear.com>
 <alpine.DEB.2.00.0905200938100.10018@blackhole.kfki.hu> <4A13B9E8.5010509@snapgear.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A13B9E8.5010509@snapgear.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philip Craig <philipc@snapgear.com>
Cc: Robert L Mathews <lists@tigertech.com>, netfilter@vger.kernel.org

On Wed, 20 May 2009, Philip Craig wrote:

> Jozsef Kadlecsik wrote:
> > You mean, when the ack flag is not set in the packet, we handle it as it 
> > was set and had a proper ack field? What else could be done? :-)
> 
> No, I mean when there the ack flag is set, but there is no data,
> as handled by this code:
> 
>          if (seq == end
>             && (!tcph->rst
>                 || (seq == 0 && state->state == TCP_CONNTRACK_SYN_SENT)))
>                 /*
>                  * Packets contains no data: we assume it is valid
>                  * and check the ack value only.
>                  * However RST segments are always validated by their
>                  * SEQ number, except when seq == 0 (reset sent answering
>                  * SYN.
>                  */
>                 seq = end = sender->td_end;
> 
> We've encountered this in practice where a 'tcp accelerator' was
> creating a new tcp connection with all the same port numbers, but
> a different sequence number, and the tcp conntrack was accepting
> a pure ack packet as part of the old connection, even though the
> sequence number was wrong.  This setup won't work no matter what
> tcp conntrack does of course, but it did complicate working out
> what was going on.

I see. The rationale behind not checking the sequence number in this case 
is that there's no data in the packet. If the packet is out of the window 
of the receiver, it'll answer with an ack with the proper seq, ack values.

But it can be argued that conntrack should still check the sequence number 
of dataless packets too :-).

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
