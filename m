From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Invalid SACK numbers in NAT'ed packets
Date: Wed, 23 Apr 2008 21:31:07 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0804232126040.28881@blackhole.kfki.hu>
References: <funk78$srq$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <funk78$srq$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leonid Zeitlin <lz@csltd.com.ua>
Cc: netfilter@vger.kernel.org

On Wed, 23 Apr 2008, Leonid Zeitlin wrote:

> Further analysis of tcp dumps reveals the following. The Cisco router 
> changes TCP sequence numbers when it does NAT. So, the sequence numbers and 
> ACKs that go between the LAN and the Cisco box are not the same as the ones 
> on the other side, between the Cisco box and the remote site. The problem 
> is, the Cisco box does NOT change the sequence numbers within SACK TCP 
> option! So, whenever a packet is lost, and the remote site sends an ACK 
> packet that contains a SACK option, the Linux router sees a SACK option 
> referencing a packet it never saw before. My guess is that this is the 
> reason why the packet is not considered as belonging to an established 
> connection by netfilter.
> 
> The questions:
> 1. Does my explanation look plausible? Can an invalid sequence number in 
> SACK lead to the packet not being considered as belonging to an established 
> connection?

Yes, TCP connection tracking in netfilter checks the SACK option values as 
well.

> 2. Has anyone come across such issue with a Cisco hardware before? Can it be 
> fixed by some configuration?

It was reported a few times. Try to upgrade IOS image as it's a Cisco bug

> 3. If not, can it be worked around at the Linux side; i.e. somehow ignore 
> invalid SACKs or prohibit SACKs on this particular connection (I am 
> reluctant to turn them off altogether with a sysctl).

or use IPV4OPTSTRIP for the SYN packets sent/received in this direction as 
a selective workaround for the problem.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
