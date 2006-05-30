From: Vinod Chandran <vinod_chandran@multitech.co.in>
Subject: Problems with Routing and masquerading
Date: Tue, 30 May 2006 20:04:16 +0530
Message-ID: <447C57E8.3050005@multitech.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi,

I have a linux box which balances load between two interfaces ( say WAN1 
and WAN2). I have masquerading on for any request coming from LAN to the 
outside world.

The setup is in such a way that WAN1 drops packets with source ip 
belonging to WAN2's network and viceversa.
For some strange reason, I find that packet coming out from the WAN 
interface has source address of WAN2 and thereby getting dropped.

When I check the route cache , I find that for the same source and 
destination, I have two route cache entries

192.168.52.66   192.168.26.73   192.168.19.76         0      0        0 
eth1
192.168.52.66   192.168.26.73   192.168.20.25   i     0      0       23 
eth2

Here 192.168.19.76 is the WAN1 gateway and 192.168.20.25 is WAN2 
gateway, as we see the packets are going out through WAN2 , but the 
masquerading has happened to the WAN1 IP address.

It seems to me that the root of the problem is the creation of the two 
cache entries. Any idea why this happens, and how it can be avoided.

Thanks and Regards,
Vinod C


