From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: UDP connections and Conntrack...
Date: Thu, 8 Jan 2004 08:22:04 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0401080815350.19652-100000@blackhole.kfki.hu>
References: <1073492589.9732.16.camel@gamux>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1073492589.9732.16.camel@gamux>
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
To: Eddahbi Karim <installation_fault_association@yahoo.fr>
Cc: netfilter@lists.netfilter.org

On Wed, 7 Jan 2004, Eddahbi Karim wrote:

> After checking the source code, I can see that the two principals hooks
> are on these chain.

No, it's reversed: the OUTPUT/PREROUTING chains of the nat table are on
the (same) hooks. But as the comment says as well: conntrack
has got higher priority than nat, so conntrack sees the packet first.

> /* Connection tracking may drop packets, but never alters them, so
>    make it the first hook. */
> static struct nf_hook_ops ip_conntrack_in_ops = {
> 	.hook		= ip_conntrack_in,
> 	.owner		= THIS_MODULE,
> 	.pf		= PF_INET,
> 	.hooknum	= NF_IP_PRE_ROUTING,
> 	.priority	= NF_IP_PRI_CONNTRACK,
> };
>
> static struct nf_hook_ops ip_conntrack_local_out_ops = {
> 	.hook		= ip_conntrack_local,
> 	.owner		= THIS_MODULE,
> 	.pf		= PF_INET,
> 	.hooknum	= NF_IP_LOCAL_OUT,
> 	.priority	= NF_IP_PRI_CONNTRACK,
> };
>
> Now, I can't really bet these hooks are on the nat table but conntrack
> and nat are very related.

Yes, nat depends on conntrack. conntrack can be standalone.

> I get the information here :
> http://iptables-tutorial.frozentux.net/chunkyhtml/statemachine.html
> There's another explanation here :
> http://www.sns.ias.edu/~jns/security/iptables/iptables_conntrack.html

I had sent some corrections to Oskar for the iptables tutorial. I'll look
at the second URL as well.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary



