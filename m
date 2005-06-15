From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why does this connection stop being tracked?
Date: Wed, 15 Jun 2005 13:18:38 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0506151312470.27260@blackhole.kfki.hu>
References: <20050614161105.GN750@strugglers.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050614161105.GN750@strugglers.net>
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
To: Andy Smith <andy@strugglers.net>
Cc: netfilter@lists.netfilter.org

On Tue, 14 Jun 2005, Andy Smith wrote:

> In dom0 I have iptables running, with the eb-nf support of linux
> 2.6.11 and the physdev module loaded so that I can match traffic
> coming in to each of my user domains.
[...]
> Now, I have noticed that while this works most of the time, for
> reasons unknown to me, some TCP connections just seem to stop being
> tracked and hit the DROP rule.  Even though they have been tracked
> fine for several hours.  This happens on every user domain to all
> kinds of TCP connections, but I have pared the ruleset down to just
> the one domain (strugglers.net) and SSH to demonstrate.

You have two choices: either disable TCP SACK support on all your
real/virtual machines behind your firewall, or upgrade the kernel on the
firewall. There is a SACK related bug in netfilter connection tracking in
2.6.11 (and below).  According to the dumped traffic your connections
suffer from packet losses, SACK kicks in and conntrack screws up tracking
the given TCP connections. (Sorry, I can't recall at which rc release was
the fix submitted in.)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

