From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Quick Question
Date: Thu, 30 May 2002 16:54:55 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020530205455.GN29214@cannon.eng.us.uu.net>
References: <AIEOIGGABAHAAIOAILIDGEDFCGAA.matlas@vistainnovation.com> <200205302031.g4UKVnA19194@Networker.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <200205302031.g4UKVnA19194@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

On Thu, May 30, 2002 at 09:31:47PM +0100, Antony Stone wrote:

> On Thursday 30 May 2002 9:17 pm, Mike Atlas wrote:
> 
> > I am setting up a Squid proxy server to run in transparent mode. To do
> > this, I need to forward all port 80 and 443 traffic to squids' port, 3128.
> > Additionally, I would like all other traffic on all other ports to forward
> > on to the router.
> >
> > I have found a script to forward port 80 to squid (note: eth1 is my
> > internal interface, eth0 is external):
> >
> > iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j
> > REDIRECT --to-port 3128
> 
> Yes.   REDIRECT is used only when you are not changing the IP address, and 
> you are changing the port number (ie the packet remains addressed to the same 
> machine).

Not completely correct, Antony ;-) From the HowTo:

There is a specialized case of Destination NAT called redirection: it is
a simple convenience which is exactly equivalent to doing DNAT to the address
of the incoming interface.

Ramin

> 
> To change the address of the machine it's going to, you use DNAT:
> 
> iptables -A PREROUTING -t nat -i eth1 -d a.b.c.d -j DNAT --to 192.168.0.2
> 
> where a.b.c.d is the IP address of eth1 on the firewall.
> 
> That rule as I've written it will send *everything* addressed from the 
> internal network to the firewall, on to the router on 192.168.0.2 (and it 
> will send the replies back again).
> 
> No need to specify --dport ! 80; just put this rule after the one you wrote 
> above, and the DNAT rule will only get used if the REDIRECT didn't.
> 
> You can put a '-p tcp' etc into the rule if you only mean to send TCP packets 
> on to the router, or whatever.
> 
> 
> 
> Antony.

