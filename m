From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip_conntrack_tcp Errors
Date: Mon, 28 Jun 2004 14:55:03 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406281449260.20141-100000@blackhole.kfki.hu>
References: <40E00F6A.2010604@bofh.bg>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40E00F6A.2010604@bofh.bg>
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
To: Dimitar Katerinski <train@bofh.bg>
Cc: netfilter@lists.netfilter.org

On Mon, 28 Jun 2004, Dimitar Katerinski wrote:

> > Is that a problem with conntrack and its tunning or I am missing some
> > patch? ...Or perhaps it is some other problem with other parts of the
> > kernel?
> It seems to me that you have applied the tcp window tracking patch from pom-ng.
> The problem is that the client and the server have done the first step of the
> three way handshake, and are in sync, but the firewall for some reason is not.

Sorry, but I have to contradict: there must be a connection in conntrack
which overlaps with the SYN/ACK packet detected. But why the connection
initiating SYN was not detected the same way? That is the question which
should be answered somehow.

> So it drops the SYN/ACK, and thus forcing the client to retransmit its SYN and
> initiate a new session (as descibed in the source code of the patch)

No, it does not drop the packet but ignores it as the log says. Look at
the lines in the source code a few lines below.

> My advice is if you have applied this patch, to remove it, and test the load on the
> firewall again.

Yep, that's a solution. And there won't be an answer explaining the case
then.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary



