From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPtables accounting ...
Date: Wed, 13 Nov 2002 14:10:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211131410.gADEAle31994@vulcan.rissington.net>
References: <1037193855.4553.25.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037193855.4553.25.camel@rayw.knowledgefactory.co.za>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wednesday 13 November 2002 1:24 pm, Raymond Leach wrote:

> Hi
>
> Where do I do iptables accounting?
>
> For example: If I have users on a private LAN surfing via a proxy on the
> firewall and I have web servers in a DMZ also being routed via the
> firewall, where do I put my accounting rules? In the FORWARD chain, or
> the INPUT chain, or both?

Packets being routed through your firewall go through the FORWARD chain and 
not through the INPUT chain.

Packets going to a proxy application running on your firewall go through the 
INPUT chain and not the FORWARD chain.

Antony.

-- 

Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Nobel Prizewinner in Physics

