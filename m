From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Dual Internet Connection
Date: Mon, 1 Jul 2002 08:52:20 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020701075222.ROAE19225.mta07-svc.ntlworld.com@there>
References: <NEBBKAFNMLLNBNGMMLLLGEJNCJAA.dcrooks@succeed.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <NEBBKAFNMLLNBNGMMLLLGEJNCJAA.dcrooks@succeed.net>
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
To: netfilter@lists.samba.org

On Monday 01 July 2002 12:45 am, Dan Crooks wrote:

> I have two internet connections, one DSL and one Cable.  I want to run both
> connections to one machine using seperate NIC's.  Can I apply the same
> rules to both interfaces?  I can't see a problem with incoming connections
> but not sure about the outgoing.
>
> I want to be able to select what connection each computer on my LAN uses
> for it's internet connection by changing their gateway.  I'm just not sure
> how to implement the firewall.

You will find this a *little* tricky using a single firewall - it would be 
easier to use two firewalls, possibly with 3 NICs each - internal, external, 
and to the other firewall, but if you want to do it on one machine, you'll 
need to learn about iproute2 and special routing table methods for specifying 
different external routes depending on the source address from your internal 
machines.

The netfilter rules are no problem - just specify whatever you want and they 
will do their job - the less simple part is getting the underlying routing on 
the machine to send the packets out where you want them to go...

Hope this helps,

 

Antony.

