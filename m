From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: long ruleset perfomance issue
Date: Tue, 5 Apr 2005 08:46:54 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0504050842240.14753@blackhole.kfki.hu>
References: <005901c5390b$a363fe30$03c01751@jg>
	<42515EC7.90506@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42515EC7.90506@riverviewtech.net>
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
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: anton@web-sat.com, netfilter@lists.netfilter.org

On Mon, 4 Apr 2005, Grant Taylor wrote:

> This will make is such that your packets don't have to traverse as many
> rules in the FORWARD chain directly.  In fact there would only be 18
> conditional JUMP to sub chain rules in the main FORWARD chain.  In this
> situation there would be 255 entries in the sub chains.  You end up with
> a pseudo tree structure like this
>
> FORWARD
>    |
>    <sbunet 1.1.1.0/24 -j FORWARD_1_1_1_0
>       |
>       <ip 1.1.1.1 -j MARK>
>       <ip 1.1.1.2 -j MARK>
>       <ip 1.1.1.3 -j MARK>
>    <sbunet 1.1.2.0/24 -j FORWARD_1_1_2_0
>       |
>       <ip 1.1.2.1 -j MARK>
>       <ip 1.1.2.2 -j MARK>
>       <ip 1.1.2.3 -j MARK>
>    <sbunet 1.1.3.0/24 -j FORWARD_1_1_3_0
>       |
>       <ip 1.1.3.1 -j MARK>
>       <ip 1.1.3.2 -j MARK>
>       <ip 1.1.3.3 -j MARK>

If the possible mark values are small, then ipset is a much more efficient
solution for the problem. You can even build up similar tree structure
with bindings in ipset. Actually, one can collapse the corresponding
iptables rules to the number of distinct mark values.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

