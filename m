From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Out of window filter catches too much
Date: Wed, 2 Mar 2005 10:03:17 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0503020959570.16314@blackhole.kfki.hu>
References: <421FBC65.40202@drzeus.cx>
	<Pine.LNX.4.58.0503010938320.14280@blackhole.kfki.hu>
	<42257249.8050101@drzeus.cx>
	<Pine.LNX.4.58.0503020908580.16314@blackhole.kfki.hu>
	<42258020.9000904@drzeus.cx>
Mime-Version: 1.0
In-Reply-To: <42258020.9000904@drzeus.cx>
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
To: Pierre Ossman <drzeus-list@drzeus.cx>
Cc: netfilter@lists.netfilter.org

On Wed, 2 Mar 2005, Pierre Ossman wrote:

> >If it is reproducible then could you capture the traffic with tcpdump and
> >send me the results together with the corresponding log lines? Please dump
> >on both sides of the firewall.
> >
> It's a lot of traffic so that will be difficult. The problems appear
> after at least 100 MB has been transfered. Is there some way I can
> reduce this to just the parts that are of relevance to you?
> If you have a decent connection (or a lot of time ;)) I suppose I could
> put up the entire thing on the local webserver for you to download at
> your own leisure.

There is no need to capture the data, the protocol headers are
enough (so default snaplen of tcpdump is just fine). Write me the url
when I can download the files and I fire up the debugging environment.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

