From: Jason Opperisano <opie@817west.com>
Subject: Re: Neighbour table overflow
Date: Wed, 23 Mar 2005 09:23:01 -0500
Message-ID: <1111587781.4513.26.camel@hubcap.ljm.dom>
References: <000901c52fb2$ee024ee0$080211ac@PIVT>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <000901c52fb2$ee024ee0$080211ac@PIVT>
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

On Wed, 2005-03-23 at 09:08, Sebastiao Antonio Campos (GWA) wrote:
> After I had applied the solution bellow I got the follwing msg error:
> 
> Neighbour table overflow.

IIRC--that error means you've filled up your arp table.  the values
(defaults shown) are controlled by the kernel parameters:

        net.ipv4.neigh.default.gc_thresh3 = 1024
        net.ipv4.neigh.default.gc_thresh2 = 512
        net.ipv4.neigh.default.gc_thresh1 = 128

how many hosts are on the physical subnets with your firewall machine?

i was surprised to see you say that everything was working, as your
question appeared to be about policy routing, yet setting up a SNAT
seemed to magically make it work--which made no sense to me.

-j

--
"Well, I'm not calling you a liar, but... I can't think of a way to
 finish that sentence."
	--The Simpsons


