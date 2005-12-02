From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Antwort: Re: ipsets for both source and target in one
	iptables-rule?
Date: Fri, 2 Dec 2005 08:48:21 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0512020838530.8267@blackhole.kfki.hu>
References: <OFD843AFFB.B134D21C-ONC12570CA.00621CA5-C12570CA.00635B0D@knapp.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OFD843AFFB.B134D21C-ONC12570CA.00621CA5-C12570CA.00635B0D@knapp.com>
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

On Thu, 1 Dec 2005 Frank.Mayer@knapp-systems.com wrote:

> > In my opinion it's wasting of resources to specify any other matching
> > together with '-m state --state NEW,ESTABLISHED' if you set up proper
> > rules for matching NEW packets.
> I'm not sure I understand....
> It's true I can (and often do) add a rule similar to
>         iptables -A FORWARD -s 0/0 -d 0/0 -p tcp -m state --state
> ESTABLISHED -j ACCEPT
> as some "catch-it-all".

The '-s 0/0 -d 0/0' matches buy nothing, they express the default.
But why do you specify the protocol? Will you enter similar rules for UDP
and ICMP as well? Then netfilter has to process two-three rules instead of
one. And if you already let in the packet which created the connection,
then the state matching is perfectly enough to match all subsequent
packets in the same stream.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

