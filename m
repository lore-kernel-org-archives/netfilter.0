From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Transparent Remote Proxy Server
Date: Mon, 27 Sep 2004 14:30:02 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41586A3A.5060901@pbl.ca>
References: <666183F7-0DA7-11D9-99BA-000A95C71776@freezone.co.uk>	<41546F23.2010601@pbl.ca>
	<9B51275E-10B2-11D9-9099-0003931DA24A@freezone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9B51275E-10B2-11D9-9099-0003931DA24A@freezone.co.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

ms419@freezone.co.uk wrote:
> Thank you sincerely for your suggestion! You are correct: It is simpler 
> to use DNAT & MASQUERADE. I tried it & it works. But now, I am trying to 
> avoid using NAT.
> 
> The problem with NAT (as I understand it) is it rewrites the destination 
> address, which breaks HTTP/1.0 requests without a Host: header. By using 
> policy routing, I hope to route traffic through wum without rewriting 
> the destination address.
> 
> I'm using as my guide the Transparent Proxy HOWTO by Daniel Kiracofe.

As Jason wrote, REDIRECT will also rewrite destination IP address. 
Squid is using woodoo magic to find out what was the original 
destination address before rewriting (that's why you need to also change 
Squid configuration).  Squid can do that only if it runs on the same box 
where the address was rewritten.  Even the woodoo magic has limitations ;-)

Daniel's document is using nat table for both filtering and NATing, 
which is the approach I don't particulary like.  Plus the rules are very 
open (made to demonstrate the concept, not to be used on a real firewall).

Anyhow, what you might try out is a bit of debugging to see what is 
going on the wire.  Your tcpdump from wum shows that it got SYN packet, 
and that it sent out SYN ACK.  I don't see third packet with ACK going 
back to wum, so it might be that it got dropped somewhere.  My next step 
would be to move to tor.  I'd guess if you run tcpdump on tor's 
interface to internal network, you'd see only SYN packet, and not SYN 
ACK.  And if you run it on interface wheer wum is connected that you 
would see both SYN and SYN ACK.  If that is the case, than you might 
have something else on tor that is causing it to drop return packets 
from wum.  As usual, without having an insight into your entire rule 
set, it might be hard to tell why (something like output of iptables-save).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

