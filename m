From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip_conntrack table is full with razor requests. Something isn't
 timing out.
Date: Wed, 2 Mar 2005 08:59:12 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0503020853460.16314@blackhole.kfki.hu>
References: <4224A715.8030907@aptalaska.net>
Mime-Version: 1.0
In-Reply-To: <4224A715.8030907@aptalaska.net>
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
To: Matthew Schumacher <matt.s@aptalaska.net>
Cc: netfilter@lists.netfilter.org

Hi,

On Tue, 1 Mar 2005, Matthew Schumacher wrote:

> Since upgrading to 2.6.10 I have been having problems with my
> ip_conntrack table filling up.  It appears it is full of razor
> (http://razor.sf.net) requests from my internal mail server.
>
> I raised the ip_conntrack_max to 8192 and there are only a few hosts
> behind nat so I am certain something isn't getting flushed out.
>
> How do I go about diagnosing this.  What specifically does ip_conntrack
> need to see in the tcp session to mark the session as expired in the table?

Run tcpdump and record at least one full session of the razor traffic.
Best is if you capture the traffic on both side of the firewall in order
to make sure nothing got lost. Collect anything relevant from the
kernel log file and attach the /proc/net/ip_conntrack lines referring to
the session. Post the collected data and then we can start to hunt down
the reason of the problem.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

