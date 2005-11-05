From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Firewall Sending Resets(was Troubleshooting Netfilter Firewall
 (performance issues))
Date: Sat, 5 Nov 2005 17:25:23 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0511051717070.18624@blackhole.kfki.hu>
References: <1131140392.10871.11.camel@localhost.localdomain> 
	<Pine.LNX.4.58.0511042258530.17779@blackhole.kfki.hu>
	<1131142600.10871.13.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1131142600.10871.13.camel@localhost.localdomain>
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
To: "Harrison, James" <james.harrison@americancolor.com>
Cc: netfilter@lists.netfilter.org

On Fri, 4 Nov 2005, Harrison, James wrote:

> > netfilter sends RST if it was configured to do so by using the REJECT
> > target.
> >
> > No vanilla netfilter sends RST to client and server, in any setup.
>
> I understand, but the file transfer is initiated, begins, and can and
> will run for a period of time, then out of the blue it fires the RST.

Are you sure the firewall creates the RST segments?

> Why?

Dunno. You should capture the full traffic by tcpdump so that one could
analyze it. Without such a proof nothing much can be said. Also, one would
require the list of netfilter patches (from patch-o-matic or others)
applied on top of kernel 2.4.31 in devil-linux.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

