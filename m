From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Proto 41 filtering and processing...
Date: Tue, 14 Sep 2004 18:19:30 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409141819.30436.Alistair@nerdnet.ca>
References: <20040913174539.GA17190@alcove.wittsend.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040913174539.GA17190@alcove.wittsend.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On September 13, 2004 01:45 pm, Michael H. Warfield wrote:
> Hey all,
>
> 	I've got some questions and some observations viv-a-vis proto 41
> filtering (that "named" ipv6 but, what it really is, is 6over4 in the
> IPv4 tables).  These are problems where IPv4 and IPv6 interreact or
> interoperate and some recognition of both layers simultaniously is
> required.
>
> 	There are cases where, in handling protocol 41 traffic, I want
> to respond with IPv4 errors codes.  For instance, if I receive 6to4
> traffic (protocol 41 traffic with IPv6 addresses in the 2002::/16
> range) from an IPv6 range I don't want to talk to, I want to send back
> and IPv4 ICMP protocol unreachable (indicating that I'm not going to
> talk protocol 41 with him - think scanners).  To generate the IPv4 ICMP
> unreachable error, this needs to be done in the IPv4 tables, correct?
> But to select out the packets, I need to examine the IPv6 addresses in
> the next header up.  So it's examination of the IPv6 information in the
> 6over4 protocol (proto 41) by the IPv4 iptables.

	Okay -- as I understand things in this neck of the woods, protocol 41 is the 
IPv4 tunnel into which we have stuffed the IPv6 packets.  Since this is a 
tunnel, there should be an endpoint to the tunnel.  I have my firewall setup:

iptables -I INPUT 7 -p 41 -s {ip(v4) of tunnel provider} -d {ip(v4) of  \ 
firewall} -j ACCEPT

(I also have a reciprocal rule in output to limit where I will let protocol 41 
go out to )

I suppose you could:

iptables (-I -A) INPUT (rulenum?) -p 41 -s 0/0 -d {ip(v4) of firewall} -j  \ 
REJECT --reject-with icmp-host-unreachable

so long as that rule *followed* the ACCEPT rule from your provider.
I have a default DROP policy on INPUT and OUTPUT and FORWARD.  The firewall 
does the tunnelling and ip6tables kicks in after the tunnel comes up.


>
> 	Any thoughts on the best way to accomplish this?
>
> 	Second problem...
>
> 	Someone issues a proto 41 packet addressed to me but it doesn't
> come FROM any source address I recognize in any of my SIT tunnels.  So,
> it shows up as proto 41 in the IPv4 tables (does it?).  

	Yes indeedy it does.  I drop about 5 packets a day -- on a simple home router 
on a DSL net.  I *believe* that these are likely from misconfigured *cough* 
winboxen that have IPV6 pointed out the door and are looking for a tunnel. 
*sigh* thanks MS.

> Does it show up 
> at all in any of the IPv6 tables?  If so, what input device?  If not, how
> is the error generated?  Is it an IPv6 error from one of the IPv6 addresses
> or is it an IPv4 error?  Thoughts on that?
	
	Unless you have the tunnel setup to the other end you will NOT see the ipv6 
data, since the standard TCP stack will not unwrap the packet without the 
tunnel code in place, so no it will NOT show up in ip6tables at this point.

	I suppose that if you are leaking your ipv4 address into ipv6 packets 
(application layer perhaps?) the remote ipv6 enabled hosts could well be 
trying to talk back to you on ipv4 direct -- but those packets should be ipv4 
packets OTHER than protocol 41.  I just accept that there are skiddidiots out 
there and poorly configured systems, and drop the packets. 


	(please note that ipv6 is not my strong suit, someone else out there might 
have more details ....  and .. please read the sample rules carefully and 
check syntax .. I may not be perfect today)
	
	Alistair Tonner
>
> 	Mike

