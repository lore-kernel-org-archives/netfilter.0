From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: HAlinux,ipsec and proxies..
Date: Thu, 7 Aug 2003 19:07:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030807230703.GB24623@cannon.eng.us.uu.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0192E0@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0192E0@wardrive.citadelcomputer.com.au>
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
Content-Transfer-Encoding: 7bit
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: Ramin Dousti <ramin@cannon.eng.us.uu.net>, "Netfilter Mailling List (E-mail)" <netfilter@lists.netfilter.org>

On Fri, Aug 08, 2003 at 09:01:02AM +1000, George Vieira wrote:

> I need to be able to remove the external IP from the nic the minute firewallA fails so firewallB takes it and applies it to the external NIC.
> Not sure how vlan works and if it's anything like IPSEC using a ipsec0 interfaces etc...

You apply a patch (if your kernel doesn't support it) and the run vconfig...
Very easy... But it seems you even don't need that (see below).

> 
> So the external IP has to be a secondary to the nic otherwise there will be no IPs on the interface and HA has nothing to ping to test.

What needs to ping what? Why don't you just use VRRP? and propagate the
exit point through a routing protocol (OSPF)?? Easy and automagic with no
manual intervention...

Ramin

> It's hard trying stuff out because these FW are both live and testing is a pain (VPNs running almost constantly too)..

