From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Iptables logs on High bandwidth traffic network
Date: Thu, 5 May 2005 13:59:06 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0505051356560.21615@blackhole.kfki.hu>
References: <4278C3DE.7010403@au-kbc.org> <4278F150.4000806@riverviewtech.net>
	<42794F67.7060803@danbbs.dk> <4279570A.1090509@riverviewtech.net>
	<Pine.LNX.4.58.0505050848090.21265@blackhole.kfki.hu>
	<4279CA3E.3000104@riverviewtech.net>
	<Pine.LNX.4.58.0505051010140.21324@blackhole.kfki.hu>
	<427A0256.5080709@danbbs.dk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427A0256.5080709@danbbs.dk>
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
To: Mogens Valentin <monz@danbbs.dk>
Cc: netfilter@lists.netfilter.org

On Thu, 5 May 2005, Mogens Valentin wrote:

> > That depends on how syslog is configured - you can easily disable syncing
> > at every log event.
>
> Yes, but doing so may cause loss of logging, or maybe it'll just delay
> some messages due to not sync'ing at once.

A FIFO and a buffering app suffers from exactly the same problems.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

