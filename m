From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Wed, 6 Oct 2010 21:57:17 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1010062154280.10960@blackhole.kfki.hu>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com> <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu> <4CA70B3B.90001@googlemail.com> <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu>
 <4CA7978B.9020900@googlemail.com> <alpine.DEB.2.00.1010032106460.26617@blackhole.kfki.hu> <4CA8FDE1.8090809@googlemail.com> <alpine.DEB.2.00.1010041134130.28881@blackhole.kfki.hu> <4CAC866D.7060101@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CAC866D.7060101@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Wed, 6 Oct 2010, Mr Dash Four wrote:

> There is another issue I found when using ipmap sets: when I execute, for
> example, "ipset -N port-map ipmap --from 10 --to 30000" and then add an
> element "ipset -A port-map 20" the two statements are accepted without any
> error given (they shouldn't be as the map defined is an IP map, not a port map
> and the values submitted are numbers, not IP addresses)!
> 
> When I issue "ipset -L port-map" I get:
> 
> Header: from: 0.0.0.10 to: 0.0.117.48
> members:
> 0.0.0.20
> 
> Is this deliberate or a bug?

Whatever name has got the set, the type what counts. So if it is defined 
as an ipmap type, then the system tries to interpret the input parameters 
as IP addresses. "10" and "20", etc are strange-looking, but valid IP 
addresses :-)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
