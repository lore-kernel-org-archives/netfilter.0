From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Exposing Internal Host on Private network to Internet
Date: Mon, 23 Jun 2003 14:56:49 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BDF1@wardrive.citadelcomputer.com.au>
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
To: Bobby Hitt <Bobby.Hitt@bscnet.com>, netfilter@lists.netfilter.org

Run pptpd (PoPToP) for linux and allow them that way??? Makes it easier =
with rules etc.etc.

But I'd prefer IPSEC if I could change it easily enough.

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
From: Bobby Hitt [mailto:Bobby.Hitt@bscnet.com]
Sent: Monday, June 23, 2003 2:37 PM
To: netfilter@lists.netfilter.org
Subject: Exposing Internal Host on Private network to Internet


Hello all,

I have a network using Linux as a gateway/firewall running NAT. This =
works
perfectly to allow 5 internal hosts running Windows 2000/XP/Win98/Linux
access to the Internet. Also the Linux gateway is running openVPN which
allows me a secure connection to my Linux server in Connecticut for my
Windows machines.

I have setup a Windows 2000 Server on my network here running VPN server
that I want to be exposed to the the outside to allow Windows clients
running the VPN client to access the inside network here via the Windows
2000 server. I know I need to route ports 1723 47 for PPTP and 500 and =
50-51
for IPSec to the Windows 2000 Server, but have no idea how to do this =
with
iptables.

I used to run a cable router that allowed one host to be exposed to the
Internet, which is how I want to setup the Linux router.

Any help is appreciated,

Bobby



