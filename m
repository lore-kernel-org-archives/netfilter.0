From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset and connection tracking
Date: Fri, 14 Oct 2011 19:24:56 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1110141922460.729@blackhole.kfki.hu>
References: <B3B3BE5A55ED7743A83865E234A22B1D1B91F6A922@SBSPORT.portnet.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <B3B3BE5A55ED7743A83865E234A22B1D1B91F6A922@SBSPORT.portnet.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Torsten Bitterlich <bit@port.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, 14 Oct 2011, Torsten Bitterlich wrote:

> I would like to know if there are any restrictions to connection 
> tracking when ipsets are used. Can netfilter still properly track 
> connections for NAT-ed and MASQUERADE-d connections?

Connection tracking is independent from ipset. There's no relation or 
dependency between them. Why do you ask it?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
