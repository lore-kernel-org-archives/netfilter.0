From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: state: INVALID
Date: Tue, 23 Nov 2004 10:37:00 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0411231035250.13889@blackhole.kfki.hu>
References: <419E75B1.3030406@uni-paderborn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <419E75B1.3030406@uni-paderborn.de>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?ISO-8859-15?Q?Bj=F6rn_Schmidt?= <bj-schmidt@uni-paderborn.de>
Cc: netfilter@lists.netfilter.org

On Fri, 19 Nov 2004, [ISO-8859-15] Bj=F6rn Schmidt wrote:

> the ulogd logfile of my server shows many "INVALID state" packets. What c=
ould
> be the reason for that?
>
> The server has one cardbus nic (eth0), one dsl-interface (ppp0) and, of c=
ourse
> lo. The client has only eth0 and lo. The kernel version of both computers=
 is
> 2.6.10-rc2

Enable the logging of out-of-window packets and check whether the packets
in question are marked as INVALID by the TCP window tracking code.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

