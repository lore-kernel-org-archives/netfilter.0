From: Jason Opperisano <opie@817west.com>
Subject: Re: protocol 50 unreachable
Date: Wed, 01 Dec 2004 23:12:25 -0500
Message-ID: <1101960745.22517.31.camel@hubcap.ljm.dom>
References: <Pine.LNX.4.44.0412011956430.22471-100000@gollum.grajagan.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0412011956430.22471-100000@gollum.grajagan.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-12-01 at 23:00, Helge Weissig wrote:
> hmm... how does a packet know it needs to go from my external NIC to my 
> internal NIC if it comes through ESP? Maybe I am confused here... 

state tracking.  in a VPN client -> VPN server scenario the esp packets
are *always* initiated from the client side:

  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
  iptables -A FORWARD -i $INSIDE_IF -p 50 -j ACCEPT

  iptables -t nat -A POSTROUTING -o $OUTSIDE_IF -j MASQUERADE

that's it...

> let's leave the VPN client/server out of the picture to simplify. If I 
> send an ESP packet from somewhere to my external IP address I get the 
> "protocol 50 unreachable" ICMP response. The underlying problem seems to 
> be the primary cause of my troubles, no?

um--no.  i have run pretty much every single VPN client/server
combination in existence, and have never even thought of testing it by
sending unsolicited IP Protocol 50 packets through a firewall to the VPN
client behind it.  it's the most flawed troubleshooting technique i've
heard in quite some time...save yourself some time and give up on it.

to troubleshoot VPN client/server connection problems--use the debug
logs on either side.  use tcpdump.  do both the client and server agree
that both Phase 1 and Phase 2 key exchanges complete?  is there a
routing problem on either side of the tunnel?  are packets successfully
encrypted and sent from the client?  successfully received and decrypted
by the server?  where do they go from there?  do the replies get
encrypted and sent back from the server?  received and decrypted by the
client?

debug at each link in the chain--don't poke at the chain from afar.

-j

--
"Dear Baby, Welcome to Dumpsville. Population: You"
	--The Simpsons


