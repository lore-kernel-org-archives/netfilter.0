From: "Kevin P. Fleming" <kpfleming@starnetworks.us>
Subject: Re: [VLAN] 	Multiple subnets of the same IP space, different VLANs, 
 same box...
Date: Tue, 15 Feb 2005 11:13:30 -0700
Message-ID: <42123BCA.1080306@starnetworks.us>
References: <42122E91.2000707@joyner.ws>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <42122E91.2000707@joyner.ws>
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
To: "Linux 802.1Q VLAN" <vlan@candelatech.com>
Cc: netfilter@lists.netfilter.org, vlan@lanforge.com

Aaron S. Joyner wrote:

> Any input anyone can offer about possible solutions, or even providing 
> further insight into the problem, would be most appreciated.  :)

I don't see how you can make this work without SNAT'ing all the incoming 
traffic on each VLAN interface into a unique IP address range. In 
addition, as you already mentioned, you'll have to mess with the routing 
tables as well; you can apply a "mark" to the connections in the 
connection table for each VLAN interface, then use that to select an 
outbound routing table.

It's pretty complex; realistically, you might actually be better off 
creating virtual machines to NAT the traffic onto the "internal" network 
in the box, then hide it all from the services on that box.

Alternatively, you could buy a whole boatload of cheap NAT routers, and 
attach each one of them to a non-tagged VLAN port on your switch (one 
for each VLAN), then connect the "upstream" side of them to a 
non-VLAN-enabled switch with your Linux box on it.

Third alternative would be to do the VLAN switching with a device that 
is actually a Layer 3 router as well, that can do the NAT for you.

All of these solutions, though, involve NAT, which will bring along 
other problems if you are running applications/protocols that are not 
NAT friendly.

