From: Helge Weissig <helgew@grajagan.org>
Subject: Re: protocol 50 unreachable
Date: Thu, 2 Dec 2004 10:22:27 -0800 (PST)
Message-ID: <Pine.LNX.4.44.0412021019060.25230-100000@gollum.grajagan.net>
References: <20041202172531.GA5363@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041202172531.GA5363@bender.817west.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

The iptable logs are not complete and as I mentioned, I may need help with 
setting that up. I can see the packets coming from the server with tcpdump 
as I showed in my original post but then an immediate reply is sent back 
and nothing goes through to the internal interface. The same thing happens 
when I use nmap to scan ip protocols. Conversely, my internal ESP traffic 
ends at the internal interface of my firewall. It never reaches the 
external interface or the outside. TCP traffic works fine as you can see 
from the ping logs from the internal client. Could this indicate that 
there is a problem before anything gets to iptables?

h.

On Thu, 2 Dec 2004 at 12:25 -0500, netfilter-bounces@lists.netfilter.org wrote:

JO> On Thu, Dec 02, 2004 at 07:13:59AM -0800, Helge Weissig wrote:
JO> > Jason,
JO> > 
JO> > 	my ESP packets do not go from the external interface to the internal 
JO> > one and vice versa. The connection to the VPN server works when I hook 
JO> > up directly with no changes other than the IP of the client. I cannot 
JO> > see how this would be a problem with the VPN network at all.
JO> > 
JO> > h.
JO> 
JO> looking at your logs--all your ESP packets are from client->server.
JO> you don't have a single ESP packet from server->client.  so when you
JO> say, "my ESP packets do not go from the external interface..." you are
JO> ignoring the fact that there are no ESP packets ever getting to your
JO> external interface.
JO> 
JO> which brings me back to what i said several replies ago:
JO> 
JO>   your VPN server is discarding the ESP packets from your client as a
JO>   result of the mangling of your intermediate NAT device.
JO> 
JO> either make the VPN server more tolerant, or use NAT-T on your client.
JO> 
JO> -j
JO> 
JO> --
JO> "Ah, good ol' trustworthy beer. My love for you will never die."
JO>         --The Simpsons
JO> 


