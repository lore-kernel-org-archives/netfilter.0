From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: local NAT of connections conflicts with ftp conntrack?
Date: Fri, 14 Jun 2002 13:47:08 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206141342430.17402-100000@blackhole.kfki.hu>
References: <Pine.LNX.4.44.0205251129250.6374-100000@onyx4.dhs.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.44.0205251129250.6374-100000@onyx4.dhs.org>
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
To: Christian Lambert <clambert@sgi.com>
Cc: netfilter@lists.samba.org

On Sat, 25 May 2002, Christian Lambert wrote:

> I enabled "local natting of connections" in the kernel so that I can
> do transparent proxy from the local host itself running squid, and
> I only use these two rules in the new table called "OUTPUT" for nat.
>
> # transparent proxy for localhost
> iptables -t nat -A OUTPUT -p tcp --dport 80 -m owner --uid-owner squid -j ACCEPT
> iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-port 3128
>
> Now the problem that I have is that when the box itself tries to ftp
> to the outside world, it just hangs as soon as it does the PORT command.
>
> Then in syslog I see a couple of these messages:
>
> ip_conntrack: max number of expected connections 1 of ftp reached for
> <hideen ip>-><hidden ip>, reusing

Ha! That's interesting and smells like a bug.

> I'm using kernel 2.4.19-pre7 with the newnat patch applied and h323,
> but no other patches.   Iptables userspace 1.2.6a.    My POSTROUTING
> of nat contains a typical SNAT setting to let my internal machines
> access the internet.

Did you apply the newnat patch from iptables-1.2.6a or from a recent cvs
donwload? iptables-1.2.6a contains newnat8 while in cvs we have newnat13
with a couple of bugs fixed.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


