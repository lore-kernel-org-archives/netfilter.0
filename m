From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset question
Date: Sat, 11 Dec 2004 17:39:35 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0412111736360.16780@blackhole.kfki.hu>
References: <1102718857.3550.27.camel@hammer.internal.platinumtel.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1102718857.3550.27.camel@hammer.internal.platinumtel.com>
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
To: Brett Oster <boster@loadsys.com>
Cc: netfilter@lists.netfilter.org

Hi,

On Fri, 10 Dec 2004, Brett Oster wrote:

> I'm looking for a way to make my iptables rules more manageable, and so
> I am attempting to use ipset.  However, I am not sure if it does what I
> am trying to do.   I have many subnets that need to be SNATed
> differently depending upon their destination.  As a test, I made two
> iphash sets and loaded in one of my sets of sources and one set of
> destinations.  However, when I try to apply the iptables rule, I get the
> error:
>
> iptables v1.3.0: Unknown arg `destination'
>
> I am running 2.6.9 with the most current iptables, pom, and ipset from
> Jozsef Kadlecsik's website
> (http://people.netfilter.org/kadlec/ipset/install.html)

You are using the old ipset binary. From the URL above you can donwnload
ipset 2.0. Do you have two binaries installed at different locations
and the old one is found according to your PATH settings?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

