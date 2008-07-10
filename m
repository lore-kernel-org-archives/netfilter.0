From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: conntrack and ESTABLISHED / UNREPLIED connections
Date: Thu, 10 Jul 2008 14:44:01 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0807101247240.13027@blackhole.kfki.hu>
References: <486D31D9.9070900@tigertech.com> <4872A115.2030604@tigertech.com>
 <Pine.LNX.4.64.0807081130220.7417@blackhole.kfki.hu> <4873A605.1010209@tigertech.com>
 <Pine.LNX.4.64.0807090842270.11391@blackhole.kfki.hu> <4874E5AB.4070700@tigertech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4874E5AB.4070700@tigertech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert L Mathews <lists@tigertech.com>
Cc: netfilter@vger.kernel.org

On Wed, 9 Jul 2008, Robert L Mathews wrote:

> > Is the RST segment valid? Could you create a dump file using the '-S' flag
> > of tcpdump so that not relative but absolute sequence numbers are printed?
> 
> Sure thing; here's another one with -S:
> 
>  http://tigertech.net/20080709.tcpdump.server.txt

The end of the TCP session is as follows:

08:55:16.499702 IP 64.62.209.98.443 > 96.221.109.137.49553: P 
716440962:716440999(37) ack 2354211888 win 71 
<nop,nop,timestamp 140394633 528033351>

Server sends data still pending to the client.

08:55:16.499799 IP 64.62.209.98.443 > 96.221.109.137.49553: F 
716440999:716440999(0) ack 2354211888 win 71 
<nop,nop,timestamp 140394633 528033351>

Then the server sends a connection termination request.

08:55:16.500008 IP 96.221.109.137.49553 > 64.62.209.98.443: F 
2354211888:2354211888(0) ack 716440962 win 65535 
<nop,nop,timestamp 528033351 140394349>

Client did not receive the last two packets from the server but sends
a connection termination request too.

08:55:16.500037 IP 64.62.209.98.443 > 96.221.109.137.49553: . ack 
2354211889 win 71 <nop,nop,timestamp 140394633 528033351>

Server ACKs that it received the FIN packet from the client.

08:55:16.529487 IP 96.221.109.137.49553 > 64.62.209.98.443: R 
2354211888:2354211888(0) win 0

Client sends RST, which is out of (before) the window (left edge is at 
2354211889), thus ignored by the server.

08:55:16.740815 IP 64.62.209.98.443 > 96.221.109.137.49553: P 
716440962:716440999(37) ack 2354211889 win 71 
<nop,nop,timestamp 140394693 528033351>

Server tries to send the data still pending.

You wrote the client runs Mac OS X 10.4.11. I don't really know what's 
wrong with it but it seems as a client related issue - or an ISP between 
the client and server which tries to generate fake RST packets to tear 
down connections.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
