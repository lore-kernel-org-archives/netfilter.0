From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: IPset ports question.
Date: Tue, 19 Jul 2005 22:09:28 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0507192204230.24449@blackhole.kfki.hu>
References: <42DBF833.9020505@kitchenandassociates.com>
	<Pine.LNX.4.58.0507191037060.22686@blackhole.kfki.hu>
	<42DD50E4.9090800@kitchenandassociates.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42DD50E4.9090800@kitchenandassociates.com>
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
To: Rob Carlson <rcarlson@kitchenandassociates.com>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>

Hi Rob,

On Tue, 19 Jul 2005, Rob Carlson wrote:

> iptables -A testset -m set --set testset src -j
> LTREJECT
> iptables -I FORWARD 2 -i eth1 -j testset
> iptables -I INPUT 2 -i eth1 -j testset
>
> This works fine for blocking all traffic.  However
> since I now want specifically to only drop port 22
> and port 25 entries (that is most of the nuisance
> traffic) and allow port 80 for example,  I did the
> following:
>
> ipset -N ports portmap --from 1 --to 1024
> ipset -A ports 22
> ipset -A ports 25
> ipset -B testset :default: -b ports

You missed to replace the iptables command above with the one
which instruct the SET target to follow bindings. What you need is

iptables -A testset -m set --set testset src,dst -j LTREJECT

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

