From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: NOTRACK not working
Date: Tue, 26 Jan 2010 19:57:05 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1001261955270.25436@blackhole.kfki.hu>
References: <4B5F36B7.5010004@conversis.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B5F36B7.5010004@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Dennis J." <dennisml@conversis.de>
Cc: netfilter@vger.kernel.org

On Tue, 26 Jan 2010, Dennis J. wrote:

> For a while now I excluded two IPs on my firewall from connection tracking
> which works very well. Now I tried adding another IP but that doesn't seem to
> work. I added the following rules:
> 
> iptables -t raw -A PREROUTING -s 192.168.10.10 -j NOTRACK
> iptables -t raw -A PREROUTING -d 192.168.10.10 -j NOTRACK
> 
> Yet when I look in /proc/net/ip_conntrack I still see 192.168.10.10 using up
> most of the entries.

Did you add those rules to a running system? Then you see the already 
existing connections in /proc/net/ip_conntrack.

The NOTRACK target does not terminate existing connections.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
