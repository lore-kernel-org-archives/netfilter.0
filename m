From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: relocating packets
Date: Thu, 13 Oct 2005 23:53:41 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510132350390.22615@filer.marasystems.com>
References: <434E2DFD.8030909@ufl.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <434E2DFD.8030909@ufl.edu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Mark Oden <cerberus@ufl.edu>
Cc: netfilter@lists.netfilter.org

On Thu, 13 Oct 2005, Mark Oden wrote:

> Assuming I had two NICs in my machine that happen to be on the same network, 
> is there a way to force packets of certain ports to use only one NIC or IP?

If you have multiple NICs in the same Ethernet broadcast segment then I 
would recommend you to enable "arp_ignore".

    echo 1 >/proc/sys/net/ipv4/conf/all/arp_ignore

If not things will get very confusing with traffic "randomly" coming in on 
either interface.

Once this is done you can firewall each NIC separately as you please, 
policy routing, marking etc to control how the interfaces are used.

Regards
Henrik

