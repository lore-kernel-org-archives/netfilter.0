From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Need help on NAT
Date: Tue, 10 Feb 2004 05:55:56 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076410556.2020.11.camel@ca.gts.nexusmgmt.com>
References: <002401c3ebb8$4d7ccc00$f301a8c0@Zamani>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002401c3ebb8$4d7ccc00$f301a8c0@Zamani>
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
To: Saeed Zamani <szamani@tavanesh.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-02-05 at 02:18, Saeed Zamani wrote:
> Hi all,
>    I am new to list and have a basic nat question on Redhat Linux 9. I
> have to translate my local IP ( 192.168.1.0/24 ) to two different public
> IP given by two different ISP ( IPE1 & IPE2 ) at a specified rate. For
> example for every 4 received packet, one have to translate to IPE1 and
> other three to IPE2. I need this for load balacing the internet traffic
> between two isp. At the end, it is excellent if there is an option that
> If one the ISP gateway is dead, all packets have to translate to other
> public IP. Please help me. 
> Thanks, 
> Saeed Zamani, 
> Technical Manager, 
> Concept FZ LLC. 

I see that no one has yet responded to your query so I'll try but please
be aware that I am not an expert on iptables internals nor have I ever
tried this before.

You may have a problem of handling exactly four packets and then
switching if you are using connection tracking (which one almost always
wants to use when possible).  I do not know the internals but I would
think that once it establishes a data flow, all packets in that flow
will go out over the same interface.

I do not know if there is someway to use an application in conjunction
with iptables that can grab the outbound packets and redistribute them
across the interfaces.  Perhaps iproute2 can but I would be surprised as
I would assume its job is finished before packets hit the postrouting
netfilter hooks.

If you do not need to be exact, maybe you could do something with the
limit matches where the first four packets are directed to one chain
where one NATs them to one address and the next three jump to a chain
that NATs them to the second address.  I rarely use the limit match so
I'm not intimately aware of its capabilities.

I'm not sure how one would dynamically alter those rules in the event
one ISP fails.  Perhaps some script can be created that checks for
availability, if it finds a link down, changes the rules.

It may be easier to take a non-iptables approach if you do not need
exact balancing.  If there are multiple subnets passing through the
firewall, one could always send the traffic from some through one
interface and traffic from the others to the other interface.

Again, I've not tried any of this (other than the last approach) and
have my doubts but good luck with it - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


