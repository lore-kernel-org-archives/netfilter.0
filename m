From: "Aldo Lagana" <alagana@discmail.com>
Subject: RE: iptables PPTP p-o-m patch info
Date: Mon, 24 Mar 2003 16:42:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2f24e$4508ca10$6d64a8c0@discmail.com>
References: <20030324202350.GG8391@netinertia.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030324202350.GG8391@netinertia.co.uk>
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
To: 'James O'Gorman' <james@netinertia.co.uk>, netfilter@lists.netfilter.org

the pptp-conntrack patch from p-o-m works wonderfully for me - clients
on private addresses (192.168.x.x for me) can use their windows (ew!)
VPN connections they've setup to connect (just as NAT clients through my
iptables & patched gateway) to PPTP servers out on the Internet.  So
yes, they are getting NATted, but the PPTP sessions still work - that is
the whole reason for the patch!

If this is what you need, then that is the patch that will work for you.
The problem I see is the Checkpoint VPN - is that a 100% PPTP VPN
server?  Because the pptp patch will not work for IPSec or other
non-PPTP VPNs.


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> James O'Gorman
> Sent: Monday, March 24, 2003 3:24 PM
> To: netfilter@lists.netfilter.org
> Subject: iptables PPTP p-o-m patch info
> 
> 
> Hi,
> 
> I'm after a bit more info on this patch, as there doesn't 
> seem to be much mentioned about it on the netfilter.org site, 
> or in the p-o-m help. I've got an ADSL connection with a 
> single static IP, and we're thinking about having a linux box 
> using iptables to NAT the connection to the internal LAN.
> 
> One of the computers on the LAN uses Check Point VPN-1 
> SecuRemote to connect to a corporate network, but with our 
> current setup (using a ZyXEL Prestige ADSL router) this isn't 
> possible - the user has to unplug the router and use the USB 
> ADSL modem plugged directly into his PC, meaning the rest of 
> the network loses the Internet connection, which, obviously 
> is inconvenient. We think this fails to work because of the 
> router re-writing the packet headers, and the VPN software 
> not liking this (it's a security risk).
> 
> Does the PPTP patch for iptables allow this to work properly? 
> ie, if 192.168.0.1 was the internet gateway (ppp0 for 
> Internet and eth0 for
> LAN) and 192.168.0.4 needed to use VPN using 0.1 as the 
> gateway instead of unplugging the gateway from the ADSL, 
> would this work, or would it fail, for the same reasons it 
> failed using the ZyXEL router?
> 
> Thanks,
> 
> James
> 
> -- 
> James O'Gorman
> email: james@netinertia.co.uk | web: www.netinertia.co.uk
> What is food to one, is to others bitter poison.
> 		-- Titus Lucretius Carus
> 


