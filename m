From: Simone Leggio <simone.leggio@cs.helsinki.fi>
Subject: IP TOS based routing
Date: Tue, 25 Mar 2003 10:51:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E80187B.5030209@cs.helsinki.fi>
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

Hi all,

I have to send prioritised traffic from host A to host B.

The priority 1 is identified by an IP TOS value of, say 46.
The priority 2 is identified by an IP TOS value of, say 26.

In my network topology, there are two possible routes from host A to 
host B, one through host A's network interface eth0 and the other one 
through eth1.

I'd like to know whether it is possible, and if so how, with traffic 
control to set filters so that packets with TOS 46 are sent to host B 
via eth0 and packets with TOS 26 via eth1.

Note that the destination address for all the packets is the same, what 
I need is just to route through different interfaces to the same 
destination.

Thank you.

     Simone.



