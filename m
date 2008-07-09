From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: conntrack and ESTABLISHED / UNREPLIED connections
Date: Wed, 9 Jul 2008 08:54:06 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0807090842270.11391@blackhole.kfki.hu>
References: <486D31D9.9070900@tigertech.com> <4872A115.2030604@tigertech.com>
 <Pine.LNX.4.64.0807081130220.7417@blackhole.kfki.hu> <4873A605.1010209@tigertech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4873A605.1010209@tigertech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert L Mathews <lists@tigertech.com>
Cc: netfilter@vger.kernel.org

On Tue, 8 Jul 2008, Robert L Mathews wrote:

> Jozsef Kadlecsik wrote:
> 
> > If the data packet sent by the server is valid, the client should send an
> > ACK and not a RST packet. If the data packet is invalid, the client should
> > send an ACK again and not a RST. 
> 
> Actually, unless I'm misunderstanding, RFC1122 section 4.2.2.13 seems to allow
> what the client is doing:
> 
>   A host MAY implement a "half-duplex" TCP close sequence, so
>   that an application that has called CLOSE cannot continue to
>   read data from the connection.  If such a host issues a
>   CLOSE call while received data is still pending in TCP, or
>   if new data is received after CLOSE is called, its TCP
>   SHOULD send a RST to show that data was lost.
> 
> So in this case, the client app closed the connection even though there was
> data from the server that hadn't been delivered, and the client's TCP stack
> replied with a RST as described above.

Yes, that's correct and I was wrong above.
  
> > If the server receives the RST packet (and it's valid) it should never ever
> > send unsent data but destroy the connection.
> 
> That's what I would have thought, but packet dumps are showing otherwise. On a
> standard Debian 2.6.24 kernel it keeps retrying the un-acked packet for more
> than a minute despite the RST, as shown at the end of:
> 
>  http://tigertech.net/20080703.tcpdump.server.txt

Is the RST segment valid? Could you create a dump file using the '-S' flag 
of tcpdump so that not relative but absolute sequence numbers are printed?
 
Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
