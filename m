From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipsets for both source and target in one iptables-rule?
Date: Thu, 1 Dec 2005 17:22:34 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0512011711030.7270@blackhole.kfki.hu>
References: <OF6D4A24FC.BD8BFC33-ONC12570CA.004AA26A-C12570CA.004D205F@knapp.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OF6D4A24FC.BD8BFC33-ONC12570CA.004AA26A-C12570CA.004D205F@knapp.com>
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
To: Frank.Mayer@knapp-systems.com
Cc: netfilter@lists.netfilter.org

Hi,

On Thu, 1 Dec 2005 Frank.Mayer@knapp-systems.com wrote:

> I'd like to use two ipsets in a single iptables rule similar to
>
> iptables -A FORWARD -p tcp -m tcp --dport ssh -m set --set clients src -m
> set --set servers dst  -m state --state NEW,ESTABLISHED -j ACCEPT

That is not possible due to the feature in iptables itself that one cannot
specify two or more match extensions of the same time. It is a limitation
of the userspace interface (i.e. iptables) and not that of the kernel.

However, you can "workaround" the situation with using the binding
functionality of ipset. Bind the servers set to the clients set as default
and use the command

iptables -A FORWARD -p tcp --dport ssh \
	-m set --set clients src,dst  \
	-m state --state NEW,ESTABLISHED -j ACCEPT

Thus the set match is forced to match the source against the clients set
and because there's a default binding and the match is instructed to
follow it by 'src,dst', match the destination in the servers set. The
final result is true if both matches are true.

In my opinion it's wasting of resources to specify any other matching
together with '-m state --state NEW,ESTABLISHED' if you set up proper
rules for matching NEW packets. But that you should do anyway to setup a
proper firewall.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

