From: Jason Opperisano <opie@817west.com>
Subject: Re: will port forwarding work here?
Date: Fri, 14 Jan 2005 10:55:49 -0500
Message-ID: <20050114155549.GA26172@bender.817west.com>
References: <20050114153508.GA1189@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050114153508.GA1189@tranquility.scriptkitchen.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Jan 14, 2005 at 10:35:08AM -0500, Payal Rathod wrote:
> Hi,
> I have 2 squid proxy on two different machines 192.168.0.10 and 
> 192.168.0.11 All my clients are configured to use 192.168.0.10:3128
> Now I want a few specific clients to use 192.168.0.11:3128
> Is it possible to write some kind of rule on 192.168.0.10 which will 
> *properly* redirect traffic from 192.168.0.10:3128 to 
> 192.168.0.11:3128 for those clients.  A friend on chat suggested (he 
> was not sure),
> 
> iptables -A PREROUTING -t nat -s 192.168.0.10 --dport 3128 \
>  -j DNAT --to-destination 192.168.0.11
> 
> Is there anything else missing?

yeah--the same thing that everyone misses when they try and DNAT onto
the same local network:

1) client (192.168.0.100) send TCP SYN to 192.168.0.10 port 3128
2) proxyA (192.168.0.10) DNATs the packet to 192.168.0.11
3) proxyB (192.168.0.11) receives SYN from 192.168.0.100 and replies
   directly with SYN/ACK
4) client (192.168.0.100) receives SYN/ACK from 192.168.0.11 and drops
   it, as client never sent a SYN to 192.168.0.11.

sound familiar?  it feels familiar to me as i type it once again.

options:

1) for the machines that need to proxy to 192.168.0.11, just set their
   proxy to be 192.168.0.11.  no--it's not h4x0r l33t, but it's really
   what you're trying to do, and the "right" way to do it.

2) duct tape it.  on 192.168.0.10:

   # DNAT requests from some clients to 192.168.0.11
   iptables -t nat -A PREROUTING -p tcp -s $SOME_CLIENT --dport 3128 \
     -j DNAT --to-destination 192.168.0.11

   # make requests from some client look like they came from me to avoid
   # asymmetric routing of the DNAT-ed connection
   iptables -t nat -A POSTROUTING -p tcp -s $SOME_CLIENT --dport 3128 \
     -d 192.168.0.11 -j SNAT --to-source 192.168.0.10

as always--i hate this solution for all the reasons everyone has brought
up every time time this has come up previously--it's horribly
inefficient, it destroys your audit trail, etc...

-j

--
"No jury in the world is going to convict a baby ... Maybe Texas."
        --The Simpsons

