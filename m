From: Tom Eastep <teastep@shorewall.net>
Subject: Re: NATing PPTP GRE traffic
Date: Tue, 20 Jan 2004 06:47:33 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401200647.33819.teastep@shorewall.net>
References: <00b901c3df5f$52597f30$686fa8c0@vincent>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00b901c3df5f$52597f30$686fa8c0@vincent>
Content-Disposition: inline
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
To: Derek Vincent <derek.vincent@kemikal.net>, netfilter@lists.netfilter.org

On Tuesday 20 January 2004 06:11 am, Derek Vincent wrote:
> I have been try to setup a firewall that will pass PPTP/L2TP traffic to a
> windows 2003 server inside the network...
>
> I am using Mandrake 9.2 with the 2.4.22-10mdksecure (delivered) kernel.
>
> I believe that I have shorewall configured correctly  rules below:
>
> DNAT:info       net     loc:192.168.105.1       tcp     1701    -
> DNAT:info       net     loc:192.168.105.1       udp    1701    -
> DNAT:info       net     loc:192.168.105.1       tcp     1723    -
> DNAT:info       net     loc:192.168.105.1       47      -       -
>
> and I am loading the following netfilter modules for natting pptp:
>
> ip_nat_pptp
> ip_conntrack_pptp
> ip_nat_proto_gre
> ip_conntrack_proto_gre
>
> The issue I am having is the when I try to VPN in to the nated windows
> server things seem to go ok for the initial communication but I get the
> error below:
>
> protocol 47 unreachable [tos 0xc0]
>
> After this occurs a half dozen times the vpn client errors out.
>
> I had found a googled message regarding something similar with the 2.4.22
> kernel and tried to the patch-o-matic on it and I suspect that the mandrake
> 2.4.2-10mdk already has this issue patched since I did not see any patches
> that discussed this issue...
>
> I was wondering if there is anything I have missed in the FW rules or if I
> am missing load a module...

You should probably post questions of this sort on the Shorewall list rather 
than on this list. If you chose to have Mandrake configure Shorewall for you, 
the 'loc' zone is empty and the zone for the local network is called 'masq'. 
The rules you need to forward PPTP traffic to the server are thus:

DNAT   net    masq:192.168.105.1    tcp 1723
DNAT   net    masq:192.168.105.1    47

-Tom
-- 
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net



