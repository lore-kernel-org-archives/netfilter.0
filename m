From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: PPTP through iptables FW...
Date: Mon, 1 Jul 2002 14:06:08 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <000901c22129$f9add510$3864a8c0@discmail.com>
References: <000001c2211e$8a6ba0c0$6b01a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000001c2211e$8a6ba0c0$6b01a8c0@s3ac>
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
To: 'Rowan Reid' <rreid@studio3arc.com>, netfilter@lists.samba.org

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


