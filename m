From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Routing Question
Date: 07 May 2003 13:28:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052328525.25094.202.camel@alpha.newkirk.us>
References: <005901c314b8$249d6a60$7035a8c0@hoeschen>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005901c314b8$249d6a60$7035a8c0@hoeschen>
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
To: Chris Hoeschen <chris.hoeschen@primevest.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2003-05-07 at 12:46, Chris Hoeschen wrote:
> I am wondering if it is possible to route from one host to another
> host.  An example would be if I wanted to route all traffic on port 80
> to another complete different IP address on the internet (like
> google.com.)
>  
> My goal is to reroute traffic coming in to one host to a different
> host without having to give out the IP address of the second host.  If
> I just change the DNS the IP address would be known to the person
> accessing the site.

If you, for example, wanted all connections to 10.10.10.1:80 to be
'rerouted' to actually connect to google.com, you'd use:

iptables -t nat -A PREROUTING -d 10.10.10.1 -p tcp --dport 80 -j DNAT
--to 216.239.35.100

This presumes that the connection in question would be allowed through
FORWARD, and that it is not to another local resource.  If you are using
DNAT and the new destination has a route back to the client that doesn't
pass through your firewall box, you need to also add:

iptables -t nat -A POSTROUTING -d 216.239.35.100 -p tcp --dport 80 -j
SNAT --to a.b.c.d

Where a.b.c.d is the IP of the interface the DNATted traffic passes out
through.  (IE, ppp0)  This way the reply traffic is forced to come back
through the DNATting box, which will reverse both the SNAT and the DNAT,
so that the client sees the reply from the expected 10.10.10.1.

j
 

> -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> | Chris Hoeschen - Distributed System Analysts        |
> | PrimeVest Financial Services                        |
> | (320) 656-4035 E-Mail: chris.hoeschen@primevest.com |
> -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> "Only two things are infinite, the universe and human stupidity, and I'm not sure about the former." 
>   -- Albert Einstein
> Hippopotomonstrosesquippedaliophobia is the fear of long words
>  


