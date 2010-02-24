From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Is there some reason why IPSET kernel modules are not in kernel
 source?
Date: Wed, 24 Feb 2010 22:40:46 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1002242237090.7439@blackhole.kfki.hu>
References: <4B857D3F.6070901@gatworks.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B857D3F.6070901@gatworks.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "U. George" <netbeans@gatworks.com>
Cc: netfilter@vger.kernel.org

On Wed, 24 Feb 2010, U. George wrote:

> Seems like iptable modules are included in kernel source.
> Not so with the IPSET modules. Is this something political?

Nothing political. ipset needs to be rewritten before submitting, in order 
to avoid backward-forward compatibility issues in the future. That makes 
me say "no submitting yet".

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
