From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: H323 conntrack not working
Date: Mon, 24 Mar 2003 09:24:19 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0303240922340.1669-100000@blackhole.kfki.hu>
References: <8D7C5F56B409554D9D46AC22195807F3156E6F@exchwenz01.dmcwave.co.nz>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <8D7C5F56B409554D9D46AC22195807F3156E6F@exchwenz01.dmcwave.co.nz>
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
To: Richard Williams <richard_williams@stratexnet.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Mon, 24 Mar 2003, Richard Williams wrote:

> I have gnugk on my linux 2.4.20 firewall running iptables 1.2.7a with
> conntrack_h323 installed.

Strangely enough softwares built on openh323 doesn't work together with
the H.323 conntrack/nat modules. That is the fault of the module and not
that of openh323.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


