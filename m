From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Antwort: Re: Antwort: Re: ipsets for both source and target in
 one iptables-rule?
Date: Fri, 2 Dec 2005 13:19:49 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0512021315040.8267@blackhole.kfki.hu>
References: <OFC109A024.3BC7914A-ONC12570CB.0040CB45-C12570CB.0041E274@knapp.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OFC109A024.3BC7914A-ONC12570CB.0040CB45-C12570CB.0041E274@knapp.com>
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

> I just realized that I now think I understand what you meant by "But why
> do you specify the protocol?"
>
> I could have written the rule like
>         iptables -A -m state --state ESTABLISHED -j ACCEPT

Yes, conntrack hold entries of connections you had explicitly let to open
up. So (usually) there is no point to add other matches to the rule above.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

