From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: macipmap (ipset) matching
Date: Wed, 29 Sep 2010 09:18:58 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1009290912280.4241@blackhole.kfki.hu>
References: <4CA25F3B.2070801@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CA25F3B.2070801@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Tue, 28 Sep 2010, Mr Dash Four wrote:

> I am trying to employ and use this, but am unable to get any match whatsoever.
> I have registered my own (internal) network and the relevant mac addresses for
> each interface, but no joy. What could be the problem? Has anybody actually
> tried this?

Could you describe exactly what do you try to do? That is the set elements 
to be matched and the iptables rules you entered. Also, please note the 
"set" match and "SET" target netfilter kernel modules always use the
source MAC address from the packet.

The ipset source tree contains a testsuite with tests against all set 
types.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
