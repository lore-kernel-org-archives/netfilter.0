From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: Help with Access Point firewalling
Date: Wed, 18 Aug 2004 06:03:17 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040818060317.322ec47e@mgalepc.utilitran.com>
References: <41234202.6040903@4Dllc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41234202.6040903@4Dllc.com>
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

	I have never used a wireless interface yet but as long as you have ip_forwarding enabled it should forward the packets
across the interfaces, the clients must be setup to route packets to the wireless interface either by a default route or
a routing table entry. 

If you want the packets to be MASQUERADE that should be as simple as adding a rule for packets leaving the interface.

Michael.


On Wed, 18 Aug 2004 13:48:18 +0200
Steve Comfort <steve@4Dllc.com> wrote:

> Hi all,
> 
> I'm working on an embedded scenario that has got me a bit stumped, and 
> thought maybe one of the guru's here could help out.
> 
> The device is based around an IXP processor and has an ethernet and a 
> wireless interface. When the wireless interface is configured as managed 
> (ie its a client) I have no problem and am happily using a modification 
> of Oskar Andreaason's firewall script to do the firewalling. Everything 
> works fine.
> 
> However, what should I be doing if the device is configured as an Access 
> Point? I figured I need to allow in NEW TCP connections, but don't know 
> whether I will be able to use iptables to masquerading between the wlan 
> port and the eth port, (ie will the MASQUERADE target forward packets 
> received on the WLAN to the ETH interface ?) or whether I will have to 
> add a bridge and use ebtables?
> 
> Any advice would be appreciated!
> 
> Best regards
> Steve
> 
> 
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

