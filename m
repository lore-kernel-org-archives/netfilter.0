From: Real Cucumber <monkcucumber@yahoo.com>
Subject: Re: SSH Connections Lost After 1 minute idle
Date: Tue, 13 Jul 2004 15:25:09 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040713222509.24799.qmail@web40709.mail.yahoo.com>
References: <16628.23121.334610.170889@saint.heaven.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <16628.23121.334610.170889@saint.heaven.net>
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
To: netfilter@lists.netfilter.org

Basically I've created a port forwarding firewall with
two network interfaces, that's sole purpose is to
forward incoming SSH packets on one interface (WAN)
through the other interface (LAN) to a local SSH
server.

I've done this using IPtables and the mangle table.

It works great, except for the fact that connections
are dropped if left idle for 1 minute.

I have tried allowing all ICMP for
INPUT,OUTPUT,FORWARD as well as creating static ARP
entries on the firewall, and nothing has helped.

If anyone knows what else may cause 1 minute idle
connection timeouts , please let me know.

This connection timeout issue does not occur for LAN
clients connecting to the SSH server. They can remain
idle for an indefinate period of time.




--- "Dick St.Peters" <stpeters@NetHeaven.com> wrote:
> Antony Stone writes:
> > On Tuesday 13 July 2004 9:57 pm, Real Cucumber
> wrote:
> > 
> > > Why should ICMP not be completely blocked? The
> machine
> > > is used strictly as a port forwarding
> firewall/router.
> > 
> > Because blocking all ICMP will break networking.  
> Look up the RFCs explaining 
> > what ICMP is for if you do not understand this.
> 
> I would like to second this vigorously, although I
> would phrase it
> differently: blocking ICMP makes networks fragile. 
> Fragile networks
> break easily when anything out of the ordinary
> happens.
> 
> --
> Dick St.Peters, stpeters@NetHeaven.com 
> 
> 



		
__________________________________
Do you Yahoo!?
Yahoo! Mail - 50x more storage than other providers!
http://promotions.yahoo.com/new_mail

