From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: port forwarding
Date: Wed, 23 Jul 2003 16:41:07 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BF90@wardrive.citadelcomputer.com.au>
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
To: Sathi <sathiyan@gmx.net>
Cc: "Netfilter Mailling List (E-mail)" <netfilter@lists.netfilter.org>

You can't. FTP doesn't send any header information like http's virtual =
host information on which site it's for.

the only option is to use different ports for different sites..

ftp www.domain/com:10021
ftp www.domain2/com:10022
ftp www.domain3/com:10023

that's the only what I know.

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

-----Original Message-----
From: Sathi [mailto:sathiyan@gmx.net]
Sent: Wednesday, July 23, 2003 4:06 PM
To: Netfilter Mailing List
Subject: port forwarding


Hello All,

I am running squid reverse proxy for 5 different web servers.

I want to provide ftp access to clients so that they can update the web =
page
content.

As all the host name resolve to the single address i find problem in =
port
forward the ftp request to the correct backend web server.

How to make port forward the ftp request to the correct web server using
iptables.

Regards
Sathi




