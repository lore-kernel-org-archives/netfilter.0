From: Matthew Pocock <matthew.pocock@ncl.ac.uk>
Subject: bootpc
Date: Thu, 05 Jun 2003 12:53:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EDF2F41.8080505@ncl.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I've set up my bridge+firewall, and everything is hunkeydory. I am doing 
statefull filtering. I let all traffic out, and all related/established 
traffic in. Then, I only allow new icmp & tcp:ssh connections in.

To get windows 95 & 98 PCs on the inside to boot & join the network, I 
had to open up udp ports bootps & bootpc for new connections 
orriginating from the outside. I don't know the finer details about how 
these protocols work, but presumably they are connecting to the booting 
PC in response to some DHCP request it has made. Is there some module I 
should have loaded that would flag these connections as RELATED to some 
outgoing connection? Have I done something silly? Is this even possible?

Thanks,

Matthew


