From: ken scott <kscott9@triad.rr.com>
Subject: Re: Transparent proxy single machine question
Date: Sat, 26 Jun 2004 18:09:55 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088287795.4717.12.camel@Kenslinux>
References: <40DDE99C.7060001@triad.rr.com>  <40DDEFEC.5000205@bofh.bg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40DDEFEC.5000205@bofh.bg>
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
To: Dimitar Katerinski <train@bofh.bg>
Cc: netfilter@lists.netfilter.org

On Sat, 2004-06-26 at 17:51, Dimitar Katerinski wrote:

> 
> Hello ken,
> 
> Yes, on single machine it will work with no problems. You should specify 
> an incoming interface for the above iptables rule though. Do it like this:
> 
> iptables -t nat -A PREROUTING -i $LAN_IFACE -p tcp --dport 80 -j 
> REDIRECT --to-ports 8181
> 
> where $LAN_IFACE is the interface connected to your internal network.
> 
I only have a single network card/interface on this box (eth0 , I guess)
Does that matter in this proxy context? 

> And the scheme is as follows:
> 1. A client sends request for specific page
> 2. The linux box sees its a request for destination port 80 and 
> redirects it to port 8181 where DG is listening.
> 3. DG takes the request, do what it does (content filtering, etc.), and 
> sends it to Squid.
> 4. Squid request the specific page, and gives it back to DG, which again 
> do what it does.
> 5. DG then, if everything is ok, server the request page to the client.
> 
> 
> About your question:
>  > ..when squid finally wants to send
>  > out the actual
>  > request to the internet, isn't that a port 80 request that the above
>  > iptables rule will
>  > redirect back to Dansguardian??
> 
> No basicly it won't. Unless you dont have same rule in the OUTPUT chain 
> of the nat table. the PREROUTING chain applies to packets which hit the 
> box coming from somewhere outside, and not packets which origin from the 
> machine itself.
Dimitar,
Your explanation here is great but it throws me a bit since the packet
requests coming from the browsers will all be internal requests (ie on
the same machine) so is a PREROUTING rule the right choice?  In other
words I want to apply a routing rule to internal requests (except those
from squid).
I appreciate your detailed response and I have looked for a "life of a
packet" explanation such as you provided but have not found it as yet. 
In your 5-step explanation, when are the iptables rules applied?
Thanks
Ken 


