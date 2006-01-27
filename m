From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: abusing ipset and ulog for tcpdump-like functions?
Date: Fri, 27 Jan 2006 09:48:03 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0601270940100.21892@blackhole.kfki.hu>
References: <43D9569A.4070609@gmx.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43D9569A.4070609@gmx.net>
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
To: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Cc: netfilter@lists.netfilter.org

Hi,

On Fri, 27 Jan 2006, Carl-Daniel Hailfinger wrote:

> Can I add one IP with multiple MACs to a given macipmap table?

No, you cannot. It is assumed that there is one MAC address per IP.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

