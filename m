From: "Dick St.Peters" <stpeters@NetHeaven.com>
Subject: Re: IP Alias with iptables
Date: Tue, 20 Apr 2004 14:06:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16517.26251.561739.758706@saint.heaven.net>
References: <EMEKLOMJOPNJPAFKHEDJGECHCDAA.rhaces_chistes@yahoo.com.mx>
	<200404191625.45747.Antony@Soft-Solutions.co.uk>
	<200404191612.39869.Alistair@nerdnet.ca>
	<200404192231.42723.Antony@Soft-Solutions.co.uk>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404192231.42723.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> > 	Aliased (stacked) interfaces ARE NOT SECURE.  Period.
> 
> Indeed.   I would like to see this emphasised more in the netfilter howtos & 
> tutorials.   Multiple addresses on one interface are all very well, so long 
> as they exist within the same subnet; however anyone trying to use multiple 
> *network* addresses on one physical interface is defeating their security by 
> ignoring what the different OSI network layers mean.

I want to add some qualification to these overstatements.  Aliased
interfaces do not inherently introduce any insecurity in cases where
you don't care about subnet separation.  For example, a hosting
service that receives and uses a new address allocation not contiguous
with its existing subnet is living with reality, not ignoring what the
network layers mean nor defeating its security.

(As an aside, the OSI model is really little more than a sometimes
useful abstraction anyway.  Twenty years ago it was already hard to
relate to a corporate network that used both IP-encapsulated DECnet
and DECnet-encapsulated IP.  Today's networks abound with VPNs that
muddle the OSI model.)

--
Dick St.Peters, stpeters@NetHeaven.com 

