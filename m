From: Blizzards <blizzards@libero.it>
Subject: HOW TRAVERSING CHAIN IN SNAT/DNAT
Date: Fri, 06 Dec 2002 10:06:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF06888.10403@libero.it>
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

Hi list!

My question is:


I need to filter packet coming from eth1 (external lan) directed to eth0 
(internal lan).
Packet for internal lan must be SNAT to reach external lan.
In this enviroment filter table see packets traversing FORWARD chain as 
normal source and destination and i let it pass.
SNAT change source address with nat address indicated (3 ip address 
configured on the box as alias of eth1) and then send packets.
When packets return as reply to my natted connection, the chain/chains 
involved are:

only input ?
input and forward ?
only forward?

Someone can explain me this in detail?

Bye.
Giulius


