From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Chain traversal with multiple internal IP subnets.
Date: Mon, 23 Sep 2002 02:22:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020923012225.QAN13996.mta05-svc.ntlworld.com@there>
References: <1032724445.1352.22.camel@neo.matrix.ca.>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1032724445.1352.22.camel@neo.matrix.ca.>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sunday 22 September 2002 8:54 pm, Jared Brick wrote:

> I have (for various reasons) a LAN with two gateways that internally use
> three different IP subnets (don't ask).

Okay ...  :-)

> However the other gateway is a Linux box with two IP addresses (it only
> acts as a gateway for two of the subnets)  using Iptables. The gateway
> itself has static routes so that it can route between the different
> subnets, including the subnet for which it has no IP address. My
> question in which chain will a packet traverse when it is traveling
> between two different internal subnets. I think it is the FORWARD chain
> but my colleague feels it would be the OUTPUT chain. I ask because I am
> having trouble routing between the internal networks.

It is the FORWARD chain.   The reasoning is simple:

Only packets which are destined for the machine running netfilter traverse 
the INPUT chain.

Only packets which are originated on the machine running netfilter traverse 
the OUTPUT chain.

Packets which originate on another machine and are destined for another 
machine only traverse the FORWARD chain.

Of course, the above statements are for the filter tables only - all packets 
coming in to a machine will traverse the PREROUTING chain (nat table) and all 
packets leaving a machine will traverse the POSTROUTING chain (nat table).

The PREROUTING chain in particular may change the selection about whether the 
packet terminates on this machine and enters the INPUT chain, or whether it 
goes on to some other machine and therefore enters the FORWARD chain.

Netfilter does not even care about packets which enter through an interface 
and then exit by the same interface - they still go through the FORWARD chain.

Hope this helps,

Antony.

-- 

Which part of 'apt-get dist-upgrade' do you not understand ???

