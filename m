From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: FTP SERVER ACCESS ( IPT_UNCLEAN PROBLEM?)
Date: Tue, 28 Oct 2003 08:27:20 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C5AD@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Could it be possible it's because you need -m state --state =
RELATED,ESTABLISHED before those rules??

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

> -----Original Message-----
> From: jose nuno neto [mailto:jose.neto@liber4e.com]
> Sent: Tuesday, 28 October 2003 3:01 AM
> To: markee@bandwidthco.com
> Cc: netfilter@lists.netfilter.org
> Subject: RE: FTP SERVER ACCESS ( IPT_UNCLEAN PROBLEM?)
>=20
>=20
> Thanxs for your help,
>=20
> I've dig into the /var/log/messages and found this message everytime i
> tried to connect to the ftp server(it the same as the firewall)
>=20
> Oct 27 16:22:41 bob kernel: ipt_unclean: TCP option 8 after end
>=20
> Did this: tcpdump dst port ftp
>=20
> 16:22:41.317744 213.22.184.162.1844 > bob.liber4e.com.ftp: S
> 2900698949:2900698949(0) win 5840 <mss 1460,eol> (DF)
> 16:22:44.316286 213.22.184.162.1844 > bob.liber4e.com.ftp: S
> 2900698949:2900698949(0) win 5840 <mss 1460,eol> (DF)
> 16:22:50.301330 213.22.184.162.1844 > bob.liber4e.com.ftp: S
> 2900698949:2900698949(0) win 5840 <mss 1460,eol> (DF)
> 16:23:02.313601 213.22.184.162.1844 > bob.liber4e.com.ftp: S
> 2900698949:2900698949(0) win 5840 <mss 1460,eol> (DF)
>=20
> But i dont understand nothing of this, do u?
>=20
> I've found the UN_CLEAN chain from the iptables script and=20
> commented it
> and now ftp works :-)
>=20
> # Block (inbound) Traffic w/ Incorrect Flags
> #$IPT -N IN_UNCLEAN
> #$IPT -t filter -I INPUT -i $IF -m unclean -j IN_UNCLEAN
> #$IPT -t filter -I IN_UNCLEAN -j LOG --log-prefix "** UNCLEAN ** "
> #$IPT -t filter -I IN_UNCLEAN -j UNCLEAN
>=20
> But i dont figured out what was happenning....
> /var/log/messages also shoes this:
> Oct 27 16:24:00 bob kernel: device eth0 entered promiscuous mode
> Oct 27 16:24:26 bob kernel: device eth0 left promiscuous mode
>=20
> Any clues on what happened?
>=20
>=20
> --=20
> Best Regards,
>=20
> Jose' Nuno Neto
> TLM: 00 351 96 2808587
>=20
>=20
>=20

