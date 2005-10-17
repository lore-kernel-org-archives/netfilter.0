From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: lots of source ip & same dst port to one line??
Date: Mon, 17 Oct 2005 14:06:03 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0510171402500.3698@blackhole.kfki.hu>
References: <BAY12-F7B5C06FEC165BFDD024EF857E0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY12-F7B5C06FEC165BFDD024EF857E0@phx.gbl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Monty Ree <chulmin2@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Mon, 17 Oct 2005, Monty Ree wrote:

> I know -mport and --src-range function at iptables.
> But I have some rules like below.
>
> which same dst ip and port but source ip is not like below.
>
> iptables -A INPUT -p tcp -s 1.1.1.1 -d 10.10.10.10 --dport  25 -j ACCEPT
> iptables -A INPUT -p tcp -s 20.20.1.1 -d 10.10.10.10 --dport  25 -j ACCEPT
> iptables -A INPUT -p tcp -s 30.1.2.1 -d 10.10.10.10 --dport  25 -j ACCEPT
> iptables -A INPUT -p tcp -s 40.11.3.10 -d 10.10.10.10 --dport  25 -j ACCEPT
> iptables -A INPUT -p tcp -s 100.1.2.3 -d 10.10.10.10 --dport  25 -j ACCEPT
> iptables -A INPUT -p tcp -s 211.3.4.5 -d 10.10.10.10 --dport  25 -j ACCEPT

Use ipset: create a set (say 'smtp-clients') for all source addresses
above and then you can use a single rule like this:

iptables -A INPUT -d 10.10.10.10 -p tcp --dport 25 \
	 -m set --set smtp-clients src -j ACCEPT

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

