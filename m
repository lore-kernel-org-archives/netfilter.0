From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip_conntrack_tcp Errors
Date: Tue, 29 Jun 2004 09:46:18 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406290938140.22926-100000@blackhole.kfki.hu>
References: <1088437519.13933.218.camel@spudgun.dhcp.internal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088437519.13933.218.camel@spudgun.dhcp.internal>
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
To: Evgeni Vachkov <evgeni.vachkov@investis.com>
Cc: netfilter@lists.netfilter.org

On 28 Jun 2004, Evgeni Vachkov wrote:

> > > patch? ...Or perhaps it is some other problem with other parts of the
> > > kernel?
> > It seems to me that you have applied the tcp window tracking patch from pom-ng.
> > The problem is that the client and the server have done the first step of the
> > three way handshake, and are in sync, but the firewall for some reason is not.
> > So it drops the SYN/ACK, and thus forcing the client to retransmit its SYN and
> > initiate a new session (as descibed in the source code of the patch)
> >
> > My advice is if you have applied this patch, to remove it, and test the load on the
> > firewall again.
>
> As far as I can figure out we are running with
> patch-o-matic-ng-20040302. I can see that the latest is
> patch-o-matic-ng-20040621. Is this problem present at the version we are
> running and is the new version still having the window tracking issues?

SACK support was added to the patch in patch-o-matic-ng-20040621 with some
minor fixes, compared to patch-o-matic-ng-20040302. It does not hurt to
upgrade but I don't expect that it'd behave differently in your test.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


