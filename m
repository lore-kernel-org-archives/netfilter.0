From: Jason Liao <maillist@Gallantry.com>
Subject: How to change a packet's arriving interface
Date: Wed, 04 Dec 2002 10:48:51 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DEE4E13.D72148E@Gallantry.com>
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

Hi,

I have a firewall running iptables with 3 interfaces: LAN, WAN and DMZ. 
The LAN IP address is 10.0.0.1/24, WAN 66.134.34.157/28, and DMZ
66.134.34.249/28.  The WAN interface connects to the Internet and the
DMZ interface connects to a stub network.

When someone sends a packet to the IP address of the DMZ interface from
the Internet, the packet x.x.x.x->66.134.34.249 arrives at the WAN
interface.  I want to know if there is a way using iptables (maybe with
other tools such as iproute2) to make this packet to appear as if it
arrives at the DMZ interface.  The packet itself should not be
modified.  I looked at the mangle table but could not figure out if it
is the right direction.

Thanks in advance.

Jason Liao

