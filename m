From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: permanent ip forwarding
Date: 28 Feb 2003 12:42:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046432547.1936.16.camel@kermit.spenneberg.de>
References: <1131.192.168.35.11.1046409994.squirrel@webmail.satconet.com>
	<1046417290.1936.5.camel@kermit.spenneberg.de> 
	<3289.192.168.129.22.1046421799.squirrel@webmail.satconet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3289.192.168.129.22.1046421799.squirrel@webmail.satconet.com>
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
To: muffadal.essaji@mail.intafrica.com
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Fre, 2003-02-28 um 09.43 schrieb muffadal.essaji@mail.intafrica.com:
> hi thanks
> i need to put the ip forwarding permanent .
> how can i do it.
Which distribution?
Check if there is a /etc/sysctl.conf file. If there is you can enter it
there. Otherwise you have to edit your /etc/rc.d/rc.local file.

Cheers,

Ralf
> urgent
> muffadal.
> 
> > Am Fre, 2003-02-28 um 06.26 schrieb muffadal.essaji@mail.intafrica.com:
> >> hi.
> >> i need a step by step prodecure to configure NAT.
> >> I havee eth1 thats my internal internetwork
> >> and eth0 which have a public ip.
> > Ok, lets see.
> > Either you have a static or dynamic public IP.
> >
> > #!/bin/bash
> > # Firewall skript
> > # We need to load several modules for NAT
> > modprobe ip_tables
> > modprobe ip_conntrack_ftp
> > modprobe ip_nat_ftp
> > #In both cases you need to have forwarding on:
> > sysctl -w net.ipv4.ip_forward=1
> > #In both cases you need some rules to forward the traffic:
> > # Drop everything by default
> > iptables -P FORWARD DROP
> > # Allow new connections from the inside
> > iptables -A FORWARD -i eth1 -o eth0 -m state --state NEW -j ACCEPT #
> > Allow established connections to communicate
> > iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT # Now
> > NAT, you want the following rule for a static IP
> > iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to <enter your IP here>
> > # if you use a dynamic IP you need:
> > iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> >
> >
> > Cheers,
> >
> > Ralf
> >> i need all internal machines to access the internet.
> >> i went to documentation but  i went crazy.
> >> urgent help.
> >> yours
> >> muffadal
> >>
> >>
> >>
> > --
> > Ralf Spenneberg
> > RHCE, RHCX
> >
> > IPsec/PPTP Kernels for Red Hat Linux:
> > http://www.spenneberg.com/.net/.org/.de
> > Honeynet Project Mirror:                http://honeynet.spenneberg.org
> > Snort Mirror:                           http://snort.spenneberg.org
> 
> 
-- 
Ralf Spenneberg
RHCE, RHCX

IPsec/PPTP Kernels for Red Hat Linux:  
http://www.spenneberg.com/.net/.org/.de
Honeynet Project Mirror:                http://honeynet.spenneberg.org
Snort Mirror:                           http://snort.spenneberg.org

