From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iptables-restore of rules with inverted set match fails
Date: Fri, 23 Jun 2006 11:42:28 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0606231141330.17146@blackhole.kfki.hu>
References: <BAY106-F130990A95F83F74F8827A3D6870@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY106-F130990A95F83F74F8827A3D6870@phx.gbl>
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
To: Andrew Kraslavsky <andykras@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Mon, 19 Jun 2006, Andrew Kraslavsky wrote:

> With iptablesw-save and iptables-restore version 1.33, restoration of
> iptables rules with inverted set matches is failing with the following
> error:
>
> Bad argument `!--set'
> Error occurred at line: 6
> Try `iptables-restore -h' or 'iptables-restore --help' for more information.

The bug is fixed in the iptables svn tree. Thanks for the bugreport!

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

