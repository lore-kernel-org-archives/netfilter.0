From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Send local traffic to a different server.
Date: Thu, 24 Jun 2004 09:46:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406240946.22212.Antony@Soft-Solutions.co.uk>
References: <5EDC9B3CC8401E4184D3B43B75A75C2B46D668@mx.p21.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5EDC9B3CC8401E4184D3B43B75A75C2B46D668@mx.p21.com>
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

On Wednesday 23 June 2004 4:26 pm, Aldo Lagana wrote:

> am i wrong or can you not send traffic to another server simply with
> netfilter/iptables rules?  Does not that require iproute2?  In other words
> don't all of the rules assume that the NAT addresses are bound to local
> interfaces?

No, you can use any address you like in nat rules (both SNAT and DNAT).

Whether or not it makes sense is another matter (eg: do the packets get routed 
back through the machine and get reverse-natted?), however netfilter will 
allow you to specify whatever you like.

Regards,

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


