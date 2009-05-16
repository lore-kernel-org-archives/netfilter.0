From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: conntrack and RSTs received during CLOSE_WAIT
Date: Sat, 16 May 2009 23:57:27 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905162348430.4156@blackhole.kfki.hu>
References: <4A0DE859.7000209@tigertech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A0DE859.7000209@tigertech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert L Mathews <lists@tigertech.com>
Cc: netfilter@vger.kernel.org

Hi,

On Fri, 15 May 2009, Robert L Mathews wrote:

> I'm using Linux kernel 2.6.26 with conntrack/connlimit to prevent people from
> DOSing our Web servers by opening up too many simultaneous connections from
> one IP address. This is mostly for protection against unintentional DOSes from
> broken proxy servers that try to open up literally hundreds of simultaneous
> connections; we DROP their syn packets if they already have 40 connections
> open.
> 
> This is generally working well (and thanks to folks on this list for the hard
> work that makes this possible).
> 
> However: Some clients send evil TCP RSTs that confuse conntrack and break
> connlimit in a way that I'll detail below. First, here's a sample recreation:
> 
>  client > server [SYN] Seq=0 Len=0
>  server > client [SYN,ACK] Seq=0 Ack=1 Len=0
>  client > server [ACK] Seq=1 Ack=1 Len=0
>  client > server [PSH,ACK] Seq=1 Ack=1 Len=420 (HTTP GET request)
>  server > client [ACK] Seq=1 Ack=421 Len=0
>  server > client [ACK] Seq=1 Ack=421 Len=1448    (HTTP response)
>  server > client [ACK] Seq=1449 Ack=421 Len=1448 (more HTTP response)
>  server > client [ACK] Seq=2897 Ack=421 Len=1448 (more HTTP response)
>  client > server [FIN,ACK] Seq=421 Ack=1449 Len=0
>  server > client [ACK] Seq=4345 Ack=422 Len=1448 (more HTTP response)
>  server > client [ACK] Seq=5793 Ack=422 Len=1448 (more HTTP response)
>  client > server [RST] Seq=421 Len=0
>  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
>  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
>  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
>  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
>  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
>  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
>  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
>  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
>  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
>  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
> 
> Everything up to and including the "RST" takes place in under a tenth of a
> second. The remaining ten retransmits take place over 5 minutes.

The TCP session seems to be totally broken. After the client sends

client > server [FIN,ACK] Seq=421 Ack=1449 Len=0

it should send the RST packet with Seq=422 and not Seq=421. The RST 
segment won't be accepted by the server.

And I don't get the server either: after sending Ack=422 it can't send 
Ack=421. Or there is an active device between the firewall and the server 
which reorders the packets.

Is it a real TCP session recording or a mistyped one?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
