From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: final packet not natted, rfc1918 address sent to internet
Date: Wed, 24 Nov 2010 09:40:36 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1011240938190.27970@blackhole.kfki.hu>
References: <B7A55E8C969B974FBC89274E565B8B2D02012CCA83@US-COL-EXCHMBX1.green.sophos>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <B7A55E8C969B974FBC89274E565B8B2D02012CCA83@US-COL-EXCHMBX1.green.sophos>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Sparks <Dave.Sparks@Sophos.com>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

On Wed, 24 Nov 2010, Dave Sparks wrote:

> I noticed a problem that happens on all our firewalls (various 2.6 and 
> Shorewall version) where sometimes the final packet in a conversation 
> will not be natted.  What happens is the src IP is not rewritten, and 
> the rfc1918 src address is sent to the internet.
> 
> I've pasted a tcpdump from the firewall below (sorry I had to elide the 
> IPs).  I have used "tcpdump -i any" so packets both in and out of the 
> firewall are shown.  The important packet is the very last one.  It 
> didn't get its src IP rewritten, and was emitted on the internet eth 
> with a rfc1918 src IP.

I guess the packet in question has got INVALID state: those are not 
NAT-ed (being INVALID, cannot be). So add a rule which drops INVALID 
packets.
 
Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
