From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Antwort: Re: Antwort: Re: Antwort: Re: ipsets for both source
 and target in one iptables-rule?
Date: Fri, 2 Dec 2005 22:48:36 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0512022236250.10204@blackhole.kfki.hu>
References: <OFD3453F7F.C50E7A66-ONC12570CB.004886DF-C12570CB.004A790C@knapp.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OFD3453F7F.C50E7A66-ONC12570CB.004886DF-C12570CB.004A790C@knapp.com>
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

On Fri, 2 Dec 2005 Frank.Mayer@knapp-systems.com wrote:

> Nevertheless I like to expressly state "-s 0/0 -d 0/0" for
> understandability.

Presently that's all right, because it does not cost anything (i.e. does
bnot slow down the evaluation): source and destination address matchings
are implicitly always applied. (However as sooner or later new packet
classification algorithm will replace the current one, that can be untrue
in the future and *can* mean wasted CPU cycles.)

> I have one more request, if I may bother you once again:
> can you point me to some documentation that clarifies state matching from
> a user's point of view?
> I do understand "NEW" and "ESTABLISHED" related to TCP, but their meaning
> for e.g. UDP and ICMP mostly eludes me, as does the "RELATED" state:
> under which circumstances is one connection considered "related" to
> another one (does that depend on the interpretation of the respective
> conntrack-module, or is there a general definition)?

Oskar Andreasson's iptables tutorial is very good in explaining the
details behind iptables/netfilter from user point of view:
http://iptables-tutorial.frozentux.net/

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

