From: Alistair Tonner <Alistair@alistairt.ath.cx>
Subject: Re: FTP/auth problems (slooow links)
Date: Sun, 13 Oct 2002 12:48:21 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021013164821.GA689@Ajftl1.ajfthome.on.ca>
References: <3DA97045.2040803@solidas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3DA97045.2040803@solidas.com>; from Svein.Seldal@solidas.com on Sun, Oct 13, 2002 at 09:08:21 -0400
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
To: "Svein E. Seldal" <Svein.Seldal@solidas.com>
Cc: netfilter@lists.netfilter.org


	I wonder ... are the boxes inside purely WIN boxes?
	-- What sort of outside connection do you have?
	-- Do you have a rule forcing MTU size on the outside interface?

		-- I've found that some WIN installations for some
	reason dont do MTU discovery by default.... I've had to
	turn it on ... although I suspect that it was turned off by
	previous administrators...

	(just a similar, although odd situation I've run into in the 
past...)

	Alistair Tonner


On 2002.10.13 09:08 Svein E. Seldal wrote:
> Hi,
> 
> I have read about a couple of previous discussions on the issues of 
> using iptables together with FTP and acheiving only really *slow* 
> throughputs. All Q's that I've read concludes that the remedy is to 
> either passthough auth (ident) packets or to reject it.
> 
> I have a linux (2.4.18) running iptables. It is a router and FW, and 
> is NAT'ing the internal address range (192.168.0.x) to the external 
> range (1.2.3.x). ip_conntrack, ip_conntrack_ftp and ip_nat_ftp are 
> all loaded in the router. It is a 266 PII with 128Mb memory.
> 
> For any machine that are placed on the inside, there are two methods 
> of getting to another machine on the inside: either using the direct 
> internal address 192.168.0.x or by using the external address 
> 1.2.3.x. The net result is the same, but the latter is routed through 
> the router (and will always be accepted).
> 
> Now, the problem is this: I open two FTP connections from the client 
> machine 192.168.0.10 to a server, the first to 192.168.0.5 and the 
> other connection to 1.2.3.5. Again, this is the same machine, only 
> one of them is going via. the router while the other is not.
> 
> The connection going via. the router is slow, very slow. The problem 
> is that is does not matter if I DROP, REJECT or ACCEPT the auth 
> (ident) port. It still is as extremely slow -- direct connection 
> takes 20 mins, while the routed version takes 2-3 hours!!.
> 
> My hypothesis could be that the ip_nat_ftp module is causing the 
> considerable delay, since it must read all FTP data (I'm unsure about 
> FTP-data though). Another theory could be that the routing memory of 
> the iptables/kernel is too small. How can I increase it?
> 
> Any one else got any ideas? (I've got a lot of angry customers on my 
> back...)
> 
> 
> Thanks,
> Svein Seldal
> 
> 
> 


