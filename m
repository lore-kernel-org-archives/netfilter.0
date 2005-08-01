From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Fun with the mangle table + LARTC
Date: Mon, 1 Aug 2005 16:41:19 +0100
Message-ID: <200508011641.19294.gdh@acentral.co.uk>
References: <200508010916.37911.gdh@acentral.co.uk>
	<42EE1D32.8010308@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42EE1D32.8010308@gmx.co.uk>
Content-Disposition: inline
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

On Monday 01 August 2005 14:01, /dev/rob0 wrote:
> Gavin Hamill wrote:
> > Hi - this is one of those "not sure if it's netfilter or LARTC" issues,
>
> I'm not sure either, but here's a guess.
>
> > -A POSTROUTING -s 10.0.0.0/255.255.255.0 -o eth1 -j MASQUERADE
> > -A POSTROUTING -s 10.0.0.0/255.255.255.0 -o eth2 -j MASQUERADE
>
> Why MASQUERADE? Try using SNAT rules.

MASQ because the IP addresses on each interaface are DHCP - home ISPs - not 
business ones :)

> > using tcpdump I can see the outgoing and reply packets on eth2 with the
> > correct source address (i.e. the one the ISP on eth2 gives me) set, but
> > tcpdump on eth0 shows only the packets from the MASQ'd host - the replies
> > from the Internet host are not passed through.
>
> Is there anything dropping the packets in FORWARD? Try tracking with
> iptables LOG rules rather than tcpdump.

OK, I'll give that a whirl :)

Cheers,
Gavin.

