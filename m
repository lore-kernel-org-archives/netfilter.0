From: "Vann H. Walke" <walkev@presearch.com>
Subject: NAT of entire subnets
Date: 23 May 2003 10:28:47 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053700127.13108.39.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I'm working on a project building training simulators for the US Navy. 
The full deployment will consist of 10 simulators each of which
containing approximately 500 computers.  As we ramp up the
development/production at any given time we will have 2 to 3 systems on
site.

The only sane way of developing the network for the systems is to make
them as identical as possible.  Thus the software layout can exactly the
same on each system.  

While in development, we require the ability to connect to each system
from our internal LAN.  

One possibility would be to do simple NAT to one external IP address.  
Each training system would have one external IP through which it could
be accessed.  This works fine when you are inside the system (NAT to
outside is seamless), but isn't quite as elegant from outside. 
Accessing a given computer from our general LAN would require first
accessing a single entry point and then connecting to the desired
machine.

What I would like to do is NAT an entire domain.  So that the addresses
would be mangled to access individual machines.  Some examples of
possible conversions

Connecting to           Actually Connects to
-------------           --------------------
10.2.5.20               192.168.5.20  (in the second trainer)
10.1.3.5                192.168.3.5   (in the first trainer)
10.1.6.6                192.168.6.6   (in the first trainer)
10.2.6.6                192.168.6.6   (in the second trainer)

In this way the internal software and maintenance procedures could be
identical, but developers could easily access any system in the network.

Can iptables provide this functionality?  If so, how would one configure
it?  Are there any inherent problems/pitfalls in such a scheme?   Would
a dedicated router have this feature?  Any recommendations on using a
linux box vs. a purpose built router?

Thanks greatly,
Vann



