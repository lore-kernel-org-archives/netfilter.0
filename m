From: Jihoon Chung <difro@sexycoder.com>
Subject: Re: IRC DCC between 2 clients on the same net.
Date: Sat, 23 Nov 2002 21:33:51 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021123123351.GA11201@morpheus>
References: <3DDD3987.28137.1A389300@localhost> <3DDE5824.22076.E31BED@localhost>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3DDE5824.22076.E31BED@localhost>
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
To: Bob <BHockney@ix.netcom.com>
Cc: netfilter@lists.netfilter.org

On Fri, Nov 22, 2002 at 04:15:32PM -0800, Bob wrote:
> After attempting this, the problem is that the client receiving the file 
> attempts a connection to the external ip, which is intercepted by ip_nat_irc 
> and forwarded to the other client on the LAN, but with a source ip of client 
> initiating the tcp connection, which is correct (it would be the ip of the a 
> remote host if outside the firewall).  The second client then responds, but 
> since it is responding to an ip on its own subnet, the reply doesn't go 
> through the gateway.  The first client is expecting a reply from the external 
> ip (since it sent the SYN there), but gets a reply from another ip and rejects 
> it.  The second client immediately closes the DCC connection, while the first 
> continues to wait for a reply until it times out.
> 
> This behavior is normal, by design in ip_nat_irc, and difficult to fix.  One 
> workaround, which does work, is modify the routing table of both clients to 
> send all LAN traffic through the gateway.  A kludge at best.

I see. Thanks.
Guess there is no clean solution for this situation.

when ip_nat_irc intercepts the dcc connection, can't you make it  change the
source ip to the gateway's ip?  That way, responding client would send
the packet to gateway where the dst ip would be changed back to the
original one ?  Just a thought.. I don't know much about the netfilter
nat structure.

