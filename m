From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iprange
Date: Tue, 11 Nov 2003 09:43:34 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0311110937110.24817-100000@blackhole.kfki.hu>
References: <Pine.LNX.4.58.0311101220310.488@fhynpb.envafyvqr.arg>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0311101220310.488@fhynpb.envafyvqr.arg>
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
To: Vigil <nvnwdfuq02@sneakemail.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Mon, 10 Nov 2003, Vigil wrote:

> I take it nobody else uses iprange or any other new built plugins (connlimit,
> realm, classify, connmark, netmap) with 1.2.9?

I have just checked and it works fine (2.4.22 kernel + 1.2.9 iptables
release).

> On Fri, 7 Nov 2003, Vigil nvnwdfuq02-at-sneakemail.com |Netfilter Mailing List| wrote:
>
> >1.2.8 (from Slackware 9, without pom and iprange) was installed when I compiled
> >1.2.9. I uninstalled it before installing 1.2.9. I then uninstalled 1.2.9,
> >unpacked it and compiled and installed it again, just in case anything from
> >1.2.8 was interfering. I then recompiled the kernel (2.4.22) and rebooted with
> >the new 1.2.9, then uninstalled it and compiled and installed it again(!)

I still suspect you have got two iptables binaries on your system and you
start the previous one instead what you installed from source.

iptables installed from source goes into /usr/local/sbin/iptables. Call
the binary with full path to be sure.

Please don't try to guess the syntax: it works as it is documented in the
manpage: iprange is an extension, so you must invoke it as
'iptables .... -m iprange <iprange-options>' ...

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


