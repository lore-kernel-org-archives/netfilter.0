From: Kelly Setzer <Kelly.Setzer@placemark.com>
Subject: Re: DHCP IssuesB
Date: Thu, 20 Mar 2003 09:18:42 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030320151842.GB18401@placemark.com>
References: <Pine.LNX.4.53.0303200827390.6606@beethoven.javaspotlet.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.53.0303200827390.6606@beethoven.javaspotlet.com>
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
Content-Transfer-Encoding: 7bit
To: Tim Miller <tj.miller@javaspotlet.com>
Cc: NetFilter List <netfilter@lists.netfilter.org>

On Thu, Mar 20, 2003 at 08:46:41AM -0600, Tim Miller wrote:
> 
> I'm pretty new to netfilter so bear with me.  I have a server that has a
> quad card, currently the card is configured:
> 
> eth0 -> internet
> eth1,eth2 -> not active (yet)
> eth3 -> internal lan 10.2.0.0/24 network
> 
> I am running dhcpd on eth3 and everything works ok, except for the
> renewing of addresses.  For example:
> 
> 1. Connect a laptop to the network and power up, get an address ok.
> 2. Release the address and then renew the address, get an address ok.
> 3. Perform a renew on the laptop and it fails.

What does your dhcpd log say?

> 
> 
> Does this make sense? What am I missing?
> 

Do a tcpdump while you attempt to renew.  That should be revealing.

Kelly

--
Kelly Setzer, System Administrator/Architect - Placemark Investments
14180 Dallas Pkwy, Suite 200, Dallas, TX 75240
kelly.setzer@placemark.com  http://www.placemark.com
(972)404-8100x41 (work)       (214) 287-3464 (cell)

