From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Port forwarding or NAT?
Date: Tue, 14 Sep 2004 19:18:22 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040914171822.956213FD5@sterenborg.info>
References: <01ef01c49a5f$51824900$6300a8c0@93egeater>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <01ef01c49a5f$51824900$6300a8c0@93egeater>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

netfilter-bounces@lists.netfilter.org wrote:
> I have one crazy machine at our home office that must
> communicate on port 6847 to an outside company.  This one
> machine went through our old proxy server until it died last
> week.  We're using IPTABLES through
> rc.firewall-2.4 on a Linux proxy, but it doesn't seem to be
> allowing this communication to occur.
> 
> Would this be handled through port forwarding or NAT?  I was
> under the impression that our firewall was set up to allow
> all traffic, initated from the LAN, through.  This apparently isn't
> the case, however. 

From inside (LAN) to outside (internet or something) = SNAT/MASQUERADE.
From outside to inside = DNAT (port forwarding).
In case of a proxy you'd probably be using Squid, and I doubt Squid will
let you communicate on port 6847.

I'm not familiar with the script so I can't say what's wrong.


Gr,
Rob


