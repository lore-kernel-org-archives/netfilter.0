From: "Narendra Prabhu. B" <naren@deeproot.co.in>
Subject: Re: (no subject)
Date: Tue, 24 Dec 2002 11:21:45 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0212241114010.314-100000@abodh.pesit.deeproot.co.in>
References: <F72E9GQvnbEG10Gai4o000000e5@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F72E9GQvnbEG10Gai4o000000e5@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Durgaprasada Kalluraya <dkalluraya@hotmail.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi Durgaprasad,

This same thing had happended with me.... As per my understanding goes
you are doing an active ftp transfer..... Try doing the following in your
ftp client.....

bash#ftp
ftp>open <host>
..
..(authentication stuff)
..
..(after successful authentication)

ftp>passive
..
ftp>


This makes the transfer mode in passive mode.

Hope this works... and let us know the respective results(desired or not).


Bye,
Narendra.

In the middle of difficulty..... lies Opportunity. (Albert Einstein)
--------------------------------------------------------------------
Narendra Prabhu. B             Free Software at its product-ive best.
DeepRoot Linux                             http://www.deeproot.co.in
                ---- Server Appliances ----
             ---- Linux Support and Services ----
-------------------------------------------------------------------

On Thu, 19 Dec 2002, Durgaprasada Kalluraya wrote:
>
>
> Hi,
>
> I have configured our firewall using IPtables. The configuration of the
> firewall is as follows...
> Firewall host has 3 interfaces one for DMZ, one for LAN and one for external
> world(internet). All of our servers have a
> static IP address. Our FTP server is wu-ftpd
>
> Now there is no problem in accessing our DNS, WEB, SMTP and IMAP servers
> from outside. But the FTP server is
> showing some strange problem. When our client tries to do a 'ls' in FTP
> session it is shows the following error message.
>
> ftp> ls
> 200 PORT command successful.
> 425 Can't build data connection: Connection timed out.
> ftp> bye
>
> But if I try the same thing from outside using a dialup connection all works
> fine for me!!!!
>
> when some one tries do a 'ls' from internal LAN on our FTP server then the
> following message is displayed.
> ftp> ls
> 500 Illegal PORT Command
> 425 Can't build data connection: Connection timed out.
> ftp>
>
> Our rules related to FTP server are...
>
> $IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> $IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
> $IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
> $IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT
> $IPTABLES -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
>
>
> $IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -m state --state
> ESTABLISHED,RELATED -j
> ACCEPT
> $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_FTP_IP
> --dport ftp -j allowed
> $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_FTP_IP
> --dport ftp-data -j
> allowed
> $IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $FTP_IP --dport ftp
> -j DNAT --to-destination
> $DMZ_FTP_IP
> $IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $FTP_IP --dport
> ftp-data -j DNAT
> --to-destination $DMZ_FTP_IP
> $IPTABLES -t nat -A POSTROUTING -p TCP -s $LAN_IP_RANGE -j SNAT --to-source
> $DMZ_NAT
>
> where
> DMZ_FTP_IP is IP address of ftp server in DMZ
> DMZ_IP is global IP address of ftp server.
> INET_IFACE is Internet interface on firewall
> DMZ_IFACE is DMZ interface on firewall.
> LAN_IP_RANGE is Lan ip range.
>
> Can anyone help me?
>
> Thanks and Regards
> Durgaprasada
>
> _________________________________________________________________
> Protect your PC - get McAfee.com VirusScan Online
> http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963
>
>
>


