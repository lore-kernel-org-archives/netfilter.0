From: "Bob" <BHockney@ix.netcom.com>
Subject: Re: IRC DCC between 2 clients on the same net.
Date: Fri, 22 Nov 2002 16:15:32 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DDE5824.22076.E31BED@localhost>
References: <3DDD3987.28137.1A389300@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20021122041146.GA19927@sexycoder.com>
Content-description: Mail message body
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
To: Jihoon Chung <difro@sexycoder.com>, netfilter@lists.netfilter.org

Jihoon wrote:

> > the FORWARD chain of the gateway box allow connections to the external ip from
> > you LAN.
> 
> Why FORWARD? Shouldn't it be the INPUT chain?

I meant INPUT.  My bad. 

> > DCC is a passive protocol so sending a file means an inbound tcp connection, why
> > you need the irc modules in the first place.  What is happening is that
> > ip_nat_irc has little choice but to substitute the external ip of your gateway
> > for your LAN ip in the DCC SEND request, thus making the other client think it
> > should connect to your gateway instead of the LAN address of the client machine
> > to get the file -- what you want if the other client is outside your firewall.
> > ip_nat_irc then intercepts this and forwards the connection to the LAN ip making
> > to DCC SEND request.

After attempting this, the problem is that the client receiving the file 
attempts a connection to the external ip, which is intercepted by ip_nat_irc 
and forwarded to the other client on the LAN, but with a source ip of client 
initiating the tcp connection, which is correct (it would be the ip of the a 
remote host if outside the firewall).  The second client then responds, but 
since it is responding to an ip on its own subnet, the reply doesn't go 
through the gateway.  The first client is expecting a reply from the external 
ip (since it sent the SYN there), but gets a reply from another ip and rejects 
it.  The second client immediately closes the DCC connection, while the first 
continues to wait for a reply until it times out.

This behavior is normal, by design in ip_nat_irc, and difficult to fix.  One 
workaround, which does work, is modify the routing table of both clients to 
send all LAN traffic through the gateway.  A kludge at best.

-Bob

