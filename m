From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Prevent traceroutes
Date: Fri, 20 May 2005 02:44:14 -0500
Message-ID: <428D954E.1010105@riverviewtech.net>
References: <fad9d484050519150730dbc53d@mail.gmail.com>	<20050519232314.GA9369@bender.817west.com>
	<20050519233347.GA9462@bender.817west.com>
	<428D8638.4040301@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <428D8638.4040301@riverviewtech.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> iptables -t filter -A DROP_TRACE -o eth0 -p udp -m recent --name Drop_Traceroute --update --seconds 200 --rdest -j DROP
> iptables -t filter -A DROP_TRACE -o eth0 -p udp -m recent --name Drop_Traceroute --set --rdest -m ttl --ttl-eq 1 -j DROP
> iptables -t filter -A DROP_TRACE -o eth0 -p icmp -m recent --name Drop_Traceroute --update --seconds 200 --rdest -j DROP
> iptables -t filter -A DROP_TRACE -o eth0 -p icmp -m recent --name Drop_Traceroute --set --rdest -m ttl --ttl-eq 1 -j DROP
> 
> The only thing that I have not figured out as of yet how to do is DROP 
> the first packet that the firewall sees as every attempt that I made, 
> even a DROP policy on the FORWARD and OUTPUT chain, did not block the 
> first "TTL Time Exceeded" response.

I just figured it out and have tested it.  I *think* the reason that my first script did not work for the first router is b/c the raw routing code will send the ICMP TTL time exceeded message before any of the chains in the filter table have a chance to process the packet.  Hens my using the nat:PREROUTING chain.  I have also made the filtering process easier too as you do not have to filter in the filter:INPUT and filter:FORWARD chains, just the nat:PREROUTING now.

iptables -t nat -A PREROUTING -i $LAN -p udp -m recent --name Drop_Traceroute --update --seconds 200 --rdest -j DROP
iptables -t nat -A PREROUTING -i $LAN -p udp -m recent --name Drop_Traceroute --set --rdest -m ttl --ttl-eq 1 -j DROP
iptables -t nat -A PREROUTING -i $LAN -p icmp -m recent --name Drop_Traceroute --update --seconds 200 --rdest -j DROP
iptables -t nat -A PREROUTING -i $LAN -p icmp -m recent --name Drop_Traceroute --set --rdest -m ttl --ttl-eq 1 -j DROP

This will prevent any traceroutes via the methods mentioned before from any computer coming in on interface $LAN.



Grant. . . .

