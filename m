From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: simply confusing
Date: Thu, 23 Jan 2003 15:31:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c2c31e$78424780$3864a8c0@discmail.com>
References: <20030123200314.99399.qmail@web11401.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030123200314.99399.qmail@web11401.mail.yahoo.com>
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
To: 'Ralph Churchill' <mrchucho@yahoo.com>, netfilter@lists.netfilter.org

that is a bit vague...for instance if the clients' gateways are other
boxes/routers/firewalls, and your attacked client is on the same LAN as
the attackers, then your little firewall will do little to filter those
packets.   What's your infrastructure?  In other words, does your
'attacked' client reside on a separate NIC off the little firewall and
you are forwarding to it?  if so, you need to filter on the FORWARD
chain, etc.

to make a sound and viable isolated network off of a firewall, it should
reside on it's own NIC and the firewall will filter packets as they get
passed from NIC to NIC or Network to Network.

check out the Iptables tutorial for more info:
http://iptables-tutorial.haringstad.com/iptables-tutorial.html

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Ralph Churchill
> Sent: Thursday, January 23, 2003 3:03 PM
> To: netfilter@lists.netfilter.org
> Subject: simply confusing
> 
> 
> I work at a large company and was having some fellow
> employees regularly scanning my box... so I put up a
> little firewall. Here's my one and only rule:
> 
> iptables -A INPUT --source 192.168.0.0/16 -j DROP
> 
> Now, shouldn't that block any and ALL traffic from any
> computer on the 192.168.*.* subnet? Do I need to be
> more explicit? I also have snort running and I see
> some stuff getting through... Thanks.
> 
> RMC
> 
> __________________________________________________
> Do you Yahoo!?
> Yahoo! Mail Plus - Powerful. Affordable. Sign up now. 
http://mailplus.yahoo.com


