From: "Ranjeet Shetye" <ranjeet.shetye@zultys.com>
Subject: RE: (no subject)
Date: Mon, 23 Dec 2002 11:08:06 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003101c2aab6$a077c9d0$0100a8c0@zultys.com>
References: <1040660441.8287.2.camel@nxitmirms1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1040660441.8287.2.camel@nxitmirms1>
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


Hi Durgaprasada,

You will need to use "modprobe" or "insmod" to load the modules &
"lsmod" if you want to verify that the modules have been loaded.

Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
771 Vaqueros Avenue
Sunnyvale  CA  94085
USA
Ranjeet.Shetye@Zultys.com
http://www.zultys.com/

 


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Marcello Scacchetti
> Sent: Monday, December 23, 2002 8:21 AM
> To: Durgaprasada Kalluraya
> Cc: netfilter@lists.netfilter.org
> Subject: Re: (no subject)
> 
> 
> Hi,
> try to load following kernel modules:
> ip_conntrack.o
> ip_conntrack_ftp.o
> ip_nat_ftp.o
> This should solve your problems.
> 
> Marcello
> 
> Il gio, 2002-12-19 alle 08:33, Durgaprasada Kalluraya ha scritto:
> > Hi,
> > 
> > I have configured our firewall using IPtables. The configuration of 
> > the
> > firewall is as follows...
> > Firewall host has 3 interfaces one for DMZ, one for LAN and 
> one for external 
> > world(internet). All of our servers have a
> > static IP address. Our FTP server is wu-ftpd
> > 
> > Now there is no problem in accessing our DNS, WEB, SMTP and IMAP 
> > servers
> > from outside. But the FTP server is
> > showing some strange problem. When our client tries to do a 
> 'ls' in FTP 
> > session it is shows the following error message.
> > 
> > ftp> ls
> > 200 PORT command successful.
> > 425 Can't build data connection: Connection timed out.
> > ftp> bye
> > 
> > But if I try the same thing from outside using a dialup 
> connection all 
> > works
> > fine for me!!!!
> > 
> > when some one tries do a 'ls' from internal LAN on our FTP 
> server then 
> > the
> > following message is displayed.
> > ftp> ls
> > 500 Illegal PORT Command
> > 425 Can't build data connection: Connection timed out.
> > ftp>
> > 
> > Our rules related to FTP server are...
> > 
> > $IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
> > $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > 
> > $IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
> > $IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
> > $IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT
> > $IPTABLES -A OUTPUT -m state --state 
> NEW,ESTABLISHED,RELATED -j ACCEPT
> > 
> > 
> > $IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -m state --state
> > ESTABLISHED,RELATED -j
> > ACCEPT
> > $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d 
> $DMZ_FTP_IP 
> > --dport ftp -j allowed
> > $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d 
> $DMZ_FTP_IP 
> > --dport ftp-data -j
> > allowed
> > $IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d 
> $FTP_IP --dport ftp 
> > -j DNAT --to-destination
> > $DMZ_FTP_IP
> > $IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d 
> $FTP_IP --dport 
> > ftp-data -j DNAT
> > --to-destination $DMZ_FTP_IP
> > $IPTABLES -t nat -A POSTROUTING -p TCP -s $LAN_IP_RANGE -j 
> SNAT --to-source 
> > $DMZ_NAT
> > 
> > where
> > DMZ_FTP_IP is IP address of ftp server in DMZ
> > DMZ_IP is global IP address of ftp server.
> > INET_IFACE is Internet interface on firewall
> > DMZ_IFACE is DMZ interface on firewall.
> > LAN_IP_RANGE is Lan ip range.
> > 
> > Can anyone help me?
> > 
> > Thanks and Regards
> > Durgaprasada
> > 
> > _________________________________________________________________
> > Protect your PC - get McAfee.com VirusScan Online
> > http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963
> -- 
> Marcello Scacchetti <marcello.scacchetti@nextrem.it>
> 


