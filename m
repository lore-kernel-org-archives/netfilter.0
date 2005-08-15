From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: linux firewall configuration to support Nortel Contivity client
Date: Mon, 15 Aug 2005 00:36:05 -0500
Message-ID: <430029C5.5050902@riverviewtech.net>
References: <E1E4D7U-0006Ia-Kk@wombat.digitalis.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E1E4D7U-0006Ia-Kk@wombat.digitalis.net.au>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Michael you may want to try sniffing the traffic that your notebook gives off when it has it's ""VPN up and running.  If the traffic is IP/ESP (IP protocol 50) then the traffic is an IPSec tunnel.  If the traffic is IP/GRE (IP protocol 47) then the tunnel is a GRE tunnel.



Grant. . . 

Michael wrote:
> Hi,
> 
> At home I have a linux box (2.6.11.11 kernel) acting as my gateway. It
> is running nat, upnpd & iproute2 all quite happily.
> 
> What I want to do next is make the vpn client (Nortel Contivity) on my
> work laptop play nicely. I've been looking at the ip_nat_pptp &
> ip_nat_proto_gre patches from patch-o-matic.
> 
> I'm not sure what kind of tunel Contivity tries to establish (or much
> else about it works) Has anybody out there setup something similiar to
> this? Or know much about Contivity sets up a vpn?
> 
> --
> Michael
> oni@atice.org

