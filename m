From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: SNAT of icmp: fragmentation-needed
Date: Fri, 14 Jun 2002 13:50:05 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206141348470.17402-100000@blackhole.kfki.hu>
References: <Pine.LNX.4.44.0206041715120.27892-100000@albert.ha-vel.cz>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.44.0206041715120.27892-100000@albert.ha-vel.cz>
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
To: jn@angel.cz
Cc: netfilter@lists.samba.org

On Tue, 4 Jun 2002 jn@angel.cz wrote:

> I would like to SNAT icmp fragmentation-needed messages that have source
> address from private network range (RFC1918), I have tried something like:
>
> iptables -t nat  -I POSTROUTING -j SNAT --to real_address -p icmp  \
> --icmp-type fragmentation-needed -s 192.168.0.0/16
>
> but it does not work. I think that because these packets are part of
> valid TCP connection, they are somehow processed by ip_conntrack
> module and do not pass this rule....

Yes, ICMP error messages related to already existing connections are
handled by conntrack and NAT automatically. There is no need to setup any
rule for them. One only have to let trough packets with state RELATED.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


