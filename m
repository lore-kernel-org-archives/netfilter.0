From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: protocol 50 unreachable
Date: Wed, 01 Dec 2004 23:09:25 -0500
Message-ID: <1101960564.2032.121.camel@localhost>
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
To: Helge Weissig <helgew@grajagan.org>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wed, 2004-12-01 at 23:00, Helge Weissig wrote:
> On Wed, 1 Dec 2004 at 22:46 -0500, Jason Opperisano wrote:
> 
> JO> > no such luck :(. I should note that the VPN connections works fine when I 
> JO> > hook the client up directly to my DSL line. btw - it looks like your 
> JO> > script does not forward anything from one of my interfaces to the other.
> JO> 
> JO> yeah--precisely.  you seem obsessed with the desire to "port forward"
> JO> esp traffic to your VPN client, which is absolutely not necessary.
> JO> 
> JO> look into configuring NAT-T with your VPN client, sometimes called "UDP
> JO> Encapsulation" as your VPN server appears unwilling to accept esp
> JO> packets that have traversed an intermediate NAT device.
> 
> hmm... how does a packet know it needs to go from my external NIC to my 
> internal NIC if it comes through ESP? Maybe I am confused here... 
> 
> let's leave the VPN client/server out of the picture to simplify. If I 
> send an ESP packet from somewhere to my external IP address I get the 
> "protocol 50 unreachable" ICMP response. The underlying problem seems to 
> be the primary cause of my troubles, no?
> 
> h.
Yes, you should be able to get this to work as long as there is only one
station behind the NAT gateway using IPSec.  NAT traversal is a valid
way to go and the only way to go if you have more than one IPSec client
using the same public address.  I do assume that the NAT gateway is not
running IPSec.

To use NAT traversal, you would forward the appropriate UDP port
(typically 4500 or 500) rather than ip/50.

I do not know why your NAT gateway is refusing to pass the IPSec
packets.  That's why I suggest logging in my previous e-mail is
clarifying the DNAT interface does not work.  Good luck - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


