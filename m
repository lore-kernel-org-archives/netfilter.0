From: Philip Craig <philipc@snapgear.com>
Subject: Re: conntrack and RSTs received during CLOSE_WAIT
Date: Wed, 20 May 2009 18:06:00 +1000
Message-ID: <4A13B9E8.5010509@snapgear.com>
References: <4A0DE859.7000209@tigertech.com> <alpine.DEB.2.00.0905162348430.4156@blackhole.kfki.hu> <4A0F7FEE.3010405@tigertech.com> <4A139222.2020505@tigertech.com> <alpine.DEB.2.00.0905200904310.10018@blackhole.kfki.hu> <4A13B1B9.5000109@snapgear.com> <alpine.DEB.2.00.0905200938100.10018@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0905200938100.10018@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Robert L Mathews <lists@tigertech.com>, netfilter@vger.kernel.org

Jozsef Kadlecsik wrote:
> You mean, when the ack flag is not set in the packet, we handle it as it 
> was set and had a proper ack field? What else could be done? :-)

No, I mean when there the ack flag is set, but there is no data,
as handled by this code:

         if (seq == end
            && (!tcph->rst
                || (seq == 0 && state->state == TCP_CONNTRACK_SYN_SENT)))
                /*
                 * Packets contains no data: we assume it is valid
                 * and check the ack value only.
                 * However RST segments are always validated by their
                 * SEQ number, except when seq == 0 (reset sent answering
                 * SYN.
                 */
                seq = end = sender->td_end;


We've encountered this in practice where a 'tcp accelerator' was
creating a new tcp connection with all the same port numbers, but
a different sequence number, and the tcp conntrack was accepting
a pure ack packet as part of the old connection, even though the
sequence number was wrong.  This setup won't work no matter what
tcp conntrack does of course, but it did complicate working out
what was going on.
