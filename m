From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: IPTables State Tracking
Date: Fri, 29 Aug 2003 20:33:39 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4FF0E3.2070709@chrisbrenton.org>
References: <0C7C6E1720E8D74FB52EBEF93649730A0116BF07@2k099exm01.compucom.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Josh.Berry@compucom.com
Cc: netfilter@lists.netfilter.org

Greetings Josh,

Josh.Berry@compucom.com wrote:
>
> Does IPTables track virtual state of ICMP and UDP packets? 

That it does.

> I know that
> UDP and ICMP are not stateful connections, but does IPTables perform
> pseudo-stateful tracking of these connections such as some other
> firewalls that basically timeout UDP/ICMP connections after a specific
> time?

ICMP gets a bit more complex than that. You can do this for things like 
Echo-requests, time request, subnet mask requests, etc. as the source 
and destination remains constant. You can also predict the transport and 
type/codes used in the response. This is referred to as traffic that is 
part of a previously "established" session.

When you get into ICMP type 3's and 11's however (host unreachables, TTL 
exceeded, etc.) you get a bit of a problem as the system transmitting 
these packets is usually _not_ the host you sent the original packet to. 
Usually its some router or firewall along the path of the connection. 
Also, the packet type to some extent is unexpected (you transmitted TCP 
or UDP and now you are getting back an ICMP packet from some 
unidentified host).

Both of these packet types store 28 bytes in the payload which 
identifies the original packet that generated the error (like the TCP or 
UDP example above). A good firewall (like iptables) can use this payload 
information to determine if the packet should be allowed through or not.

So these ICMP error packets are not part of the original session, but 
they were generated because of it. For this reason it is referred to as 
"related" traffic.

So the good news is yes, iptables will easily handle established and 
related traffic. The better news is that you have the flexibility to 
handle them independently and do what ever you want with either.

Note that when you are comparing firewalls you really have to look at 
the vendor implementation. For example there are a number of firewalls 
on the market that claim to be based on stateful inspection, and for 
some protocols they actually are, but for type 3's and 11's they fall 
back on rudimentary packet filtering (let them all in including the 
bogus ones, or none at all).

HTH,
C





