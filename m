From: Michael Gale <mgale@utilitran.com>
Subject: Re: Hello -- complicated firewal :(
Date: Tue, 2 Dec 2003 18:12:58 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031202181258.19454c0e.mgale@utilitran.com>
References: <7C9884991ADAE0479C14F10C858BCDF52E3812@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF52E3812@alderaan.smgtec.com>
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

Hello,

	I have solved my issue by changing a IP address but just to explain what I was doing:

		EXT - Internet connection

	22 Virtual IP's
	_________       _________
	|	|	|	|
	|master	|	|slave	|
	|_______|	|_______|
	172.16.15.2	172.16.15.3

		INT - local network connection
		Local network gateway is 172.16.15.1

Ok the firewalls would work in a master / slave setup using a heartbeat. The master firewall would listen and accept connections for the virtual IP's on the internet side and foward them to servers on the internal side. The internal side is just for production servers only at a IDC.

The master firewall would also have a internal virtual IP of 172.16.15.1 which is the gateway for all the production servers.

So if the master was to crash the slave would take over the 22 virtual IP's and the 172.16.15.1 address on the internal and be the new gateway.

My original question was if I allow forwarding on my internal interface from source addresses how could I make it so only packets using 172.16.15.1 as there gateway be forwarded and it somone was using 172.16.15.2 or .3 they would be dropped.

But I have changes some IP's so now the heartbeat is working on both interfaces on it's own network address so everything is ok. I was using the 172.16.15.2 and .3 for the heartbeat packets before.

Michael.

On Mon, 1 Dec 2003 12:31:22 -0800
"Daniel Chemko" <dchemko@smgtec.com> wrote:

> Did you concider MARKing the packet on the inbound, then reacting to the
> mark later on when the NAT has already completed? This means having 2
> rules for every nat rule you have now, but if it works...
> 
> I am not 100% sure of what you're setup is (diagrams do wonders, alas).
> 
> -----Original Message-----
> From: Michael Gale [mailto:mgale@utilitran.com] 
> Sent: Monday, December 01, 2003 11:47 AM
> To: netfilter@lists.netfilter.org
> Subject: Hello -- complicated firewal :(
> 
> 
> Hello,
> 
> 	I have been using iptables for a while but only in simple
> setups. Now I have been given the task to setup a major enterprise level
> firewall.
> 
> This firewall has 22 external virtual IP addresses plus one primary
> internal and external IP. Oh it also has 1 virtual IP on the internal as
> well.
> 
> So right now I have two firewalls running a master and slave cluster -
> which every one is master listens on it's external and internal primary
> IP's for connections from me only so I can administer it.
> 
> Plus then the master will listen on the 22 virtual IP's for DNAT them to
> the severs on the DMZ.
> 
> The slave will only listen for traffic on the external and internal
> primary IP's so I can administer it.
> 
> For a failover to be transparent the internal NIC of the master will
> listen on 172.16.0.1 and this is the internal networks gateway. This is
> NOT the primary IP of either firewall.
> 
> OK my question is .. when my master is up on firewall-1 it will listen
> on 172.16.0.1 (internal network default gateway) and 172.16.0.2 (primary
> INTERNAL IP used only for administration)
> 
> How can I make it so internal users can only use 172.16.0.1 as a
> internet gateway and NOT 172.16.0.2.  
> 
> >From my knowledge the FORWARD chain can only filter on source and
> destination address -- I would think I would have to filter out based on
> what IP the packet was forwarded to ... but how ?
> 
> I hope this is clear -- I tried looking for help on some IRC channels
> and nobody understood what I was talking about.
> 
> -- 
> Michael Gale
> Network Administrator
> Utilitran Corporation
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

