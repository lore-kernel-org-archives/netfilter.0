From: Alistair Tonner <Alistair@alistairt.ath.cx>
Subject: Re: ICQ and masqueraded clients- is module written yet?
Date: Wed, 23 Oct 2002 12:22:01 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021023162201.GA725@Ajftl1.ajfthome.on.ca>
References: <909130024.3256.122.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <909130024.3256.122.camel@localhost>; from adam@pentatrade.hu on Fri, Oct 23, 1998 at 04:07:04 -0400
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Nemeth Adam <adam@pentatrade.hu>
Cc: netfilter@lists.netfilter.org


	For the record, it has been stated by the core team that they
	will not write a module for an app that has a proprietary 
component,
	and since the ICQ server is proprietary, they won't write the 
module.

	On the positive side, ICQ will work natively through an 
IPTABLES firewall,
	although direct connections from client to client will not 
work.  File transfers
	are at best iffy as to if they'll work ...The clients need only 
be configured to
	send through server.
	 
	Since IPTABLES is on my system only for the home/DMZ and there 
are only
	four clients that use ICQ here, I've allocated a range of ports 
for each client in
	the 4000 range and put in rules to DNAT the connections on 
those ports, plus
	configured the clients to use only those ports for transfers 
(ICQ Firewall settings)
	...	 
	This is acceptable to me, but I imagine that on the scale of an 
ISP that it would be
	annoying if the ISP were assigning clients non-routable IP's.  
If the ISP is
	assigning routable IP's then ICQ will work fine with no 
adjustments to the firewall
	between the ISP clients and the Internet.

On 1998.10.23 04:07 Nemeth Adam wrote:
> Hello,
> 
> 	I'm using kernel 2.4 with iptables, and I masquerade intranet
> clients
> with it. Users want to use ICQ (ICQ 2000/licq). I know, there was an
> icq
> module for ipchains, but I want to use iptables.
> 	Has anyone written the module yet, or have anyone a trick to
> make it
> fully useable?
> 
> 	Thanks:	 
> 				Adam Nemeth
> 
> --
> Udvozlettel:
> 				Nemeth Adam <adam@pentatrade.hu>
> 
> 


