From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: PPTP through iptables FW...
Date: Mon, 1 Jul 2002 12:20:32 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <000501c2211b$3923db40$3864a8c0@discmail.com>
References: <002d01c22117$d41c63f0$6b01a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002d01c22117$d41c63f0$6b01a8c0@s3ac>
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


> -----Original Message-----
> From: netfilter-admin@lists.samba.org 
> [mailto:netfilter-admin@lists.samba.org] On Behalf Of Rowan Reid
> Sent: Monday, July 01, 2002 11:56 AM
> To: 'Aldo S. Lagana'; netfilter@lists.samba.org
> Subject: RE: PPTP through iptables FW...
> 
> 
> 
> 
> > I haven't looked into this, but is there a method to connect
> > to a pptp server from behind an iptables firewall?  I have 
> > seen glimpses of persons using something called 
> > ip_conntrack_pptp (sp?) and that seems it will fit the 
> > bill...not sure..here is ASCII art:
> > 
> > Client-----IPTABLES Firewall------INTERNET--------Remote PPTP
> > server------Server
> > 
> > I am currently using IPTables 1.2.5
> >
> 
> I guess I'll just share what I have learned. The below link 
> details pptp filtering. I'm not familiar with conntrack_pptp 
> (assuming this is a module)  The method I have beeb Following 
> is transpaerent but is compiled in as a kernel patch kernel 
> 2.4.17 or earlier. Thus far I'm not getting a stable setup. 
> Ie no filtering thus far. Wouldn't' mind working on this one.
>  
> 
ftp://ftp.rubyriver.com/pub/jhardin/masquerade/ip_masq_vpn.html

Yes I have seen that method for some time now, but I have heard that it
doesn't work very well?  
I have seen some discussions on this group about that conntrack module
(I think it's a P-O-M module) and was hoping that it did the same thing
as that VPN masquerade link you sent...





