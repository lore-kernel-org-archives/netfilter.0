From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Newbie request
Date: Tue, 12 Dec 2006 20:37:29 -0600
Message-ID: <457F6769.8030705@riverviewtech.net>
References: <457E5B99.7050005@gmail.com>	<1153.193.173.119.247.1165912318.squirrel@webmail.sterenborg.info>	<457E88D1.8020100@plouf.fr.eu.org>
	<1267.193.173.119.247.1165921850.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1267.193.173.119.247.1165921850.squirrel@webmail.sterenborg.info>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 12/12/06 05:10, Rob Sterenborg wrote:
> Yes, I was assuming that the default gateway is set to the router's IP, but in
> fact we don't know about the connection to the internet which is there
> somewhere.

No, we do not know about the gateway.  However, recall from the OP that 
"eth1 is set to DHCP and is part of 192.168.0.0/24", which means that 
the route back to the 192.168.1.0/24 network could change as the 
""router in question reboots.  So, either the routers are running some 
sort of routing protocol, or the 192.168.1.0/24 network needs to be 
""hidden from the 192.168.0.0/24 network.  This is very easily 
accomplished with SNAT / MASQUERADE.

Something to keep in mind is that the source IP is a dynamic IP on the 
192.168.0.0/24 network, so it would be better if MASQUERADE was used 
verses SNAT.  SNAT does not clear out stale nat translations like 
MASQUERADE does when the IP for the interface changes.



Grant. . . .

