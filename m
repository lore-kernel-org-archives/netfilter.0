From: Rodrigo Hidalgo <rodde@myw0rld.org>
Subject: Re: opening a port..
Date: Wed, 8 Jan 2003 15:40:10 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0301081536520.19157-100000@smtp.myw0rld.org>
References: <1042030327.590.10.camel@nirvana>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042030327.590.10.camel@nirvana>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mdew <mdew@mdew.dyndns.org>
Cc: netfilter <netfilter@lists.netfilter.org>

Hi,

I guess youre scenario is like this:

some_machine - - - Router - - - - server_maybe_not_existing(4662)

If you want to be able to get any positive respons you should do a 

some_machine> telnet server_maybe_not_existing 4662

The router will not tell you the port is open.

Good Luck!

/r


On 9 Jan 2003, mdew wrote:

> Date: 09 Jan 2003 01:52:07 +1300
> From: mdew <mdew@mdew.dyndns.org>
> To: Dharmendra.T <dharmu@nsecure.net>
> Cc: netfilter <netfilter@lists.netfilter.org>
> Subject: Re: opening a port..
> 
> On Thu, 2003-01-09 at 01:33, Dharmendra.T wrote:
> > 
> > 
> > On Wed, 2003-01-08 at 17:42, mdew wrote:
> > > 
> > > Hi,
> > > Just *testing* this out..
> > > 
> > > iptables -A INPUT -i eth0 -p tcp --dport 4662 -j ACCEPT
> > > iptables -A INPUT -i eth0 -p udp --dport 4662 -j ACCEPT
> > > iptables -A INPUT -i eth1 -p udp --dport 4662 -j ACCEPT
> > > iptables -A INPUT -i eth1 -p tcp --dport 4662 -j ACCEPT
> > > iptables -A INPUT -i eth1 -p tcp --sport 4662 -j ACCEPT
> > > iptables -A INPUT -i eth1 -p udp --sport 4662 -j ACCEPT
> > > iptables -A INPUT -i eth0 -p udp --sport 4662 -j ACCEPT
> > > iptables -A INPUT -i eth0 -p tcp --sport 4662 -j ACCEPT
> > > 
> > > iptables -A FORWARD -o eth0 -p tcp --dport 4662 -j ACCEPT
> > > iptables -A FORWARD -o eth1 -p tcp --dport 4662 -j ACCEPT
> > > iptables -A FORWARD -o eth1 -p udp --dport 4662 -j ACCEPT
> > > iptables -A FORWARD -o eth0 -p udp --dport 4662 -j ACCEPT
> > > iptables -A FORWARD -o eth0 -p udp --sport 4662 -j ACCEPT
> > > iptables -A FORWARD -o eth1 -p udp --sport 4662 -j ACCEPT
> > > iptables -A FORWARD -o eth1 -p tcp --sport 4662 -j ACCEPT
> > > iptables -A FORWARD -o eth0 -p tcp --sport 4662 -j ACCEPT
> > > 
> > > yet, when i try to telnet to it,
> > > 
> > > mdew:~# telnet 127.0.0.1 4662
> > > Trying 127.0.0.1...
> > > telnet: Unable to connect to remote host: Connection refused
> > > 
> > > Yeah I know I have lots of unnessary rules, but im only testing 'em...it
> > > just seems a little strange that i cant see 4662 (Edonkey port) on the
> > > router.
> > > 
> > > -mdew
> > > 
> > > 
> > Note:
> > telnet 127.0.0.1 port
> > 
> >  This will not go through any of the interfaces(eth*). You should allow
> > this through -i lo.
> > 
> > Here some how you are getting connected and you are getting the response
> > connection refused. Probably you are not running the service on the
> > router!.
> > 
> > -- 
> > Dharmendra.T
> > Linux Enthu
> > 
> ok, telnet from another machine to the router.
> 
> telnet 10.0.0.6 4662
> Trying 10.0.0.6...
> telnet: Unable to connect to remote host: Connection refused
> 
> what "service" should I be running? I simply want 4662 open both ways.
> 
> -mdew
> 
> 


