From: "Vernon A. Fort" <vfort@provident-solutions.com>
Subject: IP Nat or forward
Date: Wed, 06 Apr 2005 13:15:08 -0500
Message-ID: <4254272C.3060706@provident-solutions.com>
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

I need to NAT a VLAN or aliased interface to an internal address:

    192.168.90.1   ->   192.168.1.1

Basically a virtual network/address mapping.  The main reason is I need 
a IPSEC tunnel (openswan) connecting from a vender to an internal server 
but the ip address of our internal server is already used on their end.  
So, when they connect to 192.168.90.1, its redirected/forwarded/nat'd to 
the real internal address.

Can someone get me started.

Vernon

