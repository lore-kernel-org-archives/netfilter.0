From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: question on ip_conntrack log entries and behavior
Date: Thu, 20 Mar 2003 15:04:46 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0303201500280.17210-100000@blackhole.kfki.hu>
References: <00d101c2eee3$b64a6170$3201a8c0@ESTACAO>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00d101c2eee3$b64a6170$3201a8c0@ESTACAO>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solucoesip.net>
Cc: netfilter ML <netfilter@lists.samba.org>

On Thu, 20 Mar 2003, [iso-8859-1] Leonardo Rodrigues Magalh=E3es wrote:

>     I got a firewall running kernel 2.4.20 with some p-o-m patches,
> including tcp-window-tracking which allows me change timeout stuff in
> runtime.
>
>     Well ...... my /proc/net/ip_conntrack log is PLENTY of CLOSE
> connections, just like:

This is a bug in 2.4.20. You need the submitted/10_confirm_fix.patch.help
patch from the most recent patch-o-matic.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


