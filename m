From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ULOG: invalid argument
Date: Fri, 5 Mar 2004 20:30:35 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0403052027240.7525-100000@blackhole.kfki.hu>
References: <20040305181437.GE8522@freenet.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040305181437.GE8522@freenet.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michelle Konzack <linux4michelle@freenet.de>
Cc: netfilter@lists.netfilter.org

On Fri, 5 Mar 2004, Michelle Konzack wrote:

> Am 2004-03-05 18:51:06, schrieb Jozsef Kadlecsik:
> >On Fri, 5 Mar 2004, Michelle Konzack wrote:
> >
> >> >> # iptables: Invalid argment (the same error)
> >> >
> >> >Please make sure there is no iptables binary from your distribution which
> >> >precedes in PATH the iptables binary installed from source.
> >                        ^^^^^^^^^^^^^^^
> >> This is not possibel, because he use the Debian nativ-system.
> >> ...he has not written that he has used
> >> apt-get install ulogd
> >                  ^^^^^
>
> False, you have overread the line above...
> He has done an
>
> apt-get build-dep ulogd
> apt-get -b source ulogd
>
> which I was talking about. The 'iptables' from WOODY are working fine

Please, an error message returned by iptables has nothing to do with the
ulog daemon, let it run on the system at all or not.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


