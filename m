From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: Bridge question
Date: Fri, 17 Oct 2003 07:49:50 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310170749.50608.Herman@AerospaceSoftware.com>
References: <200310170839.h9H8dY8206228@alf1.lmb.internal>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310170839.h9H8dY8206228@alf1.lmb.internal>
Content-Disposition: inline
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
To: tsh@mrc-lmb.cam.ac.uk
Cc: netfilter@lists.netfilter.org

Hmmm, could you clue me up a little more?

Our problem is this:
- Hotel with 300 rooms.
- VLANs on 3COM switches to isolate the guests and consolidate the feed, back 
to the server.
- Kernel 2.2 server system - does not understand VLAN packets and rejects 
them.

As a stop-gap, until the server is updated to kernel 2.4, we want to filter 
the VLAN Q-tags using a kernel 2.4 bridge.  We have this working, but the 
bridge works like a hub and connects everything to everything, so then the 
VLAN 'security' is lost, putting us back to square one.

We therefore need to add filtering capability to the bridge to keep the guests 
separated.  Preferably, this should be done at the ethernet level, but since 
this is a stopgap solution, we could use netfilter to block certain packets 
to prevent guests from browsing each other.

Now, the part from your comment that I don't understand is 'proxy ARP'.

Could you clue me up?
   We're using netfilter as a filtering bridge + NAT + local router between
   us and the the local university router (via which we are attached to
   *its* LAN) using proxy arp and iptables. It's been running happily for
 about 1.5 years (touch wood) supporting about 1200 hosts behind it.

What I have been thinking, in order to avoid having to apply patches to the 
kernel to get bridge+iptables to work, is to simply use more ethernet ports 
and loop two of them with a cross-over cable.  Then run a bridge between eth0 
and eth1, loop eth1 to eth3 and run iptables between eth2 and eth3.  Kludgy 
but doable.  Finally, use iptables as an Ingress filter to the Bridge to 
block the MS Windows Network Neighborhood feature, making the usual kind of 
guest unable to browse other guests.  

The 3COM switches will then be connected to the iptables side of the thing and 
the server to the bridge side.  Technically, the VLAN security will still be 
lost, but the addition of iptables will allow us to limit the damage and have 
improved isolation between guests.

Comments?

Cheers,
-- 
Herman Oosthuysen 
B.Eng(E), MIEEE
Aerospace Software Ltd.
Ph: 1.403.241-8773, Cell: 1.403.852-5545, Fx: 1.403.241-8841
Herman@AerospaceSoftware.com, http://www.AerospaceSoftware.com

