From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip_conntrack cleanup
Date: Fri, 14 Jun 2002 13:37:07 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206141333100.17402-100000@blackhole.kfki.hu>
References: <3CE9F837.3040606@snt.pl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CE9F837.3040606@snt.pl>
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
To: Wojciech Sobola <Wojciech.Sobola@snt.pl>
Cc: netfilter@lists.samba.org

On Tue, 21 May 2002, Wojciech Sobola wrote:

> I have chains here, that can't be cleared out. Example:
> tcp      6 321156 ESTABLISHED src=63.218.135.142 dst=62.xx.x.44 sport=63920 dport=80 [UNREPLIED] src=192.168.101.2
> dst=63.218.135.142 sport=80 dport=63920 use=1
...

Looks like ACK-scanning of the network.

> Such table can stay even 2 or 3 days. If I put DROP into INPUT or
> PREROUTING it doesn't change. Is this something suspicious?

Existing conntrack entries cannot be deleted by iptable rules.
But those are harmless and will be time out later.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


