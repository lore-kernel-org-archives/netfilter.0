From: Jason Opperisano <opie@817west.com>
Subject: Re: Local Port Forwarding.
Date: Fri, 22 Apr 2005 17:57:56 -0400
Message-ID: <20050422215756.GA5739@bender.817west.com>
References: <1114206098.6690.5.camel@cautin2.dcsc.utfsm.cl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1114206098.6690.5.camel@cautin2.dcsc.utfsm.cl>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Apr 22, 2005 at 05:41:38PM -0400, Alejandro Villarroel wrote:
> Hello:
> 	I'm kind of new to IpTables, and I'm having problems to do this kind of
> port forwarding in my Fedora Core 3:
> 
> Suppose I have some user trying to access Host X:Port X on the Internet
> from my Linux, but Instead of that I want to forward this traffic to the
> localhost:Port Y, what rule I have to apply?

your kernel needs to be compiled with the option to nat local
connections:

  CONFIG_IP_NF_NAT_LOCAL=y

(i *believe* that FC3 includes this in their kernel--don't quote me on
that)

with that, you can DNAT local connections in the nat table, OUTPUT
chain:

  iptables -t nat -A OUTPUT -p tcp -d $HostX --dport $PortY \
    -j DNAT --to-destination $LocalHost:$PortY

HTH...

-j

--
"Diane: Tom, you're so deep in the closet you're finding Christmas
 presents."
        --Family Guy


