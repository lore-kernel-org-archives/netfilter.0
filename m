From: Jason Opperisano <opie@817west.com>
Subject: Re: Prevent traceroutes
Date: Fri, 20 May 2005 11:20:21 -0400
Message-ID: <20050520152021.GA11737@bender.817west.com>
References: <fad9d484050519150730dbc53d@mail.gmail.com>
	<20050519232314.GA9369@bender.817west.com>
	<20050519233347.GA9462@bender.817west.com>
	<428D8638.4040301@riverviewtech.net>
	<428D954E.1010105@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <428D954E.1010105@riverviewtech.net>
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

On Fri, May 20, 2005 at 02:44:14AM -0500, Taylor, Grant wrote:
> I just figured it out and have tested it.  I *think* the reason that my 
> first script did not work for the first router is b/c the raw routing code 
> will send the ICMP TTL time exceeded message before any of the chains in 
> the filter table have a chance to process the packet.  Hens my using the 
> nat:PREROUTING chain.  I have also made the filtering process easier too as 
> you do not have to filter in the filter:INPUT and filter:FORWARD chains, 
> just the nat:PREROUTING now.
> 
> iptables -t nat -A PREROUTING -i $LAN -p udp -m recent --name 
> Drop_Traceroute --update --seconds 200 --rdest -j DROP
> iptables -t nat -A PREROUTING -i $LAN -p udp -m recent --name 
> Drop_Traceroute --set --rdest -m ttl --ttl-eq 1 -j DROP
> iptables -t nat -A PREROUTING -i $LAN -p icmp -m recent --name 
> Drop_Traceroute --update --seconds 200 --rdest -j DROP
> iptables -t nat -A PREROUTING -i $LAN -p icmp -m recent --name 
> Drop_Traceroute --set --rdest -m ttl --ttl-eq 1 -j DROP
> 
> This will prevent any traceroutes via the methods mentioned before from any 
> computer coming in on interface $LAN.

please do this in -t mangle PREROUTING and not -t nat.  filtering in
-t nat is poor form, and i know lots of people are probably emulating
your scripts.

-j

--
"Kevin: Dad, the fish got away.
 Joe Swanson: The hell it did. You get in there and you kick that
 fish's ass."
        --Family Guy

