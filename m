From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Prevent traceroutes
Date: Mon, 23 May 2005 09:01:07 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0505230854490.18275@blackhole.kfki.hu>
References: <fad9d484050519150730dbc53d@mail.gmail.com>
	<20050519232314.GA9369@bender.817west.com>
	<20050519233347.GA9462@bender.817west.com>
	<428D8638.4040301@riverviewtech.net>
	<428D954E.1010105@riverviewtech.net>
	<20050520152021.GA11737@bender.817west.com>
	<Pine.LNX.4.61.0505201443170.8116@e-smith.charlieb.ott.istop.com>
	<428E3493.4040505@riverviewtech.net>
	<20050520193716.GA12584@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050520193716.GA12584@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Hi Jason,

On Fri, 20 May 2005, Jason Opperisano wrote:

> especially considering that we all have the wondrous mangle table
> available to us, which *is* traversed by every packet, and gives us an
> opportunity to do some pre-filter table scrubbing.

That was a very nice summary. I have to mention the 'raw' table only as an
excellent place to pre-filter the traffic, with the bonus that traffic
filtered out in 'raw' won't burden conntrack at all. (With the restriction
that only stateless rules can be used in 'raw'.)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

