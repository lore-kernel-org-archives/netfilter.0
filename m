From: alucard@kanux.com
Subject: Re: forwarding on the same NIC
Date: Tue, 11 May 2004 11:38:14 -0400 (VET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2022.200.44.170.105.1084289894.squirrel@200.44.170.105>
References: <3401.200.44.170.105.1084217773.squirrel@200.44.170.105> 
    <200405102115.14089.Antony@Soft-Solutions.co.uk> 
    <1292.192.168.74.154.1084226963.squirrel@192.168.74.154> 
    <1084227992.14224.5.camel@localhost> 
    <1166.200.44.170.105.1084283379.squirrel@200.44.170.105>
    <1084288178.15768.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084288178.15768.10.camel@localhost>
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
Cc: alucard@kanux.com

Hi again... let me answer each section...

> Let me see if I understand this correctly.  The ISP router connects you
> to the Internet but it know you as the RFC 1918 (private) address
> 10.73.219.156.  The router, Linux box and 2nd WebServer are all
> connected on the same subnet through a hub or switch.  You want the
> Linux box to change the packet addressed to it on 8080/tcp to 80/tcp
> with a source address of 10.73.219.77 and then forward the packet to the
> 2nd WebServer?

Yes, exactly... ;)

> I've never tried this but I'll take a few guesses on what happens and
> why it is probably much safer to use a second NIC.  I would guess that
> the packet 10.73.219.156:8080 arrives at the Linux box (can be verified
> with Ethereal (www.ethereal.com)), is properly DNAT'd to 10.73.219.77:80
> and then passed to the routing subsystem.  The routing subsystem looks
> at the packet and sees that it lives on the same network as itself
> (10.73.219.x) and thus does not forward the packet (can be verified by
> putting a log rule at the beginning of both the INPUT and FORWARD chains
> - my guess is it never arrives at the FORWARD chain).  Unless the Linux
> box and the 2nd WebServer live on separate networks, routing will not
> forward a packet from one to the other.

That's correct, exactly what I though. There's no forwarding because we
are using the same subnet

> In other words, you are bridging rather than routing and thus need to
> make a layer two decision rather than a layer three decision.  I
> understand there is bridging functionality available in Linux but I have
> never used it and do not know where to find it.

Anyone could help? the thing is that, this second webserver is using and
aplication that we use internally and, what I'm trying to do here is,
access the web configuration service from the outside using our existing
server, which is the only one nat'ed', so our other offices can access it.
Since the second server is a production server, there's no way we can
change it's IP and use a subnet.

> However, I would suggest a separate NIC and a true DMZ.  I assume that
> if someone within the ISP cloud attempted to attack 10.73.219.77 by
> addressing it directly, there would be nothing to stop them.
> Thepackets would be forwarded from the ISP router to the 2nd WebServer. 
 > I would always set it up behind the firewall even though it uses an
RFC
> 1918 address unless you have the utmost trust in both the ISP and all
> users attached to their cloud.  Hope this helps - John

Well, that's a risk we are willing to take, and our application has the
latest patches and all that stuff to make it as secure as we can...

Any other suggestions from anyone??
John, Thanx a lot for your help and your time, I really apreciate it.

Juan


