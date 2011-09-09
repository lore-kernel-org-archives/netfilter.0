From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: connlimit problem
Date: Fri, 9 Sep 2011 11:12:52 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1109091110100.18593@blackhole.kfki.hu>
References: <4E69C831.4050004@univ-nantes.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E69C831.4050004@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Cc: netfilter@vger.kernel.org

On Fri, 9 Sep 2011, Jean-Philippe Menil wrote:

> I try to limit the connection per ip with connlimit in addition to the socket
> match, with the following rule:
> $IPTABLES -t mangle -A PREROUTING -s $LAN -p tcp --syn --dport http -m socket
> -m connlimit --connlimit-above 0 -j DIVERT
> 
> But as you can see, theses rules  never match:
> 
>     0     0 DIVERT     tcp  --  *      *       192.168.100.0/24     0.0.0.0/0
> tcp dpt:80flags: 0x17/0x02 socket #conn src/32 > 1
>     9  3030 DIVERT     tcp  --  *      *       192.168.100.0/24     0.0.0.0/0
> tcp dpt:80 socket
>     5   216 TPROXY     tcp  --  *      *       192.168.100.0/24     0.0.0.0/0
> tcp dpt:80 TPROXY redirect 0.0.0.0:50080 mark 0x1/0x1
>     0     0 DIVERT     tcp  --  *      *       192.168.100.0/24     0.0.0.0/0
> tcp dpt:3128flags: 0x17/0x02 socket #conn src/32 > 1
>     6  2491 DIVERT     tcp  --  *      *       192.168.100.0/24     0.0.0.0/0
> tcp dpt:3128 socket
>    19   800 TPROXY     tcp  --  *      *       192.168.100.0/24     0.0.0.0/0
> tcp dpt:3128 TPROXY redirect 0.0.0.0:50080 mark 0x1/0x1
> 
> Is this an expected behaviour, or a problem in my rules?

You use the socket match from the PREROUTING chain, where it'll never 
match: it's before routing, so the the system could not associate the 
packet to a socket yet.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
