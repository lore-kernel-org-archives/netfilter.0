From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: netfilter is missing all the sext extentions on Debian
Date: Mon, 20 Jun 2005 09:37:15 +0200
Message-ID: <42B6722B.20009@mnemon.de>
References: <20050619215151.GO3217@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050619215151.GO3217@metastasis.org.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Nick,

Nick Drage schrieb:
> Hi,
> 
> I run Debian and unfortunately that means my IPTables rulesets are
> missing all the interesting extensions such as TARPIT that I would like
> to play with.
> 
> Does anyone here using the latest IPTables version rather than the
> latest Debian package?  If so, how do you integrate it into Debian and
> how do you get on?

I use iptables 1.3.1 with Debian woody / sarge - something in the middle
of both (didn't fully upgrade yet, but soon to come) with Kernel 2.4.31.
It's quite simple. Just downloaded the iptables source from
netfilter.org and the newest pom. Than you can patch the kernel and
compile... It turned out, that not all patches I wanted, could be
installed (don't know why, no time to investigate) :( But ok, _I_ can
live with that.

Then just compile iptables and install. This will install iptables* in
/usr/local/sbin instead od the default Debian /sbin, or wherever you you
configured to install. So, if you want to use your version one
possibility is to ensure, that ${PATH} has something like this:

...:/usr/local/sbin:/sbin:...

instead of:

...:/sbin:/usr/local/sbin:...

This way you always have a fallback in case something went wrong.

HTH and have a nice time,

Joerg


