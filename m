From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: What ICMP packets does state RELATED allow?
Date: Fri, 7 Jun 2002 09:04:58 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206070900500.3884-100000@blackhole.kfki.hu>
References: <NJEFLNJDIFFNMHDEBKMJAEFPDOAA.jpatterson@asgardgroup.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <NJEFLNJDIFFNMHDEBKMJAEFPDOAA.jpatterson@asgardgroup.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Patterson <jpatterson@asgardgroup.com>
Cc: Nick Drage <nickd@funkyjesus.org>, netfilter@lists.samba.org

On Thu, 6 Jun 2002, Joe Patterson wrote:

> That's interesting...  I guess it could make sense... sort of...
>
> but, to be really obnoxious about it, I would think it would make sense to
> have rules such as:
>
> for IF in `ifconfig | cut -d " " -f 1 | grep -v ^$`; do
> 	$IPT -A INPUT -p icmp --icmp-type 5 -m state --state RELATED -i $IF -s `ip
> addr ls dev $IF | grep inet | cut -d " " -f 6` -j ACCEPT
> done
>
> and
>
> $IPT -A FORWARD -p icmp --icmp-type 5 -j DROP
>
> on the basis of my belief that you should never ever have a redirect
> crossing a router, but you *may* want to accept redirects from local
> gateways...

conntrack is responsible to keep track of the connections as perfectly
(and with as little overhead) as possible. At the filter stage one can
filter out the unwanted packets exactly as you suggested.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


