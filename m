From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: port translation
Date: Wed, 05 Jan 2005 08:23:43 -0500
Message-ID: <1104931423.3684.5.camel@localhost>
References: <EINSTEINdGuysj7L2Sg00000bb4@einstein.systemmetrics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <EINSTEINdGuysj7L2Sg00000bb4@einstein.systemmetrics.com>
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
To: Richard <richard@o-matrix.org>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Tue, 2005-01-04 at 22:23 -1000, Richard wrote:
> Hi,
> 
> I am trying to work on port translation. One inside host with source port
> xxx would always have the same port yyy after nat. Even after the conntrack
> expires, I still want outside incoming packet to port yyy be able to map to
> the same host and port. This is what I did,
> 
> Assume inside 192.168.25.150:5000 maps to outside 66.1.2.3:60150 on
> interface vlan1,
> 
> # allow outside traffic to come in
> iptables -t nat -I PREROUTING -p udp -i vlan1 -d 66.1.2.3 --dport 60150 -j
> DNAT --to-destination 192.168.25.150:5000
> 
> # allow outside traffic to go through the router
> iptables -t filter -I FORWARD -p udp -i vlan1 --dport 5060 -j ACCEPT
> 
> # allow inside traffic to go out
> iptables -t nat -I POSTROUTING -p udp -s 192.168.25.150 --sport 5000 -j SNAT
> -o vlan1 --to-source 66.1.2.3:60150
> 
> Can someone please confirm that this is the right way to do it?
> 
> Also if I have multiple internal hosts, for example, one hundred host
> 192.168.25.1xy:5000 maps to 66.1.2.3:601xy, is there a quick way to do it
> instead of 100 blocks of iptables statements?
<snip>
I haven't confirmed it by trying it but it looks like it would work.  I
assume you have a rule somewhere which will allow internal stations to
initiate traffic outbound on port 5000.  This would typically be in your
FORWARD chain just like you have the rule to allow external stations to
initiate traffic.  I also assume that you really want the entire world
to be able to reach the internal device on that port.

I don't know of a way to condense the number of rules you need to do
this direct port mapping in the nat table.  You could use the iprange
patch or subnet addressing to reduce the number of rules in the FORWARD
chain.

I suppose it would be a simple matter to develop a quick bash script to
create an iptables-restore file and load the rules that way rather than
manually entering each.
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


