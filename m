From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: PPTP through iptables FW...
Date: Tue, 2 Jul 2002 08:11:03 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA1C4@JUPITER>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'Aldo S. Lagana'" <alagana@discmail.com>, 'Rowan Reid' <rreid@studio3arc.com>, netfilter@lists.samba.org

yes this is true, you can't make multiple VPN connections to the same host
with this patch but it doesn't stop you from connecting to other hosts.
Which is why I suggested to make a tunnel to connect networks together
rather than client-server... If client security is needed then SSH tunnel
through it..

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Aldo S. Lagana [mailto:alagana@discmail.com]
Sent: Tuesday, 02 July 2002 4:06 AM
To: 'Rowan Reid'; netfilter@lists.samba.org
Subject: RE: PPTP through iptables FW...


Here is what I found on the Netfilter site:

pptp-conntrack-nat 
Author: Harald Welte <laforge@gnumonks.org>
Status: Beta

This adds CONFIG_IP_NF_PPTP:
Connection tracking and NAT support for PPTP.

Note that this code currently has limitations
- can only NAT connections from PNS to PAC
- doesnt' support multiple calls within one session

Here's the link:
http://netfilter.samba.org/documentation/pomlist/pom-extra.html#pptp-con
ntrack-nat



> -----Original Message-----
> From: netfilter-admin@lists.samba.org 
> [mailto:netfilter-admin@lists.samba.org] On Behalf Of Rowan Reid
> Sent: Monday, July 01, 2002 12:44 PM
> To: 'Aldo S. Lagana'; netfilter@lists.samba.org
> Subject: RE: PPTP through iptables FW...
> 
> 
>  
> 
> > Yes I have seen that method for some time now, but I have
> > heard that it doesn't work very well?  
> > I have seen some discussions on this group about that 
> > conntrack module (I think it's a P-O-M module) and was hoping 
> > that it did the same thing as that VPN masquerade link you sent...
> 
> That would be good if we could find a link. I am at the point 
> of reverting to a 
> 2.2.x Kernel and using IPCHAINS since it's proven you know. 
> But I would much Prefer to use 2.4.x 
> 
> 


