From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: h323 ALG .
Date: Tue, 22 Jun 2010 13:51:38 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1006221348240.2393@blackhole.kfki.hu>
References: <AANLkTilxYbk1LBMGelD3NAzSeUXmKm_oWmepxVL8M9Hb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTilxYbk1LBMGelD3NAzSeUXmKm_oWmepxVL8M9Hb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Tue, 22 Jun 2010, ratheesh k wrote:

> I have following RULES .
> 
> iptables  -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables  -A INPUT -i lan0  -j ACCEPT
> iptables  -A INPUT -j DROP
> 
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i lan0  -o wan0  -j ACCEPT
> iptabkes -A FORWARD -j DROP
> 
> iptables -A OUTPUT -j ACCEPT
> 
> But I am able to make H323 calls from lan to wan  &  wan  to lan  .
> 
> 1.  ALG will allow wan to lan calls ? No need for specific iptables
> forwarding rule if alg is needed ?

Yes. That's the point for a helper.

> 2.  Is there any way in H323 to have calls without support of ALG (
> like passive ftp ? )

No.

But you can setup a H.323 gatekeeper in proxy mode and then configure
it to force the clients into given port ranges.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
