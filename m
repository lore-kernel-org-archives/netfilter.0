From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: traceroute
Date: Wed, 30 Jun 2004 20:17:36 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406302010450.26765-100000@blackhole.kfki.hu>
References: <2E314DE03538984BA5634F12115B3A4E62E80C@email1.mitretek.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2E314DE03538984BA5634F12115B3A4E62E80C@email1.mitretek.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Cc: netfilter <netfilter@lists.netfilter.org>

On Wed, 30 Jun 2004, Piszcz, Justin Michael wrote:

> I use -I INPUT ESTABLISHED,RELATED.
>
> I can ping outbound just fine, ESTABLISHED,RELATED keeps track of the
> ICMPs.

You could not ping outbound without setting up proper rules in the OUTPUT
chain. Your machine cannot be pinged with the rules above alone. Your rule
above does not let through ping responses on a firewall. In other words it
does not allow ICMP in general.

> I do not know where you are getting your info from, but it is clearly
> incorrect.

You yourself claimed that:

> > You do not have to allow it explicitly (ie: allow icmp so other
> > machines can ping your machine).

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


