From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: : Redirect in intranet using DNAT?
Date: Sun, 16 Nov 2003 12:14:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311161214.hAGCEsj21388@agate.rockstone.co.uk>
References: <200311160017.05962.m.feldmann@nikocity.de> <200311161122.hAGBMSj21351@agate.rockstone.co.uk> <200311161301.40525.m_feldmann@t-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311161301.40525.m_feldmann@t-online.de>
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

On Sunday 16 November 2003 12:01 pm, Michael Feldmann wrote:

> Am Sonntag, 16. November 2003 12:22 schrieb Antony Stone:
> >
> > I would suggest two better solutions to your requirement are:
> >
> > 1. Use DNS and access the server/s by name instead of IP - then you can
> > make both names resolve to the same address, or different addresses, or
> > change the addresses, as you shuffle your network around, and client
> > machines don't need to know any different.
> >
> > 2. Add the old address to the new server, so one machine has both
> > 192.168.0.1 and 192.168.0.5 on eth0 and will respond to requests sent to
> > either address.
>
> If I see this correctly, would solution No 1 not imply that all client
> machines use names instead of IPs? I am not too sure about that.

Yes they would, and I personally think that is the better way to do things, 
because it allows you to move services from one machine to another very 
easily without disrupting your network configuration.

> So, I think I will stick no No 2. However, as there are several services on
> Server 192.168.0.1, which I cannot move all at once to 192.168.0.5, I guess
> I will have to add _both_ addresses to _both_ servers and enable/disable
> the resp. services in such a way that only one client answers. Could this
> be a possible solution?

No way!   This would really screw up your network.   Never put one IP address 
on more than one machine at the same time.

You need to understand how IP, TCP and HTTP work together.

When a client sends an HTTP request to a server, a packet is sent from the 
client's IP address to the server's IP address - if that address doesn't 
exist, the connection fails.   Once the packet arrives at the server's IP 
address, it attempts to connect to a service running on TCP port 80 - if that 
service is not responding, the connection fails.   Once the connection has 
been made to TCP port 80, the web server looks at the HTTP request and 
decides whether it can fulfil it - if the request is for something the server 
can't answer, the connection fails.

At no point in any of the above steps is there a "if that didn't work, try 
something else instead" option.

Basically, if you are moving your web server (but not other services) from 
one machine to another on your network, you should change the address the 
clients connect to for that service so they find the new machine.   I believe 
the easiest way to do this is for the clients to use server names, and you 
just make one change in DNS.   If you don't want to use DNS, then change the 
server IP address on each client that needs to connect to it.

Antony.

-- 

I love deadlines.   I love the whooshing noise they make as they go by.

 - Douglas Noel Adams

