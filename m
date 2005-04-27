From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Connection problems on large high speed connections.
Date: Wed, 27 Apr 2005 15:47:44 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0504271542470.5216@blackhole.kfki.hu>
References: <1114555837.14247.15.camel@zepto.barmen.nu>
	<Pine.LNX.4.58.0504270854230.4795@blackhole.kfki.hu>
	<1114585852.15246.11.camel@zepto.barmen.nu>
	<1114586414.15242.14.camel@zepto.barmen.nu>
	<1114608987.15240.49.camel@zepto.barmen.nu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1114608987.15240.49.camel@zepto.barmen.nu>
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
To: "Stian B. Barmen" <stian@barmen.nu>
Cc: netfilter@lists.netfilter.org

On Wed, 27 Apr 2005, Stian B. Barmen wrote:

> In the code I added at the end of INPUT, FORWARD and the redirected DMZ
> chain the following:
>
> iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset
> iptables -A FORWARD -p tcp -j REJECT --reject-with tcp-reset
> iptables -A DMZ -p tcp -j REJECT --reject-with tcp-reset
>
> I removed the --reject-with tcp-reset on each line and the problem
> dissapeard.
>
> The strange thing is that this communication should never reach this
> rule. When the communcation is established it should hit the rule:
>
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
>
> Should it not? (this rule runs before the -j DMZ and I have another one
> for INPUT).

Then there were packets flagged as INVALID by conntrack, which are of
course not matched by the states above. The reject line however matched
them and dutifully generated the RST segment, which tore down the
connection.

> I have no explanation for this behaviour. Will try to log and see what I
> can find but for now this is all I know.

Enable logging invalid packets by

echo 1 > /proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid

and make sure ipt_LOG is loaded in.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

