From: cldavis@speakeasy.net
Subject: Re: I thought ssh is port #22 ?!!
Date: Thu, 01 Apr 2004 02:10:15 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <W848572655827551080785415@webmail1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org
Cc: Fajar Priyanto <fajarpri@arinet.org>

You should edit sshd_config with the port command and set it to 22.  If the directive is not present, I've had some versions of ssh listen on everything, others only 22.  

You may also want to use the PermitRootLogin no directive to disable root logins and use a regular user account to log in and then su to root if need be.

As far as the firewall, you may want to setup your firewall to drop all packets except packets sent to needed services.

Hope that helps
Chris
> -----Original Message-----
> From: Fajar Priyanto [mailto:fajarpri@arinet.org]
> Sent: Thursday, April 1, 2004 01:32 AM
> To: netfilter@lists.netfilter.org
> Subject: I thought ssh is port #22 ?!!
> 
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi guys,
> I'm not really sure about this. I thought ssh is made in port #22?
> When I made a ssh session into my server, /var/log/messages showed this:
> Apr  1 09:20:20 server2 sshd[2711]: Accepted password for root from 
> 192.168.0.234 port 32873 ssh2
> 
> Why did it use port #32873?
> Is there something wrong with my ssh or firewall?
> TIA,
> - -- 
> Fajar Priyanto | Reg'd Linux User #327841 | http://linux.arinet.org
> 08:31:42 up 36 min, Mandrake Linux release 9.2 (FiveStar) for i586 
> public key: https://www.arinet.org/fajar-pub.key
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.3 (GNU/Linux)
> 
> iD8DBQFAa3EYkp5CsIXuxqURAluBAKCNiyg8+KXYDu/JuZghSVMXvfrjMgCdG7O2
> Bb4SQcbOiAqALl1o9yQ5H1k=
> =4uUZ
> -----END PGP SIGNATURE-----
> 
> 
> 



