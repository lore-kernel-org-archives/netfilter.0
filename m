From: Richard Doyle <rdoyle@islandnetworks.com>
Subject: Re: Windows file sharing over different subnets
Date: 27 Mar 2003 13:25:33 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048800333.1212.70.camel@plunker.islandnetworks.com>
References: <1048792127.1167.23.camel@psyche>
	 <3E834E40.3070702@corp.lcom.net> <1048794050.1021.31.camel@psyche>
	 <3E8353B8.5020502@corp.lcom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E8353B8.5020502@corp.lcom.net>
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

On the other hand, WINS has some advantages over lmhosts: it is dynamic
and your dhcp server can instruct the clients to use the wins server
instead of sending out broadcasts (add an "option netbios-node-type 2"
statement to your dhcpd configuration file; see man dhcp-options).

You may find some way to route broadcast traffic, but that way lies
madness...

-Richard

do netbios over tcp/ip peering instead of broadcasts
On Thu, 2003-03-27 at 11:40, Andrew J. Meader wrote:
> If you don't want to run wins on your nt2k box then you should work with 
> the lmhosts file. lmhosts.sam is a good reference for what you are 
> trying to do. You can use Samba to do some netbios forwarding but for 
> what you are doing that might be overkill. Read lmhosts.sam (on one of 
> the windows boxes.)
> 
> Andy
> 
> Y Makki wrote:
> 
> >Hi,
> >
> >I don't really need a wins server on the eth1 segment since there are no
> >windows machines here except the file server, the eth2 segment has no
> >servers at all.
> >
> >For testing I have set the FORWARD default policy to ACCEPT, and allow
> >all incoming traffic from both eth1 and eth2.
> >I also tried earlier to DNAT any 135:139 traffic coming from eth2 to the
> >fileserver, which did not help. Ping works from segment to segment.
> >
> >Maybe there is a client or relay agent of some sort I could install on
> >the linux gateway, I don't know.
> >



