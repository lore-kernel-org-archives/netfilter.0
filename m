From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: conntrack and RSTs received during CLOSE_WAIT
Date: Wed, 20 May 2009 09:19:27 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905200904310.10018@blackhole.kfki.hu>
References: <4A0DE859.7000209@tigertech.com> <alpine.DEB.2.00.0905162348430.4156@blackhole.kfki.hu> <4A0F7FEE.3010405@tigertech.com> <4A139222.2020505@tigertech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A139222.2020505@tigertech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert L Mathews <lists@tigertech.com>
Cc: netfilter@vger.kernel.org

On Tue, 19 May 2009, Robert L Mathews wrote:

> But I will mention that I'm surprised that this didn't generate more
> discussion. Unless I'm confused (which is possible), sending out-of-sequence
> RST packets appears to be a trivial way to bypass connlimit.
>
> It seems that all an attacker needs to do is send invalid RST packets with a
> sequence number one less than the last ACK received from the server. Then
> conntrack will forget about the connection, allowing the attacker to open as
> many connections as desired, regardless of connlimit limits.

Without TCP window tracking in conntrack, *any* RST segment (with proper 
src/dst ip/port, of course) would destroy the conntrack entry. With window 
tracking enabled (the default) we can maintain a window of the sequence 
numbers which are accepted and processed by conntrack. Due to the fact 
that the firewall sits in the middle and packets which have been seen by 
the firewall may get lost or even reordered in transit to the destination, 
it is inpossible to calculate the *exact* window sizes of the two end 
points. Therefore the window in conntrack wider and conntrack may process 
packets which otherwise are outside of the window of the receiver.
 
> I wrote a little perl script that I can leave running in the background on the
> client to send the necessary RST packets. In my testing, it does allow me to
> bypass connlimit restrictions on a server:
> 
>  http://www.tigertech.net/patches/rawip.pl
> 
> This seems to make connlimit less useful than I'd previously believed. Am I
> just misunderstanding something?

No, you are correct. If you want to eliminate the possibility to bypass 
connlimit with properly crafted RST segments, probably you should use the 
recent match and count the created NEW connections.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
